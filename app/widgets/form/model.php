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
                'review_type' => 'bar',   // Star, circle, bar                                
                'source_type' => 'image', // icon or image                

                /*
                    Value Type Differ for each types 
                    eg: 
                        bar -> percentage or point
                        star -> full or half or point
                */
                'value_type' => 'point',
                'no_rated_message' =>  'Not Rated Yet !!!',
                'animate' => false
            ];

            $collection = $this->get_interpreted_collection($collection);
            $collection = $this->get_icons($collection);

            return $collection;
        }

        public function get_itemsProps()
        {
            $stat_items = $this->get_stat_items();
            $stats = [];

            foreach ($stat_items as $key => $stat) {
                $stats[$stat['stat_name']] = $stat['rating'];
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

        protected function get_interpreted_collection($collection)
        {
            $collection['limit'] = ($collection['value_type'] == 'percentage') ? 100 : 50;

            if ($collection['review_type'] == 'star') {
                $collection['limit'] = 10; // 5 or 10                
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
