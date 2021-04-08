<?php

namespace StarcatReview\App\Builders;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Builders\Review_Builder')) {
    class Review_Builder
    {
        public function get_reviews()
        {
            $html = '';
            $post_type = get_post_type();
            $enabled_post_types = SCR_Getter::get_review_enabled_post_types();
            $ur_handler = new \StarcatReview\App\Widget_Makers\User_Review\Handler();
            $ur_lists = new \StarcatReview\App\Widget_Makers\User_Review\Lists();
            $ur_form = new \StarcatReview\App\Widget_Makers\User_Review\Form();

            $args = $ur_handler->get_default_args();
            $enabled_user_reviews = (isset($args['enable_user_reviews']) && !empty($args['enable_user_reviews'])) ? true : false;

            /** can see the review form and review list-summary  */
            $show_form_and_list_summary = (in_array($post_type, $enabled_post_types) && $enabled_user_reviews) ? true : false;

            if ($show_form_and_list_summary) {
                $html .= $ur_form->get_form($args);
                $html .= $ur_lists->get_lists_view($args);
            }
            return $html;
        }

        public function get_summary_content($post_reviews_caps_args)
        {
            $ur_summary = new \StarcatReview\App\Widget_Makers\User_Review\Summary();
            $settings_args = $ur_summary->get_settings_args();
            $settings_args = array_merge($settings_args, $post_reviews_caps_args);
            $html = $ur_summary->get_summary_view($settings_args);
            return $html;
        }

    } // END CLASS

}