<?php

namespace HelpieReviews\Includes\Templates\Controllers;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Controllers\Single_Template')) {
    class Single_Template
    {
        public function __construct()
        {
            $this->reviews_builder = new \HelpieReviews\App\Builders\Review_Builder();
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
