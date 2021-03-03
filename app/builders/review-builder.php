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
            $this->user_review = new \StarcatReview\App\Widget_Makers\User_Review();
        }

        public function get_reviews()
        {
            $html = '';
            $post_type = get_post_type();
            $enabled_post_types = SCR_Getter::get_review_enabled_post_types();
            $ur_summary = new \StarcatReview\App\Widget_Makers\User_Review\Summary();
            $settings_args = $ur_summary->get_settings_args();

            if (in_array($post_type, $enabled_post_types)) {
                $html .= $ur_summary->get_summary_view($settings_args);
                $html .= $this->user_review->get_view();
            }

            return $html;
        }

    } // END CLASS

}