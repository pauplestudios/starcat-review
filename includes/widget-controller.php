<?php

namespace StarcatReview\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Widget_Controller')) {
    class Widget_Controller
    {

        public function __construct()
        { }

        public function load()
        {
            $listing_widget_loader = new \StarcatReview\App\Widget_Makers\Review_Listing\Controller();
            $listing_widget_loader->load();

            $comparisonTable_widget_loader = new \StarcatReview\App\Widget_Makers\Comparison\Loader();
            $comparisonTable_widget_loader->load();
        }
    } // END CLASS

}
