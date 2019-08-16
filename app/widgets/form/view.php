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
            $html .= "<div class='hrp-form ui segment'>";            
            $html .= '<div class="ui attached label"> Stats Review Form </div>';   
            $html .= '<div class="ui tiny form">';
            
            $html .= '</br><div class="field"> <label>Review Title</label>';
            $html .= '<input type="text" name="review_title" placeholder="Title">';
            $html .= '</div>';

            $html .= '<div class="field"> <label>Review Description</label>';
            $html .= '<textarea rows="3" spellcheck="false" placeholder="Description"></textarea>';
            $html .= '</div>';

            $html .= $this->get_pros_and_cons();
         
            $html .= '<div class="ui mini submit right button">Submit</div>';
            $html .= '</div>';                       

            $html .= "</div></div>";    
               
            return $html;
        }

        protected function get_pros_and_cons()
        {
            $html = '<div class="ui segment"><div class="ui two column relaxed padded grid">
                <div class="column">
                <div class="ui attached label"> Pros </div>   
                    <div class="field">
                        <p>item 1</p>
                        <p>item 2</p>
                    </div>
                </div>
                <div class="column">
                <div class="ui attached label"> Cons </div>
                    <div class="field">
                        <p>item 1</p>
                        <p>item 2</p>
                    </div>
                </div> 
            </div>
            <div class="ui vertical divider">and</div>
            </div>';

            return $html;
        }

    } // END CLASS
}