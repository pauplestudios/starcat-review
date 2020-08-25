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
            foreach (SCR_Getter::reviews_enabled_post_types() as $post_type) {
                if ($post_type == 'product') {
                    // Overriding the Existing product and other popular WC addons template by adding 99 as filter priotiry
                    add_filter('comments_template', [$this, 'comments_template_loader'], 99);
                    add_filter('woocommerce_product_get_rating_html', [$this, 'woocommerce_rating_display'], 10, 3);

                    remove_action('woocommerce_single_product_summary', 'woocommerce_template_single_rating');
                    add_action('woocommerce_single_product_summary', [$this, 'woocommerce_review_display_overall_rating'], 5);
                }
            }
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
                $html .= ' ' . __('customer review', SCR_DOMAIN);
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

    }
}
