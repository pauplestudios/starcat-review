<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Single_Review')) {
    class Single_Review
    {
        private $html;

        public function __construct($review_post)
        {
            $this->model = $review_post;

            $review_data_json = file_get_contents(HELPIE_REVIEWS_PATH . "/tests/_data/review-data.json");
            $post_data = json_decode($review_data_json, true);
            $this->model->stats = $post_data[0]['stats'];
        }

        public function render()
        {
            $html = "<h1>" . $this->model->title . "</h1>";

            $html .= "<p>" . $this->model->content . "</p>";

            $stats_view = new \HelpieReviews\App\Views\Stats($this->model->stats);
            $html .= $stats_view->get_html();
            $this->html = $html;
            echo $this->html;
        }

    } // END CLASS
}