<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Review')) {
    class Review
    {
        public function __construct()
        {
            error_log('!!! Review !!!');
        }

        public function add_fields()
        {

        }

        public function save_fields()
        {

        }

        public function trigger_function_hook()
        {

        }
    }
}
