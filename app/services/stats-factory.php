<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\StatsFactory')) {
    class StatsFactory
    {
        public function __construct(Type $var = null)
        {
            add_filter('review_stat_factory', [$this, 'get_prefetched_stat']);
        }

        public function get_prefetched_stat($args, $items)
        {
            return $stats;
        }
    }
}
