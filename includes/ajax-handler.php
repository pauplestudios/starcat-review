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
            add_action('wp_ajax_hrp_listing_action', array($this, 'hrp_listing_action'));
            add_action('wp_ajax_hrp_listing_action', array($this, 'hrp_listing_action'));

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_user_review', [$this, 'user_review']);
            add_action('wp_ajax_hrp_user_review', [$this, 'user_review']);
        }

        public function hrp_listing_action()
        {
            error_log('wp_ajax_hrp_listing_action');
        }

        public function user_review()
        {
            error_log(print_r($_POST, true));
            echo json_encode($_POST);
            // error_log('User Review');
            wp_die();
        }
    } // END CLASS
}
