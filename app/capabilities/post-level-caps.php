<?php

namespace StarcatReview\App\Capabilities;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Capabilities\Post_Level_Caps')) {
    class Post_Level_Caps
    {
        public function get_author_and_user_reviews_caps(array $params = array())
        {
            $post_id = get_the_ID();
            $post_meta = get_post_meta($post_id, SCR_POST_META, true);
            $caps_args = array(
                'post_author_review_caps' => array(),
                'post_user_review_caps' => array(),
            );

            foreach ($caps_args as $key => $value) {
                if (isset($post_meta[$key]) && !empty($post_meta[$key])) {
                    $caps_args[$key] = $post_meta[$key];
                }
            }

            $this->post_author_and_user_review_caps = $caps_args;
            return $caps_args;
        }

        public function get_caps($caps_args)
        {

            $author_reviews_caps_args = $caps_args['post_author_review_caps'];
            $user_reviews_caps_args = $caps_args['post_user_review_caps'];

            $args = array(
                'show' => 'both', // author_reviews, user_reviews, both, none
                'same_location' => false,
                'ar_location' => 'before',
                'ur_location' => 'after',
            );

            $author_reviews_caps = new \StarcatReview\App\Capabilities\Author_Reviews_Caps();
            $can_show_author_reviews = $author_reviews_caps->can_show_author_review($author_reviews_caps_args);
            $can_show_users_reviews = true;

            /** show both reviews */
            $can_show = ($can_show_author_reviews && $can_show_users_reviews) ? 'both' : 'none';
            if ($can_show == 'none') {
                /** show author reviews only */
                $can_show_author_review_only = (!$can_show_users_reviews && $can_show_author_reviews) ? 'auth_reviews' : 'none';
                /** show users reviews only */
                $can_show = ($can_show_users_reviews && !$can_show_author_reviews) ? 'user_reviews' : $can_show_author_review_only;
            }

            $ar_location = $author_reviews_caps->get_location();
            $ur_location = $user_reviews_caps_args['location'];

            $both_are_same_location = (($ar_location == $ur_location) && ($ar_location != 'shorcode' && $ur_location != 'shortcode')) ? true : false;

            $args['show'] = $can_show;
            $args['ar_location'] = $ar_location;
            $args['same_location'] = $both_are_same_location;
            return $args;
        }
    }
}