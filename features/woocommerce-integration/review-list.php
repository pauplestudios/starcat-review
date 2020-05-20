<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Review_List')) {
    class Review_List
    {
        public function __construct()
        {
            error_log('!!! List !!!');
        }

        public function list_result()
        {
            // show resulted List
        }
    }
}
