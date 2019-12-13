<?php

namespace StarcatReview\App\Builders;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Builders\Review_Builder')) {
    class Review_Builder
    {
        public function __construct()
        {
            $this->summary = new \StarcatReview\App\Widget_Makers\Summary();
            $this->user_review = new \StarcatReview\App\Widget_Makers\User_Review();
        }

        public function get_reviews()
        {
            $post_type = get_post_type();
            $review_enable_post_types = SCR_Getter::get('review_enable_post-types');
            $user_review_enable_post_types = SCR_Getter::get('ur_enable_post-types');

            $html = '';
            // error_log("is_enable Review : " . $this->is_enable_post_type($post_type, $review_enable_post_types));
            if ($this->is_enable_post_type($post_type, $review_enable_post_types)) {
                $html .= $this->summary->get_view();
                $html .= $this->user_review->get_view();
            }
            // error_log("is_enable User Review : " . $this->is_enable_post_type($post_type, $user_review_enable_post_types));
            // if ($this->is_enable_post_type($post_type, $user_review_enable_post_types)) {
            // }

            return $html;
        }

        public function is_enable_post_type($post_type, $enable_post_types)
        {
            $is_enable = false;
            if (is_string($enable_post_types) && ($post_type == $enable_post_types)) {
                $is_enable = true;
            }
            if (is_array($enable_post_types) && in_array($post_type, $enable_post_types)) {
                $is_enable = true;
            }

            return $is_enable;
        }
    } // END CLASS

}
