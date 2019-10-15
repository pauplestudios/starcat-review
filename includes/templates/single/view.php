<?php

namespace HelpieReviews\Includes\Templates\Single;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Single\View')) {
    class View
    {
        public function __construct($post)
        {
            $this->post = $post;
            $this->reviews_builder = new \HelpieReviews\App\Builders\Review_Builder();
        }

        public function get_html()
        {
            $html = "<article>";
            $html .= "<h1 class='entry-title title'>" . $this->post->post_title . "</h1>";
            $html .= "<div class='entry-content content'>";
            $html .= "<p>" . $this->post->post_content . "</p>";
            $html .= $this->reviews_builder->get_reviews();
            $html .= "</div>";

            $html .= "</article>";

            return $html;
        }
    } // END CLASS
}
