<?php

namespace StarcatReview\App\Components\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Stats\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            $this->collection = $this->get_collectionProps($args);
            $this->items = $this->get_itemsProps($args);

            if (isset($args['combination']) && $args['combination'] == 'overall_combine') {
                $this->items = $this->get_combined_overall($this->items, $args);
            }

            $view_props = [
                'collection' => $this->collection,
                'items' => $this->items
            ];

            return $view_props;
        }

        public function get_collectionProps($args)
        {
            $collection = [
                'singularity' => $args['singularity'], // single or multiple
                'type' =>  $args['type'], // star, bar or circle                
                'show_stats' => ['all'],
                'source_type' =>  $args['source_type'], // image or icon 
                'icons' => $args['icons'],
                'images' => $args['images'],
                'animate' => $args['animate'],
                'limit' => $args['limit'],
                'show_rating_label' => $args['show_rating_label'],
                'no_rated_message' =>  'Not Rated Yet !!!',
                'steps' => $args['steps'], // full or half or progress
            ];

            $collection = $this->get_icons($collection);
            $collection['combination'] = isset($args['combination']) ? $args['combination'] : '';

            return $collection;
        }

        public function get_itemsProps($args)
        {
            $stats = [];

            if (!isset($args['items']['stats-list']) && empty($args['items']['stats-list'])) {
                return $stats;
            }

            $stat_items = $this->get_filtered_stats($args);

            $stat_overall_cumulative = 0;
            $stat_overall_count = 0;

            foreach ($stat_items as $stat) {

                if ($this->collection['singularity'] == 'single' && $stat_overall_count >= 1) {
                    break;
                }

                $stat_overall_cumulative +=  $stat['rating'];
                $stat_value = $stat['rating'];
                $stat_score = $this->get_stat_score($stat_value);


                if ($this->is_stat_included('all', $this->collection)) {
                    $stats[$stat['stat_name']] = [
                        'rating' => $stat['rating'],
                        'score' => $stat_score
                    ];
                }

                $stat_overall_count++;
            }

            if ($stat_overall_count > 1 && $this->collection['singularity'] !== 'single') {
                $overall_stat = $this->get_overall_stat($stat_overall_cumulative, $stat_overall_count);
                $stats = array_merge($overall_stat, $stats);
            }

            return array_change_key_case($stats);
        }

        protected function get_combined_overall($author_items, $args)
        {
            $user_items = $this->get_userItems($args);
            $user_args = $args;
            $user_args['items'] = $user_items;
            $user_items = $this->get_itemsProps($user_args);
            // error_log("Author : " . print_r($author_items, true));
            // error_log("User : " . print_r($user_items, true));
            // error_log("Global : " . print_r($args['global_stats'], true));

            $count = 0;
            $combine = [
                'user_overall' => 0,
                'author_overall' => 0
            ];

            foreach ($args['global_stats'] as $allowed_stat) {

                if ($args['singularity'] == 'single' && $count >= 1) {
                    break;
                }

                $allowed_stat_name = strtolower($allowed_stat['stat_name']);

                if (array_key_exists($allowed_stat_name, $user_items)) {
                    $combine['user_overall'] += $user_items[$allowed_stat_name]['rating'];
                    // error_log("I am User Exist : " . $user_items[$allowed_stat_name]['rating']);
                }
                if (array_key_exists($allowed_stat_name, $author_items)) {
                    $combine['author_overall'] += $author_items[$allowed_stat_name]['rating'];
                    // error_log("I am Author Exist : " . $author_items[$allowed_stat_name]['rating']);
                }
                $count++;
            }

            $user_overall = $combine['user_overall'] / $count;
            $author_overall = $combine['author_overall'] / $count;
            $overall_rating = ($author_overall + $user_overall) / 2;
            $overall_score = $this->get_stat_score($overall_rating);

            $combine = [
                'overall' => [
                    'rating' => $overall_rating,
                    'score' => $overall_score
                ]
            ];

            // error_log("combined : " . print_r($combine, true));

            return $combine;
        }

        protected function get_userItems($args)
        {
            $items = [];

            $groups = [];
            // $groups['pros-list'] = array();
            // $groups['cons-list'] = array();
            $groups['stats-list'] = array();

            $count = 0;
            if (isset($args['items']['comments-list']) || !empty($args['items']['comments-list'])) {
                foreach ($args['items']['comments-list'] as $comment) {
                    if (isset($comment->reviews['stats'])) {
                        foreach ($comment->reviews['stats'] as $stat_key => $stat_value) {
                            $global_stats = [];
                            if (isset($args['global_stats']) && !empty($args['global_stats'])) {
                                $global_stats = array_map(function ($stat) {
                                    return strtolower($stat['stat_name']);
                                }, $args['global_stats']);
                            }


                            if (in_array(strtolower($stat_key), $global_stats)) {
                                if (!isset($groups['stats-list'][$stat_key])) {
                                    $groups['stats-list'][$stat_key] = 0;
                                }

                                $groups['stats-list'][$stat_key] += $comment->reviews['stats'][$stat_key]['rating'];
                            }
                        }
                    }
                    $count++;
                }
            }
            $items['review_count'] = $count;

            if (!empty($groups['stats-list'])) {
                $items['stats-list'] = $this->get_user_stats($groups['stats-list'], $count);
            }

            return $items;
        }

        protected function get_user_stats($groups, $count)
        {
            $stats = [];

            foreach ($groups as $key => $value) {
                $stats[$key] = [
                    'stat_name' => $key,
                    'rating' => round($value / $count, 1)
                ];
            }

            return $stats;
        }

        protected function get_filtered_stats($args)
        {
            $stats = [];

            if (!isset($args['global_stats']) || !isset($args['items']['stats-list'])) {
                return $stats;
            }
            $global_stats = $args['global_stats'];
            if ($args['singularity'] == 'single') {
                $global_stats = [$global_stats[0]];
            }
            if (!empty($args['global_stats']) && !empty($args['items']['stats-list'])) {

                foreach ($global_stats as $allowed_stat) {
                    $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                    if (array_key_exists($allowed_stat_name, $args['items']['stats-list'])) {
                        $stats[$allowed_stat_name] = $args['items']['stats-list'][$allowed_stat_name];
                    }
                }
            }

            return $stats;
        }

        protected function get_overall_stat($cumulative, $count)
        {
            $rating = round($cumulative / $count, 1);
            $stat_value = $rating;
            $stat_score = $this->get_stat_score($stat_value);

            $overall_stat = [
                'overall' => [
                    'rating' => $rating,
                    'score' => $stat_score
                ]
            ];

            return $overall_stat;
        }

        protected function get_icons($collection)
        {
            $image = SCR_URL . 'includes/assets/img/tomato.png';

            $image_outline =  SCR_URL . 'includes/assets/img/tomato-outline.png';

            $collection['icon'] = (isset($collection['images']['image']['thumbnail'])) ? $collection['images']['image']['thumbnail'] : $image;

            $collection['outline_icon'] = (isset($collection['images']['image-outline']['thumbnail'])) ? $collection['images']['image-outline']['thumbnail'] : $image_outline;

            if ($collection['source_type'] == 'icon') {
                $collection['icon'] = $collection['icons'] . ' icon';
                $collection['outline_icon'] = $collection['icons'] . ' outline icon';
            }

            return $collection;
        }

        protected function get_stat_score($stat_value)
        {
            $collection = $this->collection;

            $stat_score = $stat_value / (100 / $collection['limit']);

            $stat_score = $collection['steps'] == "precise" ? number_format($stat_score, 1) : round($stat_score, 1);

            return $stat_score;
        }

        protected function is_stat_included($stat_item, $collection)
        {

            $stat_item = $this->get_santized_key($stat_item);

            if (in_array($stat_item, $collection['show_stats'])) {
                return true;
            }

            return false;
        }

        protected function get_santized_key($key)
        {
            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }
    } // END CLASS

}
