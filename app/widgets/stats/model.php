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
            return [
                'collection' => $this->get_collectionProps(),
                'items' => $this->get_itemsProps(),
            ];
        }

        public function get_collectionProps()
        {
            $collection = [
                'type' => 'star', // star, bar or circle                
                'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
                'source_type' => 'image', // image or icon 
                'animate' => false,
                /*
                    Value Type Differ for each types 
                    eg: 
                        bar -> percentage or points 
                        star -> full or half or points
                */
                'value_type' => 'half',
            ];

            $collection = $this->get_interpreted_collection($collection);
            $collection = $this->get_icons($collection);

            return $collection;
        }

        public function get_itemsProps()
        {
            $review_post_meta =   get_post_meta($this->post_id, '_helpie_reviews_post_options', true);

            // Return if empty
            if (!isset($review_post_meta['stats']) || empty($review_post_meta['stats'])) {
                return [];
            }

            $stats_list = $review_post_meta['stats']['stats-list'];
            $stats = [];

            foreach ($stats_list as $key => $stat) {
                $stats[$stat['stat_name']] = $stat['rating'];
            }

            return $stats;
        }

        protected function get_interpreted_collection($collection)
        {
            $collection['limit'] = ($collection['value_type'] == 'percentage') ? 100 : 50;

            if ($collection['type'] == 'star') {
                $collection['limit'] = 5;
            }

            return $collection;
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
    } // END CLASS

}
