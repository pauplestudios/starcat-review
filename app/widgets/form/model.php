<?php

namespace HelpieReviews\App\Widgets\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Form\Model')) {
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
                'items' => $this->get_itemsProps()
            ];
        }

        protected function get_collectionProps()
        {
            $collection =  [
                'display_form_title' => true,
                'display_title' => true,
                'display_user_stat' => true,
                'display_pros_and_cons' => true,
                'display_description' => true,
                'form_title' => 'Review Stats Form',
                'review_items' => true,
                'review_type' => 'star',   // Star, circle, bar                                
                'source_type' => 'icon', // icon or image                
                'divisor' => 5,
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
            // 'value_type' can be point or percentage for bar rating
            $collection['value_type'] = 'point';
            $collection['limit'] = ($collection['value_type'] == 'percentage') ? 100 : 50;

            if ($collection['review_type'] == 'star') {
                $collection['limit'] = 10; // 5 or 10
                $collection['value_type'] = 'point'; // full or half or point
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
