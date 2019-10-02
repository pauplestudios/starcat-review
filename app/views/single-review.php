<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Single_Review')) {
    class Single_Review
    {
        private $html;

        public function __construct($post_id)
        {
            $this->ID = $post_id;
            $this->model = [];

            // $review_data_json = file_get_contents(HELPIE_REVIEWS_PATH . "/tests/_data/review-data.json");
            // $post_data = json_decode($review_data_json, true);
            // $this->model->stats = $post_data[0]['stats'];
        }

        public function get_html()
        {
            $html = '';

            $html .= "<article>";
            $html .= "<h1 class='title'>" . $this->model->title . "</h1>";
            $html .= "<p class='content'>" . $this->model->content . "</p>";
            $stats_view = new \HelpieReviews\App\Components\Stats\Controller($this->ID);
            $html .= $stats_view->get_view();
            $pros_and_cons_view = new \HelpieReviews\App\Components\ProsAndCons\Controller($this->ID);
            $html .= $pros_and_cons_view->get_view();
            $html .= "</article>";

            return $html;
        }
    } // END CLASS
}