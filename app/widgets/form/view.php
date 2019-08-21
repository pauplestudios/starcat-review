<?php

namespace HelpieReviews\App\Widgets\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Form\View')) {
    class View
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;            
            
            $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
            $this->progress_bar_rating = new \HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating($viewProps);
        }

        public function get_html()
        {               
            $html = "<div class='hrp-container'>";
            $html .= "<div class='ui segment'>";    
            
            // Review Form Title
            $html .= '<div class="ui attached label">';
            $html .= ($this->props['collection']['review_form_title'])? $this->props['collection']['review_form_title'] : __("Helpie Review Form", "helpie-reviews");
            $html .= '</div>';   

            // Review Form
            $html .= '<form class="ui form hrp-form" name="hrp-form-submission" method="post">';
            
            $html .= '</br><div class="field"> <label>Review Title</label>';
            $html .= '<input type="text" name="review_title" placeholder="Title">';
            $html .= '</div>';
            
            if($this->props['collection']['display_user_review']){
                $html .= $this->get_user_review();
            }
            
            $html .= '<div class="field"> <label>Review Description</label>';            
            $html .= '<textarea rows="5" spellcheck="false" name="review_description" placeholder="Description"></textarea>';
            $html .= '</div>';

            if($this->props['collection']['display_pros_and_cons']){
                $html .= $this->get_pros_and_cons(); 
            }

            $html .= '<button class="ui mini submit right button">Submit</button>'; 
            $html .= '</form>';                      
            $html .= "</div></div>";    
               
            return $html;
        }

        protected function get_pros_and_cons()
        {
            $html = '<div class="ui segment">';
            $html .= '<div class="ui two column divided grid">';

            $html .= $this->get_pros_field();
            $html .= $this->get_cons_field();            

            $html .='</div></div>';

            return $html;
        }

        protected function get_pros_field()
        {
            $html = '<div class="column review-pros-repeater">';
            $html .= '<div class="ui attached label"> Pros </div><br />';
            $html .= '<div data-repeater-list=review_pros" >';
            $html .= '<div data-repeater-item >
                <select name="pros" class="ui fluid search dropdown">
                <option value="">Pros</option>            
                <option value="affordable">Affordable</option>
                <option value="ui">UI</option>
                </select>
                <div data-repeater-delete class="mini ui red basic button">&#8722;</div>
            </div></div>';
            $html .= '<div data-repeater-create class="mini ui green basic button">&#65291;</div>';    
            $html .='</div>';

            return $html;
        }

        protected function get_cons_field()
        {
            $html = '<div class="column review-cons-repeater">';
            $html .= '<div class="ui attached label"> Cons </div> <br />';
            $html .= '<div data-repeater-list="review_cons" >';
            $html .= '<div data-repeater-item >
                <select name="cons" class="ui fluid search dropdown">
                <option value="">Cons</option>            
                <option value="affordable">Affordable</option>
                <option value="ui">UI</option>
                </select>
                <div data-repeater-delete class="mini ui red basic button">&#8722;</div>
            </div></div>';
            $html .= '<div data-repeater-create class="mini ui green basic button">&#65291;</div>';    
            $html .= '</div>';

            return $html;
        }

        protected function get_user_review()
        {            
            $html = '<div class="field">';
            $html .= '</br><label>User Review</label>';
            // $html .= '<div class="field ui divided grid"><div class="three column row">';
            $html .= '<ul class="hrp-review-list user-review" 
                data-limit="'.$this->props['collection']['value_limit'].'" 
                data-valueType="'.$this->props['collection']['value_type'].'"
                data-type="'.$this->props['collection']['review_type'].'"
                data-scale="'.$this->props['collection']['star_scale'].'"
                data-segment="'.$this->props['collection']['review_segment'].'"
                >'; 
            foreach($this->props['items'] as $key => $value){

                switch ($this->props['collection']['review_type']) {
                    case "star":                      
                    $html .= $this->get_star_rating($key);                    
                    break;
                    case "progress_bar":
                    $html .= $this->get_progress_bar_rating($key);
                    break;  
                    case "range":
                    $html .= $this->get_range_review($key);
                    break;                
                    default:                    
                    $html .= $this->get_text_rating($key);                
                }
                
            }
            $html .='</ul>';
            $html .= '</div>';
            return $html;
        }

        protected function get_star_rating($key){
            
            return $this->star_rating->get_single_stat($key, 0, 0);
            // return '<div class="column"><div class="ui star rating" name="review_star" data-rating="0" data-max-rating="5"></div></div>';
        }
        protected function get_progress_bar_rating($key){

            return $this->progress_bar_rating->get_single_stat($key, 0, 0);
            // return '<div class="column">
            //     <div class="range-slider">
            //         <input type="range" name="range" class="range" min="0" max="100" value="0"/> 
            //         <div class="ui label range__value">0</div>                             
            //     </div></div>';
        }
        protected function get_text_rating(){
            return '<div class="column">
                <div> Feature </div>
                <div class="ui left labeled input"> 
                    <div class="ui basic label"> # </div>                  
                    <input type="number" name="review_number" placeholder="Number" min="1" max="100" maxlength="2">                   
                </div>
            </div>';
        }

        protected function get_range_review($value = 10, $min = 0, $max = 100) {
			$html = '<div class="hrp-rating-wrapper"><hr class="hrp-divider">';
			
			$html .= '<div class="hrp-user-review__rating">';
			$html .= '<input type="range" min="' . $min . '" max="' . $max . '" value="' . $value . '" class="hrp-user-review__range">';
			$html .= '</div><span class="hrp-user-review__value">' . $value . " / " . $max . "%" . '</span>';
			$html .= '</div>';

			return $html;
		}

    } // END CLASS
}