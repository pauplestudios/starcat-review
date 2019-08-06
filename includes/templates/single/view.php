<?php

namespace HelpieReviews\Includes\Templates\Single;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Single\View')) {
    class View
    {

        private $html;

        public function __construct($post)
        {
            $this->post = $post;
            $this->model = [];

            // $review_data_json = file_get_contents(HELPIE_REVIEWS_PATH . "/tests/_data/review-data.json");
            // $post_data = json_decode($review_data_json, true);
            // $this->model->stats = $post_data[0]['stats'];
        }

        public function get_html()
        {
            $html = '';

            $html .= "<article>";
            $html .= "<h1 class='title'>" . $this->post->post_title . "</h1>";
            $html .= "<p class='content'>" . $this->post->post_content . "</p>";
            $stats_view = new \HelpieReviews\App\Widgets\Stats\Controller($this->post->ID);
            $html .= $stats_view->get_view();
            $pros_and_cons_view = new \HelpieReviews\App\Widgets\ProsAndCons\Controller($this->post->ID);
            $html .= $pros_and_cons_view->get_view();
            $html .= "</article>";

            return $html;
        }
    } // END CLASS
}