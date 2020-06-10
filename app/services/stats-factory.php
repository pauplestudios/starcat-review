<?php

namespace StarcatReview\App\Services;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

/*
 *  Use Cases for listing, post_overall, summary_author and summary_users
 */
if (!class_exists('\StarcatReview\App\Services\StatsFactory')) {
    class StatsFactory
    {

        public function get_prepared_stat_args(int $post_id, string $component = 'post_overall')
        {
            $comments = get_comments([
                'post_id' => $post_id,
                'comment_type' => 'review',
            ]);

            // error_log('comments : ' . print_r($comments, true));

            $stats_args = [];
            switch ($component) {
                case "post_overall":
                    break;
                    // case "listing":
                    //     break;
                    // case "summary_author":
                    //     break;
                    // case "summary_users":
                    //     break;
                    // default:
                    //     break;
            }

            return $comments;
        }

        protected function filter_with_global_stats($stats)
        {
            $global_stats = SCR_Getter::get('global_stats');
            $stats = [];
            return $stats;
        }

    }
}
