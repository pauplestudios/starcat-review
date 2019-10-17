<?php

namespace StarcatReview\Includes\Templates\Controllers;

use \StarcatReview\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Templates\Controllers\Single_Template')) {
    class Single_Template
    {
        public function __construct()
        {
            $this->reviews_builder = new \StarcatReview\App\Builders\Review_Builder();
        }

        public function get_view($post)
        {
            $html = "<article>";
            $html .= "<h1 class='entry-title title'>" . $post->post_title . "</h1>";
            $html .= "<div class='entry-content content'>";
            $html .= "<p>" . $post->post_content . "</p>";
            $html .= $this->reviews_builder->get_reviews();
            $html .= "</div>";

            $html .= "</article>";

            return $html;
        }
    }
}
