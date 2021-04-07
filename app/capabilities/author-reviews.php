<?php

namespace StarcatReview\App\Capabilities;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Capabilities\Author_Reviews')) {
    class Author_Reviews
    {
        public function can_show_author_review(array $args = array())
        {
            $post_type = get_post_type();
            // Get author reviews capabilities
            $author_review_caps = isset($args['post_author_review_caps']) ? $args['post_author_review_caps'] : [];

            // check the author review as custom location or not.
            $custom_author_review_location = isset($author_review_caps['enable_ar_custom_location']) && $author_review_caps['enable_ar_custom_location'] == 1 ? true : false;

            // don't show the author reviews if users choose the "ar_post_location" option value as shortcode.
            $use_shorcode = (isset($author_review_caps['ar_post_location']) && $custom_author_review_location && $author_review_caps['ar_post_location'] == 'shortcode') ? true : false;

            // show the author reviews or not for current post
            $can_show_ar_in_post = isset($author_review_caps) && $author_review_caps['can_show_ar_in_post'] != 'dont_show' ? true : false;

            $ar_enabled_post_types = isset($args['ar_enabled_post_types']) ? $args['ar_enabled_post_types'] : [];

            $can_show = (in_array($post_type, $ar_enabled_post_types) && !$use_shorcode && $can_show_ar_in_post) ? true : false;

            return $can_show;
        }
    }
}