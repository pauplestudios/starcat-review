<?php

namespace StarcatReview\Features;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration')) {
    class Woocommerce_Integration
    {
        public function __construct()
        {
            /*
             * Overriding the Existing product template by adding 99 as filter priotiry
             */
            add_filter('comments_template', [$this, 'comments_template_loader'], 99);
            add_filter('scr_convert_product_rating_to_stat', [$this, 'convert_product_rating_to_stat']);
        }

        public function comments_template_loader($template)
        {
            $post_type = get_post_type();
            $enabled_post_types = SCR_Getter::reviews_enabled_post_types();

            $dir = SCR_PATH . '/app/templates/';
            if ($post_type == 'product' && in_array($post_type, $enabled_post_types)) {
                if (file_exists(trailingslashit($dir) . 'reviews-template.php')) {
                    $template = trailingslashit($dir) . 'reviews-template.php';
                }
            }

            return $template;
        }

        public function convert_product_rating_to_stat($comment_id)
        {
            $global_stats = SCR_Getter::get('global_stats');
            $singularity = SCR_Getter::get('stat-singularity');

            $rating = get_comment_meta($comment_id, 'rating', true);
            $is_rating_available = isset($rating) && !empty($rating) ? true : false;

            $comment_stat = [];
            if ($singularity == 'single') {
                $global_stats = [$global_stats[0]];
            }

            // Product 5 Star rating changed to Percentage for better calculation
            if ($is_rating_available) {
                $rating = (!empty($rating)) ? $rating * 20 : $rating;
                foreach ($global_stats as $allowed_stat) {
                    $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                    $comment_stat[$allowed_stat_name] = [
                        'stat_name' => $allowed_stat_name,
                        'rating' => $rating,
                    ];
                }
            }

            return $comment_stat;
        }

    }
}
