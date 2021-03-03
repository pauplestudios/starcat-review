<?php

namespace StarcatReview\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

use StarcatReview\Includes\Settings\SCR_Getter;

if (!class_exists('\StarcatReview\Includes\Shortcodes')) {
    class Shortcodes
    {

        public function __construct()
        {
            add_shortcode('starcat_review_list', array($this, 'reviews_list'));
            add_shortcode('starcat_review_comparison_table', array($this, 'comparison_table'));

            /** shortcodes for individual component */
            add_shortcode('starcat_review_summary', array($this, 'review_summary'));
            add_shortcode('starcat_review_user_review_form', array($this, 'user_review_form'));
            add_shortcode('starcat_review_user_review_list', array($this, 'user_review_list'));

            /** shortcodes for overall component */
            add_shortcode('starcat_review_user_review', array($this, 'user_review'));

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
            $user_args = array(
                'post_id' => get_the_ID(),
            );
            $user_args = shortcode_atts($user_args, $atts);
            $user_review_handler = new \StarcatReview\App\Widget_Makers\User_Review\Handler();
            $form = new \StarcatReview\App\Widget_Makers\User_Review\Form();
            $args = $user_review_handler->get_default_args($user_args);
            return $form->get_form($args);
        }

        public function user_review_list($atts)
        {
            $user_args = array(
                'post_id' => get_the_ID(),
            );
            $user_args = shortcode_atts($user_args, $atts);
            $user_review_handler = new \StarcatReview\App\Widget_Makers\User_Review\Handler();
            $lists = new \StarcatReview\App\Widget_Makers\User_Review\Lists();
            $args = $user_review_handler->get_default_args($user_args);
            return $lists->get_lists_view($args);
        }

        public function review_summary($atts)
        {
            $widget_maker_summary = new \StarcatReview\App\Widget_Makers\Summary();
            $defaults = $widget_maker_summary->get_default_args();
            $args = shortcode_atts($defaults, $atts);
            $args = array_merge($args, array(
                'enable-author-review' => SCR_Getter::get('enable-author-review'),
                'enable_pros_cons' => SCR_Getter::is_enabled_pros_cons(),
                'review_count' => scr_get_user_reviews_count(get_the_ID()),
            ));
            $args = array_merge($args, $widget_maker_summary->get_default_args());
            $summary = new \StarcatReview\App\Components\Summary\Controller();
            $view = $summary->get_view($args);
            return $view;
        }

        public function user_review($atts)
        {
            // default attributes
            // $default_args = [
            //     'show_pros_cons' => true,
            //     'show_overall_only' => false,
            //     'show_stats' => true,
            //     'post_ids' => [],
            // ];
            // $args = shortcode_atts($default_args, $atts);
            // $widget_maker_summary = new \StarcatReview\App\Widget_Makers\Summary();
            // $defaults = $widget_maker_summary->get_default_args();
            // // $args = shortcode_atts($defaults, $atts);
            // $args = array_merge($args, array(
            //     'enable-author-review' => SCR_Getter::get('enable-author-review'),
            //     'enable_pros_cons' => SCR_Getter::is_enabled_pros_cons(),
            //     'review_count' => scr_get_user_reviews_count(get_the_ID()),
            // ));
            // $args = array_merge($args, $widget_maker_summary->get_default_args());
            // $summary = new \StarcatReview\App\Components\Summary\Controller();
            // $summary_view = $summary->get_view($args);

            // $ur_controller = new \StarcatReview\App\Widget_Makers\User_Review();
            // $defaults = $ur_controller->get_user_review_default_args();
            // $args = shortcode_atts($defaults, $atts);
            // $review_list_view = $ur_controller->get_user_review_list_view($args);

            // $form_controller = new \StarcatReview\App\Components\Form\Controller();
            // $ur_controller = new \StarcatReview\App\Widget_Makers\User_Review();
            // $form_defaults = $ur_controller->get_user_review_default_args();
            // $form_defaults_args = shortcode_atts($form_defaults, $args);
            // $form_view = $form_controller->get_view($form_defaults_args);
            // return;
            // return $summary_view . $form_view . $review_list_view;
        }
    } // END CLASS

}