<?php

namespace HelpieReviews\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Summary\Model')) {
    class Model
    {
        public function get_Props($args)
        {
            $props = $args;

            $props['items']['author'] = $args['items'];
            $props['items']['user'] = $this->get_userSummaryItems($props);

            $this->get_items($args['items']);
            return $props;
        }

        protected function get_items($items)
        {
            error_log("Items : " . print_r($items, true));
            return $items;
        }

        protected function get_userSummaryItems($collection)
        {
            $items = [];

            $args = [
                'post_id' => $collection['post_id'],
                'type' => 'helpie_reviews'
            ];
            $comments = get_comments($args);

            $groups = [];
            $groups['pros-list'] = array();
            $groups['cons-list'] = array();

            foreach ($comments as $comment) {
                // $comment->review_props = get_comment_meta($comment->comment_ID, 'hrp_user_review_props', true);

                foreach ($collection['global_stats'] as $allowed_stat) {
                    $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                    if (!isset($groups['stats-list'][$allowed_stat_name])) {
                        $groups['stats-list'][$allowed_stat_name] = 0;
                    }

                    $count = count($comment->review_props['stats'][$allowed_stat_name]);

                    $groups['stats-list'][$allowed_stat_name] += $comment->review_props['stats'][$allowed_stat_name]['rating'] / $count;
                }

                $groups['pros-list'] = array_merge($groups['pros-list'], $comment->review_props['pros']);
                $groups['cons-list'] = array_merge($groups['cons-list'], $comment->review_props['cons']);
            }

            if (!empty($groups['stats-list'])) {
                $items['stats-list'] = $this->get_stats($groups['stats-list']);
            }
            if (!empty($groups['pros-list'])) {
                $items['pros-list'] = $this->get_prosandcons($groups['pros-list']);
            }
            if (!empty($groups['cons-list'])) {
                $items['cons-list'] = $this->get_prosandcons($groups['cons-list']);
            }
            // error_log("Pros list : " . print_r($items['pros-list'], true));
            // error_log("cons List : " . print_r($items['cons-list'], true));
            return $items;
        }


        protected function get_stats($groups)
        {
            $stats = [];

            foreach ($groups as $key => $value) {
                $stats[$key] = [
                    'stat_name' => $key,
                    'rating' => $value
                ];
            }

            return $stats;
        }
        protected function get_prosandcons($groups)
        {
            $items = [];
            $prosandcons = array_count_values($groups);
            $fliped = array_flip($prosandcons);
            // foreach ($prosandcons as $key => $value) {
            //     if ($count = ($value)) {
            //         $items[] = [
            //             'item' => $key
            //         ];
            //     }
            // }

            $max = max($prosandcons);
            $pros = [];
            foreach ($prosandcons as $key => $value) {
                if ($value > $max) {
                    $max = $value;
                    $pros[] = $key;
                } else if ($value == $max) {
                    $pros[] = $key;
                }
                //  else if ($value <= $max) {
                //     $pros[] = $key;
                // }
            }

            // error_log("prosandcons : " . print_r($pros, true));
            // error_log("fliped : " . print_r($prosandcons, true));

            return $items;
        }
    }
}
