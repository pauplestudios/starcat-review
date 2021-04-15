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
            $user_review_handler = new \StarcatReview\App\Widget_Makers\User_Review\Handler();
            $user_review_lists = new \StarcatReview\App\Widget_Makers\User_Review\Lists();
            $user_review_form = new \StarcatReview\App\Widget_Makers\User_Review\Form();

            $args = $user_review_handler->get_default_args();
            $enabled_user_reviews = (isset($args['enable_user_reviews']) && !empty($args['enable_user_reviews'])) ? true : false;

            /** show the user review form and list  */
            $show_user_review_form_and_list = (in_array($post_type, $enabled_post_types) && $enabled_user_reviews) ? true : false;

            if ($show_user_review_form_and_list) {
                $html .= $user_review_form->get_form($args);
                $html .= $user_review_lists->get_lists_view($args);
            }
            return $html;
        }

        public function get_summary_content($post_reviews_caps_args)
        {
            $user_review_summary = new \StarcatReview\App\Widget_Makers\User_Review\Summary();
            $settings_args = $user_review_summary->get_settings_args();
            $settings_args = array_merge($settings_args, $post_reviews_caps_args);
            $html = $user_review_summary->get_summary_view($settings_args);
            return $html;
        }

    } // END CLASS

}