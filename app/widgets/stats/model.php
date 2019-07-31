<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\Model')) {
    class Model
    {
        public function get($post_id)
        {
            $review_post_meta =   get_post_meta($post_id, '_helpie_reviews_post_options', true);

            // Return if empty
            if (!isset($review_post_meta['stats']) || empty($review_post_meta['stats'])) {
                return [];
            }

            $stats_list = $review_post_meta['stats']['stats-list'];
            $stats = [];

            foreach ($stats_list as $key => $stat) {
                $stats[$stat['stat_name']] = $stat['rating'];
            }

            return $stats;
        }
    } // END CLASS

}