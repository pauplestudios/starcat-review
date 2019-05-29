<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Shortcodes')) {
    class Shortcodes
    {

        public function __construct()
        {
            add_shortcode('helpie_reviews_list', array($this, 'reviews_list'));
        }
        public function reviews_list()
        {
            $user_review_controller = new \HelpieReviews\App\Controllers\User_Reviews_Controller();
            return $user_review_controller->get_view();
        }

    } // END CLASS

}