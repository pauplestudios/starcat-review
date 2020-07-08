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
            if (in_array('product', SCR_Getter::reviews_enabled_post_types(), true)) {
                add_filter('woocommerce_product_get_rating_html', [$this, 'woocommerce_rating_display'], 10, 3);
                add_action('woocommerce_single_product_summary', [$this, 'woocommerce_review_display_overall_rating'], 10);
            }

            // Overriding the Existing product template by adding 11 as filter priotiry
            add_filter('comments_template', [$this, 'comments_template_loader'], 11);

            add_action('scr_woocommerce_integration/add_rating_meta', [$this, 'add_rating_meta'], 10, 2);

            // add_filter('scr_woocommerce_integration/convert_product_rating_to_stat', [$this, 'convert_product_rating_to_stat']);
        }

        public function comments_template_loader($template)
        {
            if (get_post_type() !== 'product') {
                return $template;
            }

            $dir = SCR_PATH . '/app/templates/';
            if (file_exists(trailingslashit($dir) . 'reviews-template.php')) {
                $template = trailingslashit($dir) . 'reviews-template.php';
            }
            return $template;
        }

        public function woocommerce_rating_display()
        {
            global $product;
            $product_id = $product->get_id();
            $overall_ratings = scr_get_overall_rating($product_id);
            return $overall_ratings['dom'];
        }

        public function woocommerce_review_display_overall_rating()
        {
            global $product;
            $product_id = $product->get_id();

            $rating = scr_get_overall_rating($product_id);
            $review_count = scr_get_user_reviews_count($product_id);

            $html = '';

            if (isset($rating['overall']['rating']) && $rating['overall']['rating'] !== 0) {

                $html .= $rating['dom'];
                $html .= '<a href="#reviews" class="woocommerce-review-link" rel="nofollow">(';
                $html .= '<span class="count">' . esc_html($review_count) . '</span>';
                $html .= __(' customer review', SCR_DOMAIN);
                $html .= ')</a>';
            }

            echo $html;
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

        public function add_rating_meta($comment_id, $props)
        {
            $comment = get_comment($comment_id);
            $updated = false;
            if ('product' === get_post_type($comment->comment_post_ID) && isset($props['rating']) && !empty($props['rating'])) {
                update_comment_meta($comment_id, 'rating', round($props['rating'] / 20));
                $updated = true;
            }
            return $updated;
        }

    }
}
