<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Rating_Type')) {
    class Rating_Type
    { 
        public function __construct($stats)
        {         
            $this->stats = $stats;         
        }

        public function get_viewProps(){
            return [
				'collection' => [
                    'divisor' => 20,
                    'display_rating_type' => 'star', // progress_bar or circle
                    'star_scale' => 5, // 0-5 or 0-10
					'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
					'show_value_type' => 'number', // or percentage
					'show_value_limit' => 10, // 20 ,30, 50, 80 and etc..	
                    'source_type' => 'icon', // or image
                    'image_url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                    'animate' => true,
                    'icon' => 'fa fa-star',
					'show_user_review' => true
				],
				'items' => $this->stats,
			];
        }

        public function get_stat()
        {    
            $viewProps = $this->get_viewProps();

            $display_rating_type = $viewProps['collection']['display_rating_type'];

            switch ($display_rating_type) {
                case "star":                    
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    return $this->star_rating->get_html();
                    break;
                case "progress_bar":
                    $this->progress_bar_rating = new \HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating($viewProps);
                    return $this->progress_bar_rating->get_html();
                    break;
                case "circle":
                    $this->circle_rating = new \HelpieReviews\App\Views\Rating_Types\Image_Rating($viewProps);
                    return $this->circle_rating->get_html();
                    break;
                default:
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    return $this->star_rating->get_html();                
            }
        }
    
        /** Followings are Service methods for derived classes **/

        protected function is_stat_included($stat_item) {			
			$stat_item = $this->get_santized_key($stat_item);
			if (in_array($stat_item, $this->props['collection']['show_stats'])) {
				return true;
			}

			return false;
		}

        protected function get_santized_key($key) { 
                   
            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }
        
    } // END CLASS
}