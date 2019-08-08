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
                    'divisor' => 20,
                    'show_stats' => ['overall', 'price', 'ux', 'feature', 'better', 'cool'],
                    'show_value_type' => 'number', // or percentage
                    'show_value_limit' => 10, // 20 ,30, 50, 80 and etc..   
                    'stats_type' => 'image', // or icon or progress                    
                    'icon' => 'circle'              
                    // 'show_user_review' => true,
                ],
                'items' => $stats,
            ];
            
        }

        public function get_html()
        {
            $html  = '<div class=".hrp-container"><ul class="hrp-review-list">';

            foreach ($this->props['items'] as $key => $value) {
                $html .= '<div class="single_review">';
                $html .= '<div class="review__results__wrapper">';
                    $html .= '<div class="review__results">';
                    $html .= $this->get_image_icon();
                    $html .= '</div>'; 
                    $html .= '<span>'.$key.'</span>'; 
                $html .= '</div></div>';
            }
            $html .= '</ul></div>';

            return $html;
        }

        public function get_image_icon()
        {
            $html = '';            
            $fallback_image_url = "";
            $image_url = "$this->props['collection']['image']";
            

            return $html;
        }
    }
}

// Custom Image