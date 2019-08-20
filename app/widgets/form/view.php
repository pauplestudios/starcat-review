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
        }

        public function get_html()
        {   
            $html = "<div class='hrp-container'>";
            $html .= "<div class='hrp-form ui segment' id='hrp-form'>";            
            $html .= '<div class="ui attached label"> Stats Review Form </div>';   
            $html .= '<div class="ui form">';
            
            $html .= '</br><div class="field"> <label>Review Title</label>';
            $html .= '<input type="text" name="review_title" placeholder="Title">';
            $html .= '</div>';
            
            $html .= $this->get_user_review();
            
            $html .= '<div class="field"> <label>Review Description</label>';            
            $html .= '<textarea rows="5" spellcheck="false" placeholder="Description"></textarea>';
            $html .= '</div>';

            $html .= $this->get_pros_and_cons();            
         
            $html .= '<div class="ui mini submit right button">Submit</div>';
            $html .= '</div>';                       

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
            $html = '<div class="column pros-semantic-repeater">';
            $html .= '<div class="ui attached label"> Pros </div><br />';
            $html .= '<div data-repeater-list="pros" >';
            $html .= '<div data-repeater-item >
                <select name="skills" class="ui fluid search dropdown">
                <option value="">Pros</option>            
                <option value="affordable">Affordable</option>
                <option value="ui">UI</option>
                </select>
                <div data-repeater-delete class="ui icon button"><i class="minus circle link icon"></i> </div>
            </div></div>';
            $html .= '<div  data-repeater-create class="ui icon button"> <i class="plus circle link icon"></i></div>';    
            $html .='</div>';

            return $html;
        }

        protected function get_cons_field()
        {
            $html = '<div class="column cons-semantic-repeater">';
            $html .= '<div class="ui attached label"> Cons </div> <br />';
            $html .= '<div data-repeater-list="cons" >';
            $html .= '<div data-repeater-item >
                <select name="skills" class="ui fluid search dropdown">
                <option value="">Cons</option>            
                <option value="affordable">Affordable</option>
                <option value="ui">UI</option>
                </select>
                <div data-repeater-delete class="ui icon button"><i class="minus circle link icon"></i> </div>
            </div></div>';
            $html .= '<div data-repeater-create class="ui icon button"> <i class="plus circle link icon"></i></div>';    
            $html .= '</div>';

            return $html;
        }

        protected function get_user_review()
        {            
            $html = '<div class="field">';
            $html .= '</br><label>User Review</label>';
            $html .= '<div class="field ui divided grid"><div class="three column row">';
            $html .= $this->get_star_rating();
            $html .= $this->get_slider_rating();
            $html .= $this->get_text_rating();
            $html .= '</div></div></div>';
            return $html;
        }

        protected function get_star_rating(){
            return '<div class="column"><div class="ui star rating" data-rating="0" data-max-rating="5"></div></div>';
        }
        protected function get_slider_rating(){
            return '<div class="column">
            <div class="range-slider">
            <input type="range" class="range-slider__range" min="0" max="100" value="0"/> 
            <div class="ui label slider__value">0</div>                             
          </div></div>';
        }
        protected function get_text_rating(){
            return '<div class="column">
                <div class="ui left labeled input"> 
                    <div class="ui basic label">
                        # or %
                    </div>                  
                    <input type="number" placeholder="# or %" min="1" max="100" maxlength="2">                    
                </div>
            </div>';
        }

    } // END CLASS
}
// <div class="ui top attached label"> Pros </div>
// <div class="ui top attached label"> Cons </div>