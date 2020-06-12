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
            error_log('!!! register services !!!');

            $stats_factory = new \StarcatReview\App\Services\StatsFactory();

            add_filter('prepare_stat_args', [$stats_factory, 'get_prepared_stat_args'], 10, 2);
        }
    } // END CLASS
}
