<?php

namespace StarcatReview\Includes;

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

            add_shortcode('starcat_review_summary', array($this, 'review_summary'));
            add_shortcode('starcat_review_user_review_form', array($this, 'user_review_form'));
            add_shortcode('starcat_review_user_review_list', array($this, 'user_review_list'));
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

        public function user_review_form($atts)
        {
            // required attributes - post_id
            $form_controller = new \StarcatReview\App\Components\Form\Controller();
            $ur_controller = new \StarcatReview\App\Widget_Makers\User_Review();
            $defaults = $ur_controller->get_user_review_default_args();
            $args = shortcode_atts($defaults, $atts);
            return $form_controller->get_view($args);
        }

        public function user_review_list($atts)
        {
            $ur_controller = new \StarcatReview\App\Widget_Makers\User_Review();
            $defaults = $ur_controller->get_user_review_default_args();
            $args = shortcode_atts($defaults, $atts);
            $review_list_view = $ur_controller->get_user_review_list_view($args);
            return $review_list_view;
        }

        public function review_summary($atts)
        {

        }
    } // END CLASS

}