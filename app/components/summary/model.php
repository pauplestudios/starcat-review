<?php

namespace StarcatReview\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Summary\Model')) {
    class Model
    {
        public function get_Props($args)
        {
            $props = $args;

            $props['items']['author'] = ($args['enable-author-review']) ? $args['items'] : [];

            $props['items']['user'] = $this->get_userItems($args);

            return $props;
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
