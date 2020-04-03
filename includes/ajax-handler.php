<?php

namespace StarcatReview\Includes;

use StarcatReview\Includes\Settings\SCR_Getter;
use \StarcatReview\Services\Recaptcha as Recaptcha;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function __construct()
        {
        }

        public function register_ajax_actions()
        {
            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_scr_listing_action', array($this, 'scr_listing_action'));
            add_action('wp_ajax_scr_listing_action', array($this, 'scr_listing_action'));

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_scr_user_review_submission', [$this, 'user_review_submission']);
            add_action('wp_ajax_scr_user_review_submission', [$this, 'user_review_submission']);

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_scr_search_posts', [$this, 'search_posts']);
            add_action('wp_ajax_scr_search_posts', [$this, 'search_posts']);

            // Ajax Hooks In compare table
            add_action('wp_ajax_nopriv_get_scr_results', [$this, 'get_scr_results']);
            add_action('wp_ajax_get_scr_results', [$this, 'get_scr_results']);

            // Vote Submission ajax for User Review
            add_action('wp_ajax_nopriv_scr_user_review_vote', [$this, 'vote_handler']);
            add_action('wp_ajax_scr_user_review_vote', [$this, 'vote_handler']);
        }

        public function scr_listing_action()
        {

            if (isset($_GET['search'])) {
                $search_query = $_GET['search'];

                // Check the query variable is available
                // If not, global it so it can be read from
                if (!$wp_query) {
                    global $wp_query;
                }

                $query = array(
                    'the_title' => $search_query,
                    // 'the_content' => $search_query
                );

                $search_results = new WP_Query($query);

                // error_log("Results : " .print_r($search_results, true));
                echo json_encode($search_results);
            }
            return 1;
        }

        public function user_review_submission()
        {
            // $response = $_POST["captcha-response-manual"];

            if (SCR_Getter::get('ur_show_captcha')) {
                $captcha_success = Recaptcha::verify();
                if ($captcha_success == false) {
                    echo json_encode("BOT!");
                    wp_die();
                }
                error_log('captcha_success : ' . $captcha_success);
            }

            $user_review_repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
            $props = $user_review_repo->get_processed_data();

            $comment_id = (isset($props['methodType']) && $props['methodType'] === 'PUT') ? $user_review_repo->update($props) : $user_review_repo->insert($props);
            $review = $user_review_repo->get($comment_id, $props['parent']);

            if ($props['parent'] !== 0 && !isset($props['methodType'])) { // review_reply
                $review_controller = new \StarcatReview\App\Components\User_Reviews\Controller();
                $review = $review_controller->get_reply_review($review);
            }

            echo json_encode($review);
            wp_die();
        }

        public function vote_handler()
        {
            $ur_repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
            $props = $ur_repo->get_processed_voting_data();
            // error_log('props : ' . print_r($props, true));
            $ur_repo->store_vote($props);
            $props = $ur_repo->get($props['comment_id']);

            echo json_encode($props);

            wp_die();
        }

        public function search_posts()
        {
            $get_post_types = SCR_Getter::get('review_enable_post-types');
            $args = array(
                'post_type' => $get_post_types,
                'post_status' => array('publish'),
                'nopaging' => true,
                'order' => 'ASC',
                'orderby' => 'menu_order',
            );
            $get_global_stats = SCR_Getter::get('global_stats');
            $global_stats = array();
            if (count($get_global_stats) > 0) {
                foreach ($get_global_stats as $stat) {
                    $global_stats[] = strtoupper($stat['stat_name']);
                }
            }


            $results = new \WP_Query($args);
            $posts = array();
            if ($results->have_posts()) {
                
                foreach ($results->posts as $post) {

                    if (has_post_thumbnail($post->ID)) {
                        $image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID));
                    }

                    $scr_get_user_reviews = scr_get_user_reviews($post->ID);
                    $src_user_review_process = $this->process_user_stat_review($scr_get_user_reviews, $global_stats);
                    
                    // error_log("post" . print_r($post, true));
                    $scr_get_overall_rating = scr_get_overall_rating($post->ID);
                    $posts[] = array(
                        'id' => $post->ID,
                        'title' => substr(wp_strip_all_tags($post->post_title), 0, 25) . '...',
                        'description' => substr(wp_strip_all_tags($post->post_content), 0, 46) . '...',
                        // 'url' => $post->guid,
                        'image_url' => isset($image) ? $image[0] : "",
                        'user_stats'    => $src_user_review_process,
                        'get_overall_stat' => $scr_get_overall_rating
                    );
                }
            }

            echo json_encode($posts);
            wp_die();
        }

        public function process_user_stat_review($args, $global_stats)
        {
            $stats = array();
            if (count($args) > 0) {
                foreach ($args as $post_user_reviews) {
                    $reviews = isset($post_user_reviews->reviews) ? $post_user_reviews->reviews : [];
                    if (isset($reviews) && count($reviews) > 0) {
                        $stats['ratings'] = $reviews['rating'];
                        $user_stats = $reviews['stats'];

                        $active_user_review_stats = array();
                        $active_user_review_stats['SCR_CT_RATINGS'] = array('stat_name' => 'scr_rating', 'value' => 0);
                        if (count($user_stats) > 0) {
                            foreach ($user_stats as $stat_index => $single_stat) {
                                $stat_index   = strtoupper($stat_index);
                                if (in_array($stat_index, $global_stats)) {
                                    $active_user_review_stats[$stat_index] = $single_stat;
                                }
                            }
                        }
                        if (count($active_user_review_stats) > 0) {
                            foreach ($global_stats as $global_stat) {
                                $stat_name   = strtoupper($global_stat);

                                if (array_key_exists($stat_name, $active_user_review_stats)) {
                                    // is found key
                                } else {
                                    $active_user_review_stats[$stat_name] = array(
                                        'stat_name' => $stat_name,
                                        'rating'    => 0
                                    );
                                }
                            }
                        }
                        $stats['review_stats'] = $active_user_review_stats;
                    }
                }
            } else {
                if (count($global_stats) > 0) {
                    $get_not_found_user_reviews = $this->not_found_user_reviews($global_stats);
                    $stats['rating']  = 0;
                    $stats['review_stats'] = $get_not_found_user_reviews;
                }
            }

            return $stats;
        }

        public function not_found_user_reviews($global_stats){
            $stat_args = array();
            $stat_args['SCR_CT_RATINGS'] = array('stat_name' => 'scr_rating', 'value' => 0);
            foreach ($global_stats as $global_stat) {
                $stat_name   = strtoupper($global_stat);
                $stat_args[$stat_name] = array(
                    'stat_name' => strtoupper($stat_name),
                    'rating'    => 0
                );
            }
            return $stat_args;
        }

        public function get_scr_results()
        {
            //get scr resultSets
            //echo "get scr resultSets";
            $search_key = $_REQUEST['search_key'];
            $comparison_controller = new \StarcatReview\App\Components\Comparison\Controller();
            $scr_search_result_sets = $comparison_controller->get_scr_details($search_key);
            wp_die();
        }
    }
}
