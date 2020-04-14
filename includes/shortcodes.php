<?php

namespace StarcatReview\Includes;

use \StarcatReview\App\Repositories\Category_Posts_Repo as Category_Posts_Repo;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Shortcodes')) {
    class Shortcodes
    {

        public function __construct()
        {
            add_shortcode('starcat_review_list', array($this, 'reviews_list'));
            add_shortcode('starcat_review_comparison_table', array($this, 'comparison_table'));
        }

        public function comparison_table($atts)
        {
            $ct_widget = new \StarcatReviewCt\Widgets\Comparison\Widget();
            $dafaults_args = $ct_widget->get_default_args();
            $widget_args = shortcode_atts($dafaults_args, $atts);
            return $ct_widget->get_view($widget_args);
        }
        public function reviews_list($atts)
        {

            $review_listing_widget = new \StarcatReviewCpt\Widgets\Review_Listing\Controller();
            $defaults = $review_listing_widget->get_default_args();
            $widget_args = shortcode_atts($defaults, $atts);
            return $review_listing_widget->get_view($widget_args);
        }
    } // END CLASS

}
