<?php

namespace StarcatReview\Includes;

use StarcatReview\Includes\Utils\Post;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function __construct()
        { }

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
        }

        public function scr_listing_action()
        {

            if (isset($_GET['search'])) {
                $search_query = $_GET['search'];

                // Check the query variable is available
                // If not, global it so it can be read from
                if (!$wp_query) global $wp_query;

                $query = array(
                    'the_title' => $search_query
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
            $user_review_repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
            $props = $user_review_repo->get_processed_data();

            $comment_id = $user_review_repo->insert($props);
            $review = $user_review_repo->get($comment_id);

            echo json_encode($review);

            wp_die();
        }

        public function search_posts()
        {
            $summary = new \StarcatReview\App\Summary();

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
                    $temp_stats = [
                        '0' => [
                            'stat_name' => 'quality',
                            'rating' => '2',
                        ],
                        '1' => [
                            'stat_name' => 'battery performance',
                            'rating'    => '4.3'
                        ],
                        '2' => [
                            'stat_name' => 'camera quality',
                            'rating'    => '4.2'
                        ],
                        '3' => [
                            'stat_name' => 'extras_1',
                            'rating'    => '4.2'
                        ],
                        '4' => [
                            'stat_name' => 'extras_2',
                            'rating'    => '4.2'
                        ],
                        '5' => [
                            'stat_name' => 'extras_3',
                            'rating'    => '4.2'
                        ],

                    ];
                    if (has_post_thumbnail($post->ID)) {
                        $image = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID));
                    }

                    $author_stats = get_post_meta($post->ID, '_scr_post_options', true);
                    // $default_args = $summary->get_default_args();

                    $items = [];
                    if (isset($author_stats['stats-list']) || !empty($author_stats['stats-list'])) {
                        // $items['stats-list'] = $author_stats['stats-list'];
                        $author_stats_lists = $author_stats['stats-list'];
                        foreach ($author_stats_lists as $author_stat_item) {
                            $items[]  = $author_stat_item;
                        }
                    }

                    $posts[] = array(
                        'id' => $post->ID,
                        'title' => $post->post_title,
                        'description' => $post->post_content,
                        // 'url' => $post->guid,
                        'stats' => $temp_stats,
                        'image_url' => isset($image) ? $image[0] : "",
                        'author_stats'  => $items

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
