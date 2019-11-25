<?php

namespace StarcatReview\App\Templates\Controllers;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Templates\Controllers\Single_Template')) {
    class Single_Template
    {
        public function __construct()
        {
            $this->reviews_builder = new \StarcatReview\App\Builders\Review_Builder();
            $this->review_schema = new \StarcatReview\App\Schema_Builder();
        }

        public function get_view($post)
        {
            $html = '<div id="primary">';
            $html .= '<main id="main" class="site-main" role="main">';

            $html .= "<article>";
            $html .= "<h1 class='entry-title title'>" . $post->post_title . "</h1>";
            $html .= "<div class='entry-content content'>";
            $html .= "<p>" . $post->post_content . "</p>";
            $html .= $this->reviews_builder->get_reviews();
            $html .= "</div>";

            $html .= "</article>";

            $html .= "</main>";
            $html .= "</div>"; // #primary

            $review_scrits = $this->review_schema->get_post_review_schema();
            $html .= $review_scrits;
            return $html;
        }
    }
}
