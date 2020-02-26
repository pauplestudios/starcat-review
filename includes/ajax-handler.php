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

            //Aajax for Photos Review
            add_action('wp_ajax_nopriv_scr_phtos_review', [$this, 'photos_review']);
            add_action('wp_ajax_scr_phtos_review', [$this, 'photos_review']);
        }

        public function photos_review()
        {
            $response = apply_filters('scr_photos_review/ajax', $_POST);
            echo json_encode($response);
            wp_die();
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
            error_log('user_review_submission');
            // $response = $_POST["captcha-response-manual"];
            // error_log('$response : ' . print_r($response, true));

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

            // error_log('$props : ' . print_r($props, true));
            $parent = isset($props['parent']) ? $props['parent'] : 0;
            $comment_id = isset($props['methodType']) ? $user_review_repo->update($props) : $user_review_repo->insert($props);
            $review = $user_review_repo->get($comment_id, $parent);

            if ($parent !== 0 && !isset($props['methodType'])) { // review_reply
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
            // $summary = new \StarcatReview\App\Summary();

            $args = array(
                'post_type' => array(SCR_POST_TYPE),
                'post_status' => array('publish'),
                'nopaging' => true,
                'order' => 'ASC',
                'orderby' => 'menu_order',
            );

            $results = new \WP_Query($args);

            if ($results->have_posts()) {

                foreach ($results->posts as $post) {
                    // $temp_stats = [
                    //     '0' => [
                    //         'stat_name' => 'quality',
                    //         'rating' => '2',
                    //     ],
                    //     '1' => [
                    //         'stat_name' => 'battery performance',
                    //         'rating'    => '4.3'
                    //     ],
                    //     '2' => [
                    //         'stat_name' => 'camera quality',
                    //         'rating'    => '4.2'
                    //     ],
                    //     '3' => [
                    //         'stat_name' => 'extras_1',
                    //         'rating'    => '4.2'
                    //     ],
                    //     '4' => [
                    //         'stat_name' => 'extras_2',
                    //         'rating'    => '4.2'
                    //     ],
                    //     '5' => [
                    //         'stat_name' => 'extras_3',
                    //         'rating'    => '4.2'
                    //     ],

                    // ];
                    if (has_post_thumbnail($post->ID)) {
                        $image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID));
                    }

                    $author_stats = get_post_meta($post->ID, '_scr_post_options', true);
                    // $default_args = $summary->get_default_args();

                    $get_comments = scr_get_user_reviews($post->ID);

                    $user_stats = array();
                    //default view rating feature in CT
                    $user_stats[] = array('stat_name' => 'scr-ratings', 'rating' => 0);
                    if (isset($get_comments) && !empty($get_comments)) {
                        foreach ($get_comments as $comment) {
                            if (isset($comment->reviews)) {
                                $review = $comment->reviews;
                                $stats = $review['stats'];
                                if (count($stats) > 0) {
                                    foreach ($stats as $stat) {
                                        $user_stats[] = $stat;
                                    }
                                }
                            }
                        }
                    }

                    $items = [];
                    //default view rating feature in CT
                    $items[] = array('stat_name' => 'scr-ratings', 'rating' => 0);
                    if (isset($author_stats['stats-list']) || !empty($author_stats['stats-list'])) {
                        // $items['stats-list'] = $author_stats['stats-list'];
                        $author_stats_lists = $author_stats['stats-list'];
                        foreach ($author_stats_lists as $author_stat_item) {
                            $items[] = $author_stat_item;
                        }
                    }
                    $get_overall_stat = scr_get_overall_rating($post->ID);
                    $posts[] = array(
                        'id' => $post->ID,
                        'title' => substr(wp_strip_all_tags($post->post_title), 0, 25) . '...',
                        'description' => $post->post_content,
                        // 'url' => $post->guid,
                        // 'stats' => $temp_stats,
                        'image_url' => isset($image) ? $image[0] : "",
                        'author_stats' => $items,
                        'user_stats' => $user_stats,
                        'get_overall_stat' => $get_overall_stat,
                    );
                }
            } else {
                $posts = [];
            }

            echo json_encode($posts);
            wp_die();
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
