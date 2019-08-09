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
                    'icon' => 'circle', 
                    'animate' => true,         
                    'show_user_review' => false,
                ],
                'items' => $stats,
            ];
            // error_log( 'Props : '. print_r($this->props, true));
        }       

        public function get_html()
        {
            $html  = '<div class=".hrp-container">';
            $html .= '<ul class="hrp-review-list">';
            $stat_html = '';

            foreach ($this->props['items'] as $key => $value) {
                $stats_cumulative_score += $value;

                if ($this->is_stat_included($key)) {                    
                    $stat_html .= $this->get_single_stat($key, $value);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stat_html ;

            // if ($this->props['show_user_review']) {
            //     $get_user_review_html = $this->get_user_review();
            // }

            $html .= '</ul></div>';

            return $html;
        }

        public function is_stat_included($key) {

            $key = $this->get_santized_key($key);
            if (in_array($key, $this->props['collection']['show_stats'])) {
                return true;
            }

            return false;
        }

        public function get_santized_key($key) {            
            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count) {

            $overall_stat_value = $stats_cumulative_score / $count;
            $overall_stat_html = $this->get_single_stat(__('Overall', 'helpie-reviews'), $overall_stat_value);

            return $overall_stat_html;
        }

        public function get_single_stat($key, $value){
            $html = '';
            $html .= '<li>';
            $html .='<div class="single_review">';
            $html .= '<div class="review__results__wrapper">';
            $html .= $this->get_image_wrapper_html();
            $html .= '</div>';
            $html .= $this->get_image_results_html($value); 
            $html .='</div>'; 
            $html .= '<span>'.$key.'</span>'; 
            $html .= '</li>';

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

        public function get_image_results_html($value)
        {
            $html = '';     
            $html .= '<div class="review__results" data-value="'.$value.'" data-animate="'.$this->props['collection']['animate'].'" style="width: '.$value.'%">';       
            $fallback_image_url = HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png';
            $image_url = $this->props['collection']['image_url'];

            for($ii = 0; $ii<5; $ii++){                
                $html .= "<img src='".$fallback_image_url."'>";
            }
            $html .= '</div>';
            
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