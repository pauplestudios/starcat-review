<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Summary')) {
    class Summary
    {
        public function __construct()
        {
            error_log('!!! Summary !!!');
        }

        public function summary_result()
        {
            // show resulted summary
        }
    }
}
