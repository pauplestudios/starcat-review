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
        }

        public function get_html()
        {
            $summary = new \HelpieReviews\App\Widgets\Summary\Controller($this->post->ID);

            $html = "<article>";
            $html .= "<h1 class='title'>" . $this->post->post_title . "</h1>";
            $html .= "<p class='content'>" . $this->post->post_content . "</p>";
            $html .= $summary->get_view();
            $html .= "</article>";

            return $html;
        }
    } // END CLASS
}
