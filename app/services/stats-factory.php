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
            $stats_args = [];
            switch ($component) {
                case "listing":
                    break;
                case "post_overall":
                    break;
                case "summary_author":
                    break;
                case "summary_users":
                    break;
                default:
                    break;
            }
            return $stats_args;
        }

        protected function exclude_stats()
        {
            $global_stats = SCR_Getter::get('global_stats');
            $stats = [];
            return $stats;
        }

    }
}
