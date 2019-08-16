<?php

namespace HelpieReviews\App\Views\Rating_Types;

use \HelpieReviews\App\Views\Rating_Types\Rating_Type as Rating_Type;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Star_Rating')) {
    class Star_Rating extends Rating_Type
    {
        private $html;

        public function __construct($viewProps)
        { 
           $this->props = $viewProps;
        }       

        public function get_html()
        {
            $html  = '<div class="hrp-container">';
            $html .= '<ul class="hrp-review-list">';
            $stat_html = '';            

            foreach ($this->props['items'] as $key => $value) {                
                $stats_cumulative_score += $value;
                $star_value = $this->get_star_value($value);

                if ($this->is_stat_included($key, $this->props['collection'])) {                    
                    $stat_html .= $this->get_single_stat($key, $value, $star_value);
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

        protected function get_overall_stat_html($stats_cumulative_score, $count) {

            $overall_stat_value = $stats_cumulative_score / $count;
            $overall_star_value = $this->get_star_value($overall_stat_value);            

            $overall_stat_html = $this->get_single_stat(__('Overall', 'helpie-reviews'), $overall_stat_value, $overall_star_value);

            return $overall_stat_html;
        }

        public function get_single_stat($key, $value, $star_value)
        {
            $html = '';
            $html .= '<li>';
            $html .='<div class="single-review">';
            $html .= '<div class="single-review__wrapper">';
            $html .= $this->get_wrapper_html();
            $html .= '</div>';
            $html .= $this->get_results_html($value); 
            $html .='</div>'; 
            $html .= '<span>'.$key.' - '.$star_value.'</span>';
            
            $html .= '</li>';

            return $html;
        }

        protected function get_star_value($value) {
            $star_value =$value / $this->props['collection']['divisor'];
            // error_log("Star Value : " . round($star_value));
            return (floor($star_value * 2) / 2);
		}

        protected function get_wrapper_html()
        {
            if($this->props['collection']['source_type'] == 'image'){
                return $this->get_image_wrapper_html();
            }

            return $this->get_icon_wrapper_html();
        }

        protected function get_results_html($value)
        {
            
            if($this->props['collection']['source_type'] == 'image'){
                return $this->get_image_results_html($value);
            }

            return $this->get_icon_results_html($value);
        }

        public function get_icon_wrapper_html()
        {
            $html = '';
            $fallback_icon = 'fa fa-star';
            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<i class='".$fallback_icon."'></i>";
            }

            return $html;
        }

        protected function get_icon_results_html($value)
        {
            $html = '';     
            $html .= '<div class="single-review__results" data-valuenow="'.$value.'" data-animate="'.$this->props['collection']['animate'].'" style="width: 0%">';       
            $fallback_icon = 'fa fa-star';
            $icon = $this->props['collection']['icon'];

            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= '<i class="'.$icon.'"></i>';
            }
            $html .= '</div>';
            
            return $html;
        }

        public function get_image_wrapper_html()
        {
            $html = '';
            $fallback_image_url = HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png';
            $image_url = $this->props['collection']['image_url'];
            $image_src = ($image_url)?$image_url:$fallback_image_url;
            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<img src='".$image_src."'>";
            }

            return $html;
        }

        public function get_image_results_html($value)
        {                    
            $html = '';                 
            $html .= '<div class="single-review__results" data-valuenow="'.$value.'" data-animate="'.$this->props['collection']['animate'].'" style="width:0%">';       
            $fallback_image_url = HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png';
            $image_url = $this->props['collection']['image_url'];
            $image_src = $fallback_image_url;

            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<img src='".$image_src."'>";
            }
            $html .= '</div>';
            
            return $html;
        }        
    }
}

// Custom Image