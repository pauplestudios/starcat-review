<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Widget_Controller')) {
    class Widget_Controller
    {

        public function __construct()
        { }

        public function load()
        {
            $listing_widget = new \HelpieReviews\App\Widget_Makers\Listing();
            $listing_widget->load();
        }
    } // END CLASS

}