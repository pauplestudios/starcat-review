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
            $stats_cumulative_score = 0; 
            $count = 0;

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


            $html .= '</ul></div>';

            return $html;
        }

        public function get_single_stat($key, $value, $star_value)
        {
            $html = '';
            $html .= '<li>';
            $html .='<div class="single-review">';
            $html .= '<div class="single-review__wrapper">';
            $html .= $this->get_wrapper_html();
            $html .= '</div>';
            $html .= $this->get_results_html($key, $value, $star_value); 
            $html .='</div>'; 
            $html .= '<div class="single-review__label">'.$key.' - <span>'.$star_value.'</span></div>';
            
            $html .= '</li>';

            return $html;
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count) {

            $overall_stat_value = $stats_cumulative_score / $count;
            $overall_star_value = $this->get_star_value($overall_stat_value);            

            $overall_stat_html = $this->get_single_stat(__('Overall', 'helpie-reviews'), $overall_stat_value, $overall_star_value);

            return $overall_stat_html;
        }        

        protected function get_star_value($value) {
            $star_value =$value / $this->props['collection']['star_scale'];            
            return (floor($star_value * 2) / 2);
		}

        protected function get_wrapper_html()
        {
            if($this->props['collection']['source_type'] == 'image'){
                return $this->get_image_wrapper_html();
            }

            return $this->get_icon_wrapper_html();
        }

        protected function get_results_html($key, $value, $star_value)
        {
            
            if($this->props['collection']['source_type'] == 'image'){
                return $this->get_image_results_html($key, $value, $star_value);
            }

            return $this->get_icon_results_html($key, $value, $star_value);
        }

        protected function get_icon_wrapper_html()
        {
            $html = '';
            $icon = $this->props['collection']['icon'];
            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<i class='".$icon."'></i>";
            }

            return $html;
        }

        protected function get_icon_results_html($key, $value, $star_value)
        {
            $html = '';     
            $html .= '<div 
                class="single-review__results"
                name="'.$key.'" 
                title="'.$star_value.' / '.$this->props['collection']['star_scale'].'"
                value="'.$value.'" 
                data-rating="0" 
                data-animate="'.$this->props['collection']['animate'].'" 
                style="width: 0%"
                >';       
            
            $fallback_icon = 'fa fa-star';
            $icon = $this->props['collection']['icon'];
            
            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= '<i class="'.$icon.'"></i>';
            }
            
            $html .= '</div>';            
            
            return $html;
        }

        protected function get_image_wrapper_html()
        {
            $html = '';
            
            $fallback_image = HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png';
            $image_src = $this->props['collection']['image'];
            
            
            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<img src='".$image_src."'>";
            }

            return $html;
        }

        protected function get_image_results_html($key, $value, $star_value)
        {                    
            $html = '';                 
            $html .= '<div 
                class="single-review__results" 
                name="'.$key.'" 
                title= "'.$star_value.' / '.$this->props['collection']['star_scale'].'"
                data-item-name = "'.$key.'" 
                value="'.$value.'" 
                data-animate="'.$this->props['collection']['animate'].'" 
                style="width:0%"
                >';       

            $fallback_image = HELPIE_REVIEWS_URL . 'includes/assets/img/filled-tomato.png';
            $image_src = $this->props['collection']['image_overlay'];            

            for($ii = 0; $ii<$this->props['collection']['star_scale']; $ii++){                
                $html .= "<img src='".$image_src."'>";
            }
            $html .= '</div>';
            
            return $html;
        }        
    }
}

// Custom Image