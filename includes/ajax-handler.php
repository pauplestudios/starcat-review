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
            // $user_reviews_repo = new \HelpieReviews\App\Repositories\User_Reviews_Repo();
            // $user_reviews_repo->insert();

            error_log(print_r($_POST, true));
            echo json_encode($_POST);

            wp_die();
        }
    } // END CLASS
}
