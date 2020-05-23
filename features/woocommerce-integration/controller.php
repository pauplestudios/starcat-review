<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Controller')) {
    class Controller
    {
        public function __construct()
        {
            // error_log('!!! Woocommerce Integration Controller !!!');
        }

        public function load()
        {
            // error_log('!!! Loading Core Woo Hooks !!!');

            // $review_form = new \StarcatReview\Features\Woocommerce_Integration\Review();

            // $summary = new \StarcatReview\Features\Woocommerce_Integration\Summary();

            $product_review_list = new \StarcatReview\Features\Woocommerce_Integration\Review_List();

            // $migration = new \StarcatReview\Features\Woocommerce_Integration\Migration();
        }

    }
}
