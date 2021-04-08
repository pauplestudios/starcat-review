<?php

namespace StarcatReview\App\Capabilities;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

use StarcatReview\Includes\Settings\SCR_Getter;

if (!class_exists('\StarcatReview\App\Capabilities\Author_Reviews_Caps')) {
    class Author_Reviews_Caps
    {
        public static $can_show_ar = 'show';
        public static $location = 'after';
        public static $custom_location = 0;

        public function can_show_author_review(array $author_review_caps)
        {
            $post_type = get_post_type();

            self::$can_show_ar = $author_review_caps['can_show_ar'];
            self::$custom_location = $author_review_caps['custom_location'];
            self::$location = $author_review_caps['location'];

            $ar_enabled_post_types = SCR_Getter::get('ar_enabled_post_types');

            // check the author review as custom location or not.
            $custom_location = isset($author_review_caps['custom_location']) && $author_review_caps['custom_location'] == 1 ? true : false;

            // don't show the author reviews if users choose the "location" option value as shortcode.
            $use_shortcode = (isset($author_review_caps['location']) && $custom_location && $author_review_caps['location'] == 'shortcode') ? true : false;

            // show the author reviews or not for current post
            $can_show_ar = isset($author_review_caps) && $author_review_caps['can_show_ar'] != 'dont_show' ? true : false;

            $can_show = (in_array($post_type, $ar_enabled_post_types) && !$use_shortcode && $can_show_ar) ? true : false;

            return $can_show;
        }

        public function get_location()
        {
            return self::$location;
        }

        public function get_custom_location()
        {
            return self::$custom_location;
        }
    }
}