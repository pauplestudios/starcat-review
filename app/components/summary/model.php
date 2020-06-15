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
                'collection' => [
                    'users_title' => __('User Rating', SCR_DOMAIN),
                    'author_title' => __('Author Rating', SCR_DOMAIN),
                    'no_of_column' => $this->get_no_of_column($args),
                    'reviews_title' => $this->get_product_reviews_title(),
                    'review_count' => 10,
                    // 'show' => 'both',
                ],
                'items' => $this->get_items_props($args),
            ];

            // $props['items']['author'] = ($args['enable-author-review']) ? $args['items'] : [];

            // $props['items']['user'] = $this->get_userItems($args);

            return $viewProps;
        }

        public function get_items_props($args)
        {
            $stat_args = $args;
            unset($stat_args['items']);

            $author_stat_args = $stat_args;
            $comment_stat_args = $stat_args;

            $author_stat_args['items'] = $args['items']['summary_author'];
            $comment_stat_args['items'] = $args['items']['summary_users'];

            // if (!empty($groups['pros-list'])) {
            //     $items['pros-list'] = $this->get_prosandcons($groups['pros-list']);
            // }
            // if (!empty($groups['cons-list'])) {
            //     $items['cons-list'] = $this->get_prosandcons($groups['cons-list']);
            // }
            error_log('args["items"] : ' . print_r($args["items"], true));

            $itemsProps = [
                'author_stat' => $author_stat_args,
                'comment_stat' => $comment_stat_args,
                // 'pros-list' => $this->get_prosandcons($args['items']['pros-list']),
                // 'cons-list' => $this->get_prosandcons($args['items']['cons-list']),
            ];

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

        protected function get_userItems($args)
        {
            $items = [];

            $groups = [];
            // $groups['pros-list'] = array();
            // $groups['cons-list'] = array();
            $groups['stats-list'] = array();
            $groups['attachments'] = array();

            $count = 0;
            if (isset($args['items']['comments-list']) || !empty($args['items']['comments-list'])) {
                foreach ($args['items']['comments-list'] as $comment) {
                    if (isset($comment->reviews['stats']) && !empty($comment->reviews['stats'])) {
                        foreach ($comment->reviews['stats'] as $stat_key => $stat_value) {
                            $global_stats = [];
                            if (isset($args['global_stats']) && !empty($args['global_stats'])) {
                                $global_stats = array_map(function ($stat) {
                                    return strtolower($stat['stat_name']);
                                }, $args['global_stats']);
                            }
                            if ($args['singularity'] == 'single') {
                                $global_stats = [$global_stats[0]];
                            }
                            // error_log("global" . print_r($global_stats, true));

                            if (in_array(strtolower($stat_key), $global_stats)) {
                                if (!isset($groups['stats-list'][$stat_key])) {
                                    $groups['stats-list'][$stat_key] = 0;
                                }

                                $groups['stats-list'][$stat_key] += $comment->reviews['stats'][$stat_key]['rating'];
                            }
                        }
                    }
                    $count++;

                    if (isset($comment->reviews['attachments']) && !empty($comment->reviews['attachments'])) {
                        $groups['attachments'] = array_merge($groups['attachments'], $comment->reviews['attachments']);
                    }
                }
            }
            $items['review_count'] = $count;

            if (!empty($groups['stats-list'])) {
                $items['stats-list'] = $this->get_user_stats($groups['stats-list'], $count);
            }

            if (!empty($groups['attachments'])) {
                $items['attachments'] = $groups['attachments'];
                // error_log('groups : ' . print_r($groups, true));

            }

            // if (!empty($groups['pros-list'])) {
            //     $items['pros-list'] = $this->get_prosandcons($groups['pros-list']);
            // }
            // if (!empty($groups['cons-list'])) {
            //     $items['cons-list'] = $this->get_prosandcons($groups['cons-list']);
            // }

            return $items;
        }

        protected function get_user_stats($groups, $count)
        {
            $stats = [];

            foreach ($groups as $key => $value) {
                $stats[$key] = [
                    'stat_name' => $key,
                    'rating' => round($value / $count, 1),
                ];
            }

            return $stats;
        }

        //Todo:  Not Working Properly
        protected function get_prosandcons($groups)
        {
            error_log('groups : ' . print_r($groups, true));

            $items = [];
            $prosandcons = array_count_values($groups);
            $fliped = array_flip($prosandcons);

            $max = max($prosandcons);
            $pros = [];
            foreach ($prosandcons as $key => $value) {
                if ($value > $max) {
                    $max = $value;
                    $pros[] = $key;
                } else if ($value == $max) {
                    $pros[] = $key;
                }
            }

            return $items;
        }
    }
}
