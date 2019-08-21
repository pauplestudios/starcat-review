<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\Model')) {
    class Model
    {   
        public function __construct($post_id) {
            $this->post_id = $post_id;
        }       

        public function get_viewProps(){
            return [
				'collection' => $this->get_collectionProps(),
				'items' => $this->get_itemsProps(),
			];
        }

        public function get_collectionProps(){
            return [
                'divisor' => 5,
                'display_rating_type' => 'progress_bar', // star, progress_bar or circle
                'star_scale' => 10, // 0-5 or 0-10
                'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
                'value_type' => 'percentage', // or percentage
                'value_limit' => 20, // 20 ,30, 50, 80 and etc..	
                'source_type' => 'image', // or image
                'image_url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                'animate' => true,
                'icon' => 'fa fa-star',                
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