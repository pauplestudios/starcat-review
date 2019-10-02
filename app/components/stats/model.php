<?php

namespace HelpieReviews\App\Components\Stats;

use HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Stats\Model')) {
    class Model
    {
        public function __construct($post_id)
        {
            $this->post_id = $post_id;
        }

        public function get_viewProps()
        {
            $args = $this->get_default_args();
            $this->collection = $this->get_collectionProps($args);
            $this->items = $this->get_itemsProps();
            $view_props = [
                'collection' => $this->collection,
                'items' => $this->items
            ];
            // error_log("Props : " . print_r($args, true));
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
                'display_rating' => true,
                'no_rated_message' =>  'Not Rated Yet !!!',
                'steps' => $args['steps'], // full or half or progress
            ];

            $collection = $this->get_icons($collection);

            return $collection;
        }

        public function get_default_args()
        {
            $singularity = HRP_Getter::get('stat-singularity');
            $type = HRP_Getter::get('stats-type');
            $stars_limit =  HRP_Getter::get('stats-stars-limit');
            $bars_limit = HRP_Getter::get('stats-bars-limit');
            $limit = ($type == 'star') ? $stars_limit : $bars_limit;
            $source_type = HRP_Getter::get('stats-source-type');
            $icons = HRP_Getter::get('stats-icons');
            $images = HRP_Getter::get('stats-images');
            $steps = HRP_Getter::get('stats-steps');
            $animate = HRP_Getter::get('stats-animate');

            $args = [
                'singularity' => $singularity,
                'type' => $type,
                'source_type' => $source_type,
                'icons' => $icons,
                'images' => $images,
                'steps' => $steps,
                'limit' => $limit,
                'animate' => $animate,
            ];

            return $args;
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

            if (isset($post_meta['stats-list']) || !empty($post_meta['stats-list'])) {
                $items = $post_meta['stats-list'];
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
            $collection['icon'] = (isset($collection['images']['image']['thumbnail'])) ? $collection['images']['image']['thumbnail'] : HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png';
            $collection['outline_icon'] = (isset($collection['images']['image-outline']['thumbnail'])) ? $collection['images']['image-outline']['thumbnail'] : HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png';

            if ($collection['source_type'] == 'icon') {
                $collection['icon'] = $collection['icons'] . ' icon';
                $collection['outline_icon'] = $collection['icons'] . ' outline icon';
            }

            return $collection;
        }

        protected function get_stat_value($rating)
        {
            $collection = $this->collection;

            switch ($collection['steps']) {
                case "full":
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_value = round($rating / $divisor) * $divisor;
                    break;

                case "half":
                    $divisor = $collection['limit'] == 5 ? 10 : 5;
                    $stat_value = round($rating / $divisor) * $divisor;
                    break;

                case "precise":
                    $stat_value = $rating;
                    break;

                default:
                    // Default is Star 5
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_value = round($rating / $divisor) * $divisor;
            }

            $stat_value = number_format($stat_value, 0);
            return $stat_value;
        }

        protected function get_stat_score($stat_value)
        {
            $collection = $this->collection;

            $stat_score = $stat_value / (100 / $collection['limit']);

            $stat_score = $collection['steps'] == "precise" ? number_format($stat_score, 1) : $stat_score;

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
