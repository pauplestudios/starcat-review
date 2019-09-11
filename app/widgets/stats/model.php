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
                'display_rating_type' => 'star', // star, bar or circle
                'star_scale' => 10, // 0-5 or 0-10
                'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
                'value_type' => 'percentage', // percentage or number
                'value_limit' => 20, // 10, 20 ,30, 40, 50 and etc..	
                'source_type' => 'icon', // image or icon
                'image' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                'image_overlay' => HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png',
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