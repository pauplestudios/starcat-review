<?php

namespace StarcatReview\App\Post_Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly
use StarcatReview\Includes\Settings\SCR_Getter;

if (!class_exists('\StarcatReview\App\Post_Settings\Post_Level_Settings')) {
    class Post_Level_Settings
    {
        public function get_author_and_user_reviews_settings(array $params = array())
        {
            $post_id = get_the_ID();
            $post_meta = get_post_meta($post_id, SCR_POST_META, true);
            $post_settings_args = array(
                'post_author_review_settings' => array(),
                'post_user_review_settings' => array(),
            );

            foreach ($post_settings_args as $key => $value) {
                if (isset($post_meta[$key]) && !empty($post_meta[$key])) {
                    $post_settings_args[$key] = $post_meta[$key];
                }
            }
            error_log('[$post_settings_args] : ' . print_r($post_settings_args, true));
            return $post_settings_args;
        }

        public function get_summary_args_by_post_settings(array $post_settings_args)
        {
            $args = array(
                'before' => array(),
                'after' => array(),
            );

            $author_reviews_settings_args = $post_settings_args['post_author_review_settings'];
            $user_reviews_settings_args = $post_settings_args['post_user_review_settings'];

            $author_review_enabled_global_settings = $author_reviews_settings_args['can_show_ar'] == 'apply_global_settings' ? true : false;
            $user_review_enabled_global_settings = $user_reviews_settings_args['can_show_ur'] == 'apply_global_settings' ? true : false;

            $author_review_location = $author_reviews_settings_args['location'];
            $user_review_location = $user_reviews_settings_args['location'];

            // $both_are_custom_location = ($author_reviews_settings_args['custom_location'] && $user_reviews_settings_args['custom_location']) ? true : false;
            // $not_in_custom_location = (!$both_are_custom_location) ? true : false;

            // $both_location_same_by_meta = (($author_review_location == $user_review_location) && ($author_review_location != 'shorcode' && $user_review_location != 'shortcode')) ? true : false;

            $can_show_author_reviews = $this->can_show_the_review($author_reviews_settings_args, 'can_show_ar');
            $can_show_users_reviews = $this->can_show_the_review($user_reviews_settings_args, 'can_show_ur');

            /** show both reviews */
            $can_show_the_review = ($can_show_author_reviews && $can_show_users_reviews) ? 'both' : 'none';

            if ($can_show_the_review == 'none') {

                /** show author reviews only */
                $can_show_the_review = (!$can_show_users_reviews && $can_show_author_reviews) ? 'auth_reviews' : 'none';

                /** show users reviews only, else show the author review (or) none of both*/
                $can_show_the_review = ($can_show_users_reviews && !$can_show_author_reviews) ? 'user_reviews' : $can_show_the_review;
            }

            $enable_author_review = ($can_show_the_review == 'both' || $can_show_the_review == 'auth_reviews') ? true : false;
            $enable_user_review = ($can_show_the_review == 'both' || $can_show_the_review == 'user_reviews') ? true : false;

            foreach ($args as $key => $value) {

                /** Get the default summary args */
                $summary_args = $this->get_default_summary_args($key);
                $author_review = false;
                $user_review = false;

                if ($key == 'after') {
                    $author_review = ($enable_author_review && $author_review_location == 'after') ? true : false;
                    $user_review = ($enable_user_review && $user_review_location == 'after') ? true : false;
                } else {
                    $author_review = ($enable_author_review && $author_review_location == 'before') ? true : false;
                    $user_review = ($enable_user_review && $user_review_location == 'before') ? true : false;
                }

                $summary_args['enable-author-review'] = $author_review;
                $summary_args['enable_pros_cons'] = $author_review;
                $summary_args['enable_user_reviews'] = $user_review;

                $args[$key] = $summary_args;
            }
            error_log('[$args] : ' . print_r($args, true));
            return $args;
        }

        public function can_show_the_review(array $review_settings, string $review_type)
        {
            $can_show = false;

            // show the user (or) author reviews or not
            $can_show_the_review = isset($review_settings) && $review_settings[$review_type] != 'dont_show' ? true : false;

            if (!$can_show_the_review) {
                return $can_show;
            }

            // check the user (or) author review as custom location or not.
            $custom_location = ($review_settings['custom_location'] == 1) ? true : false;

            // don't show the user (or) author reviews if users choose the "location" option value as shortcode.
            $use_shortcode = ($custom_location && $review_settings['location'] == 'shortcode') ? true : false;

            if ($use_shortcode) {
                return $can_show;
            }

            $post_type = get_post_type();

            $author_review_enabled_post_types = SCR_Getter::get('author_review_enabled_post_types');

            $can_show_the_review = (in_array($post_type, $author_review_enabled_post_types)) ? true : false;

            return $can_show_the_review;
        }

        public function get_default_summary_args(string $type_of_location = 'after')
        {
            $args = array(
                'enable-author-review' => 0,
                'enable_pros_cons' => 0,
                'enable_user_reviews' => 0,
                'enable_atthachments' => ($type_of_location == 'after') ? 1 : 0,
            );

            return $args;
        }
    }
}