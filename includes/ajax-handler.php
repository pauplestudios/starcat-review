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
        }

        public function search_posts()
        {
            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_user_review_submission', [$this, 'user_review_submission']);
            add_action('wp_ajax_hrp_user_review_submission', [$this, 'user_review_submission']);
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
    } // END CLASS
}


$ajax_hanlder = new \HelpieReviews\Includes\Ajax_Handler();

add_action('wp_ajax_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']);
// add 'ajax' action when not logged in
add_action('wp_ajax_nopriv_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']);