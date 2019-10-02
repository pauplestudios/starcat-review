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
            $summary = new \HelpieReviews\App\Components\Summary\Controller();
            $form_controller = new \HelpieReviews\App\Components\Form\Controller($this->post->ID);

            $html = "<article>";
            $html .= "<h1 class='title'>" . $this->post->post_title . "</h1>";
            $html .= "<p class='content'>" . $this->post->post_content . "</p>";
            $html .= $summary->get_view($this->post->ID);
            $html .= $form_controller->get_view();
            $html .= "</article>";

            return $html;
        }
    } // END CLASS
}
