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
            $html = '';
            $post_type = get_post_type();
            $enabled_post_types = SCR_Getter::reviews_enabled_post_types();

            if (in_array($post_type, $enabled_post_types)) {
                $html .= $this->summary->get_view();
                $html .= $this->user_review->get_view();
            }

            return $html;
        }

    } // END CLASS

}
