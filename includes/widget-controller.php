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
            $listing_widget_loader = new \HelpieReviews\App\Widget_Makers\Review_Listing\Review_Listing();
            $listing_widget_loader->load();

            // $comparisonTable_widget_loader = new \HelpieReviews\App\Widget_Makers\Comparison\Loader();
            // $comparisonTable_widget_loader->load();
        }
    } // END CLASS

}
