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
        }

        public function hrp_listing_action()
        {
            error_log('wp_ajax_hrp_listing_action');
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
