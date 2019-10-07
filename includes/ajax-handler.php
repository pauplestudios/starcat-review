<?php

namespace HelpieReviews\Includes;

use HelpieReviews\Includes\Utils\Post;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function __construct()
        { }

        public function register_ajax_actions()
        {
            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_listing_action', array($this, 'hrp_listing_action'));
            add_action('wp_ajax_hrp_listing_action', array($this, 'hrp_listing_action'));

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_user_review_submission', [$this, 'user_review_submission']);
            add_action('wp_ajax_hrp_user_review_submission', [$this, 'user_review_submission']);

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_helpiereview_search_posts', [$this, 'search_posts']);
            add_action('wp_ajax_helpiereview_search_posts', [$this, 'search_posts']);
        }

        public function hrp_listing_action()
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
            $user_review_repo = new \HelpieReviews\App\Repositories\User_Reviews_Repo();
            $props = $user_review_repo->get_processed_data();

            $comment_id = $user_review_repo->insert($props);
            $review = $user_review_repo->get($comment_id);

            echo json_encode($review);

            wp_die();
        }

        public function search_posts()
        {
            $args = array(
                'post_type' => array('helpie_reviews'),
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

                    $posts[] = array(
                        'id' => $post->ID,
                        'title' => $post->post_title,
                        'description' => $post->post_content,
                        // 'url' => $post->guid,
                        'stats' => $temp_stats,
                        'image_url' => isset($image) ? $image[0] : ""
                    );
                }
            } else {
                $posts = [];
            }

            echo json_encode($posts);
            wp_die();
        }
    }
}
