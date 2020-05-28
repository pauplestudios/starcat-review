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

            // $product_review_list = new \StarcatReview\Features\Woocommerce_Integration\Review_List();

            // $migration = new \StarcatReview\Features\Woocommerce_Integration\Migration();

            /*
             * Overriding the Existing product template by adding 11 as filter priotiry
             */
            add_filter('comments_template', [$this, 'comments_template_loader'], 11);
        }

        public function comments_template_loader($template)
        {
            if (get_post_type() !== 'product') {
                return $template;
            }

            $dir = SCR_PATH . '/features/woocommerce-integration/';
            if (file_exists(trailingslashit($dir) . 'product-reviews-template.php')) {
                $template = trailingslashit($dir) . 'product-reviews-template.php';
            }

            return $template;
        }

    }
}
