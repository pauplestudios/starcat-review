<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\Model')) {
    class Model
    {
        public function __construct($post_id)
        {
            $this->post_id = $post_id;
        }

        public function get_viewProps()
        {
            $this->collection = $this->get_collectionProps();
            $this->items = $this->get_itemsProps();
            $view_props = [
                'collection' => $this->collection,
                'items' => $this->items
            ];
            // error_log("Props : " . print_r($view_props, true));
            return $view_props;
        }

        public function get_collectionProps()
        {
            $collection = [
                'singularity' => 'single', // single or multiple
                'type' => 'star', // star, bar or circle                
                'show_stats' => ['all'],
                'source_type' => 'icon', // image or icon 
                'animate' => false,
                'limit' => 5,
                /*
                    Value Type Differ for each types 
                    eg: 
                        bar -> percentage or point
                        star -> full or half or point
                */
                'value_type' => 'point',
            ];

            $collection = $this->get_icons($collection);

            return $collection;
        }

        public function get_itemsProps()
        {
            $stat_items = $this->get_stat_items();
            $stats = [];

            if ($this->collection['singularity'] == 'multiple') {
                $stat_overall_cumulative = 0;
                $stat_overall_count = 0;

                foreach ($stat_items as $key => $stat) {
                    $stat_overall_cumulative +=  $stat['rating'];

                    $stat_value = $this->get_stat_value($stat['rating']);
                    $stat_score = $this->get_stat_score($stat_value);

                    if ($this->is_stat_included('all', $this->collection)) {
                        $stats[$stat['stat_name']] = [
                            'rating' => $stat['rating'],
                            'value' => $stat_value,
                            'score' => $stat_score
                        ];
                    } elseif ($this->is_stat_included($stat['stat_name'], $this->collection)) {
                        $stats[$stat['stat_name']] = [
                            'rating' => $stat['rating'],
                            'value' => $stat_value,
                            'score' => $stat_score
                        ];
                    }

                    $stat_overall_count++;
                }

                if ($stat_overall_count) {
                    $overall_stat = $this->get_overall_stat($stat_overall_cumulative, $stat_overall_count);
                    $stats = array_merge($overall_stat, $stats);
                }
            }

            if (($this->collection['singularity'] == 'single') && !empty($stat_items)) {

                $stat_value = $this->get_stat_value($stat_items[0]['rating']);
                $stat_score = $this->get_stat_score($stat_value);

                $stats[$stat_items[0]['stat_name']] = [
                    'rating' => $stat_items[0]['rating'],
                    'value' => $stat_value,
                    'score' => $stat_score
                ];
            }

            return $stats;
        }

        protected function get_stat_items()
        {
            $post_meta = get_post_meta($this->post_id, '_helpie_reviews_post_options', true);
            $items = [];

            if (isset($post_meta['multiple-stat']) || !empty($post_meta['multiple-stat'])) {
                $items = $post_meta['multiple-stat'];
            }

            if (isset($post_meta['single-stat']) || !empty($post_meta['single-stat'])) {
                $items[] = $post_meta['single-stat'];
            }

            return $items;
        }

        protected function get_overall_stat($cumulative, $count)
        {
            $rating = round($cumulative / $count);
            $stat_value = $this->get_stat_value($rating);
            $stat_score = $this->get_stat_score($stat_value);

            $overall_stat = [
                'overall' => [
                    'rating' => $rating,
                    'value' => $stat_value,
                    'score' => $stat_score
                ]
            ];

            return $overall_stat;
        }

        protected function get_icons($collection)
        {
            $collection['icon'] = HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png';
            $collection['outline_icon'] = HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png';

            if ($collection['source_type'] == 'icon') {
                $collection['icon'] = 'star icon';
                $collection['outline_icon'] = 'star outline icon';
            }

            return $collection;
        }

        protected function get_stat_value($rating)
        {
            $collection = $this->collection;

            switch ($collection['value_type']) {
                case "full":
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_value = round($rating / $divisor) * $divisor;
                    break;

                case "half":
                    $divisor = $collection['limit'] == 5 ? 10 : 5;
                    $stat_value = round($rating / $divisor) * $divisor;
                    break;

                case "point":
                    $divisor = 100 / $collection['limit'];
                    $stat_value = $collection['type'] == "star" ? $rating : round($rating / $divisor) * $divisor;
                    break;

                case "percentage":
                    $stat_value = $rating;
                    break;

                default:
                    // Default is Star
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_value = round($rating / $divisor) * $divisor;
            }

            $stat_value = number_format($stat_value, 0);
            return $stat_value;
        }

        protected function get_stat_score($stat_value)
        {
            $collection = $this->collection;

            $stat_score = $collection['limit'] == 10 ? $stat_value / 10 : $stat_value / 20;

            $stat_score = $collection['value_type'] == "point" ? number_format($stat_score, 1) : $stat_score;

            if ($collection['type'] == 'bar') {
                $stat_score = $collection['value_type'] == "point" ? $stat_value / (100 / $collection['limit']) : $stat_value;
            }

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
