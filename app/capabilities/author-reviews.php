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
            $post_author_review_caps = isset($args['post_author_review_caps']) ? $args['post_author_review_caps'] : [];
            $can_show_ar_in_post = isset($post_author_review_caps) ? $post_author_review_caps['can_show_ar_in_post'] : 'apply_global_settings';
            $ar_enabled_post_types = isset($args['ar_enabled_post_types']) ? $args['ar_enabled_post_types'] : [];
            $can_show = (in_array($post_type, $ar_enabled_post_types) && $can_show_ar_in_post != 'dont_show') ? true : false;
            return $can_show;
        }
    }
}