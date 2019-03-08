<?php

namespace HelpieReviews\App\Builders;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Builders\Review_Builder')) {
    class Review_Builder
    {

        public function get_reviews($post_id)
        {
            $review_data_json = file_get_contents(HELPIE_REVIEWS_PATH . "/tests/_data/review-data.json");
            $post_data = json_decode($review_data_json, true);
            $stats = $post_data[0]['stats'];

            $stats_view = new \HelpieReviews\App\Views\Stats($stats);
            $html = $stats_view->get_html();
            return $html;
        }
    } // END CLASS

}