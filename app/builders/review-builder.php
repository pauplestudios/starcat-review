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

            $stats = $this->get_stats($post_id);
            $stats_view = new \HelpieReviews\App\Views\Stats($stats);
            $html = $stats_view->get_html();
            return $html;
        }

        private function get_stats($post_id)
        {

            $review_post_meta =   get_post_meta($post_id, '_helpie_reviews_post_options', true);
            error_log('$review_post_meta  : ' . print_r($review_post_meta, true));

            $stats_list = $review_post_meta['stats']['stats-list'];
            $stats = [];

            foreach ($stats_list as $key => $stat) {
                $stats[$stat['stat_name']] = $stat['rating'];
            }

            return $stats;

            /* Dummy */
            $review_data_json = file_get_contents(HELPIE_REVIEWS_PATH . "/tests/_data/review-data.json");
            $post_data = json_decode($review_data_json, true);
            $stats = $post_data[0]['stats'];

            return $stats;
        }
    } // END CLASS

}