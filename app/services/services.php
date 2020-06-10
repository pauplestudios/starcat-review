<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Services')) {
    class Services
    {
        public function register_services()
        {
            $stats_factory = \StarcatReview\App\Services\StatsFactory();

            add_filter('prepare_stat_args', [$stats_factory, 'get_prepared_stat_args']);
        }
    } // END CLASS
}
