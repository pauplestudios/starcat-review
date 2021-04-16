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

            $user_reviews_enabled_post_types = SCR_Getter::get_review_enabled_post_types();
            $user_review_handler = new \StarcatReview\App\Widget_Makers\User_Review\Handler();
            $user_review_lists = new \StarcatReview\App\Widget_Makers\User_Review\Lists();
            $user_review_form = new \StarcatReview\App\Widget_Makers\User_Review\Form();

            $args = $user_review_handler->get_default_args();
            // error_log('[$args] : ' . print_r($args, true));
            // $enabled_user_reviews = (isset($args['enable_user_reviews']) && !empty($args['enable_user_reviews'])) ? true : false;
            $can_show_the_user_review = $this->can_show_the_user_review_by_post_args($args);

            /** check current post_type has configured from user_reviews_enabled_post_types in settings */
            $post_type_enabled = (isset($user_reviews_enabled_post_types) && in_array($post_type, $user_reviews_enabled_post_types)) ? true : false;

            /** display the user review form and list or not  */
            $display_user_review_form_and_list = ($post_type_enabled || $can_show_the_user_review) ? true : false;

            if ($display_user_review_form_and_list) {
                $html .= $user_review_form->get_form($args);
                $html .= $user_review_lists->get_lists_view($args);
            }
            return $html;
        }

        public function get_summary_content(array $post_reviews_caps_args = array())
        {
            $user_review_summary = new \StarcatReview\App\Widget_Makers\User_Review\Summary();
            $settings_args = $user_review_summary->get_settings_args();
            $settings_args = array_merge($settings_args, $post_reviews_caps_args);
            $html = $user_review_summary->get_summary_view($settings_args);
            return $html;
        }

        public function can_show_the_user_review_by_post_args($args)
        {
            // get post_user_review_settings args from post meta
            $post_user_review_settings = isset($args['post_user_review_settings']) && !empty($args['post_user_review_settings']) ? $args['post_user_review_settings'] : [];

            $can_show_the_user_review = false;

            // return false, if empty the user review args
            if (empty($post_user_review_settings)) {
                return $can_show_the_user_review;
            }

            // show/don't show the user review form and list
            $post_level_settings = new \StarcatReview\App\Post_Settings\Post_Level_Settings();
            $can_show_the_user_review = $post_level_settings->can_show_the_review($post_user_review_settings, 'can_show_user_review');
            return $can_show_the_user_review;
        }

    } // END CLASS

}