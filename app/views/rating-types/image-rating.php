<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Image_Rating')) {
    class Image_Rating
    {
        private $html;

        public function __construct($stats)
        { 
           $this->props = [
                'collection' => [
                    // 'divisor' => 20,
                    'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
                    'show_value_type' => 'number', // or percentage
                    'show_value_limit' => 10, // 20 ,30, 50, 80 and etc..   
                    'stats_type' => 'image', // or icon or progress     
                    'image_url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                    'icon' => 'circle'              
                    // 'show_user_review' => true,
                ],
                'items' => $stats,
            ];
            // error_log( 'Props : '. print_r($this->props, true));
        }       

        public function get_html()
        {
            $html  = '<div class=".hrp-container">';
            $html .= '<ul class="hrp-review-list">';

            foreach ($this->props['items'] as $key => $value) {
                $html .= '<li>';
                $html .='<div class="single_review">';
                    $html .= '<div class="review__results__wrapper">';
                    $html .= $this->get_image_wrapper_html();
                    $html .= '</div>';
                    $html .= $this->get_image_results_html(); 
                $html .='</div>'; 
                $html .= '<span>'.$key.'</span>'; 
                $html .= '</li>';
            }
            $html .= '</ul></div>';

            return $html;
        }

        public function get_image_wrapper_html()
        {
            $html = '';
            $fallback_image_url = HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png';
            for($ii = 0; $ii<5; $ii++){                
                $html .= "<img src='".$fallback_image_url."'>";
            }

            return $html;
        }

        public function get_image_results_html()
        {
            $html = '';     
            $html .= '<div class="review__results">';       
            $fallback_image_url = HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png';
            $image_url = $this->props['collection']['image_url'];

            for($ii = 0; $ii<5; $ii++){                
                $html .= "<img src='".$fallback_image_url."'>";
            }
            $html .= '</div>';
            // error_log('fallback_image_url : ' .$fallback_image_url);
            // error_log( 'Image : '. $image_url);
            return $html;
        }

        // protected function get_image()
        // {
        //     $image = get_option('helpie-reviews')['stats-list'][0]['stat_image']['url'];
            
        //     return $image;
        // }
    }
}

// Custom Image