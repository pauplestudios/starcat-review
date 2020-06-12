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
            // add_filter('comments_template', [$this, 'comments_template_loader'], 11);
            add_filter('scr_comment_stat', [$this, 'add_product_rating_to_comment_stat']);
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

        public function add_product_rating_to_comment_stat($comment_id, $comments_of_stats)
        {
            $comment_stat = [];
            if (get_post_type($post_id) == 'product') {

                $rating = get_comment_meta($comment_id, 'rating', true);
                $is_rating_available = isset($rating) && !empty($rating) ? true : false;
                $is_comment_stat_not_exist = !isset($comments_of_stats[$comment_id]) && empty($comments_of_stats[$comment_id]) ? true : false;

                // Product 5 Star rating changed to Percentage for better calculation
                if ($is_comment_stat_not_exist && $is_rating_available) {
                    $rating = (!empty($rating)) ? $rating * 20 : $rating;
                    $comments_of_stats[$comment_id] = $rating;
                }
            }

            return $comment_stat;
        }

    }
}
