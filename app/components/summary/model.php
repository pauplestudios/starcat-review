<?php

namespace StarcatReview\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Summary\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            // $props = $args;

            $viewProps = [
                'collection' => $this->get_collectionProps($args),
                'items' => $this->get_items_props($args),
            ];

            // $props['items']['author'] = ($args['enable-author-review']) ? $args['items'] : [];

            // $props['items']['user'] = $this->get_userItems($args);

            return $viewProps;
        }

        public function get_collectionProps($args)
        {
            $collection = [
                'users_title' => sprintf('User Rating ( %1$d )', $args['review_count'], SCR_DOMAIN),
                'author_title' => __('Author Rating', SCR_DOMAIN),
                'no_of_column' => $this->get_no_of_column($args),
                'reviews_title' => $this->get_product_reviews_title(),
                // 'show' => 'both',
                'is_enable_author' => $args['enable-author-review'],
            ];

            return $collection;
        }

        public function get_items_props($args)
        {
            $stat_args = $args;
            unset($stat_args['items']);

            $author_stat_args = $stat_args;
            $comment_stat_args = $stat_args;

            $author_stat_args['items'] = $args['items']['summary_author'];
            $comment_stat_args['items'] = $args['items']['summary_users'];

            $itemsProps = [
                'author_stat' => $author_stat_args,
                'comment_stat' => $comment_stat_args,
            ];

            if (isset($args['items']['pros-list']) && !empty($args['items']['pros-list'])) {
                $itemsProps['pros-list'] = $args['items']['pros-list'];
            }
            if (isset($args['items']['cons-list']) && !empty($args['items']['cons-list'])) {
                $itemsProps['cons-list'] = $args['items']['cons-list'];
            }

            return $itemsProps;

        }

        public function get_no_of_column($args)
        {
            $no_of_column = 'one';

            $has_author_stat = !empty($args['items']['summary_author']) ? true : false;
            $has_comment_stat = !empty($args['items']['summary_users']) ? true : false;

            if ($has_comment_stat && $has_author_stat) {
                $no_of_column = 'two';
            }

            return $no_of_column;
        }

        protected function get_product_reviews_title()
        {
            $html = '';
            global $product;
            if (isset($product) && $product->get_review_count() && wc_review_ratings_enabled()) {
                $count = $product->get_review_count();
                $reviews_title = sprintf(esc_html(_n('%1$s review for %2$s', '%1$s reviews for %2$s', $count, 'woocommerce')), esc_html($count), '<span>' . get_the_title() . '</span>');
                $html .= apply_filters('woocommerce_reviews_title', $reviews_title, $count, $product); // WPCS: XSS ok.
            }

            return $html;
        }
    }
}
