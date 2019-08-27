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
            return[
               'collection' => $this->get_collectionProps(),
               'items' => $this->get_itemsProps() 
            ];            
        } 
        
        protected function get_collectionProps()
        {
            return  [
                'display_form_title'=> true,
                'display_title'=> true,
                'display_user_stat' => true,  
                'display_pros_and_cons' => true,
                'display_description' => true,
                'form_title' => 'Review Stats Form', 
                'review_type' => 'progress_bar',   // Star, circle, progress_bar
                'review_items' => true,
                'star_division' => 'half', // full, half, points
                'star_scale' => 5, 
                'value_type' => 'percentage', // number or percentage
                'value_limit' => 50,
                'value_roundable_to' => 1,
                'source_type' => 'icon', // icon or image,
                'image' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                'image_overlay' => HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png',
                'icon' => 'fa fa-star',                
                'animate' => true,
                'divisor' => 5,                
            ];
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


    } // END CLASS
}