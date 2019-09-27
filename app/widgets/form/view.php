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
            $this->bar_rating = new \HelpieReviews\App\Views\Rating_Types\Bar_Rating($viewProps);
        }

        public function get_html()
        {
            $html = "<div class='hrp-container'>";
            $html .= "<div class='ui segment'>";

            if ($this->props['collection']['display_form_title']) {
                $html .= '<div class="ui attached label">';
                $html .= ($this->props['collection']['form_title']) ? $this->props['collection']['form_title'] : __("Helpie Review Form", "helpie-reviews");
                $html .= '</div></br>';
            }

            $html .= '<form class="ui form hrp-form" name="hrp-form-submission" method="post">';

            if ($this->props['collection']['display_title']) {
                $html .= '<div class="field">';
                $html .= '<label>Review Title</label>';
                $html .= '<input type="text" name="title" placeholder="Title" />';
                $html .= '</div><br / ><br />';
            }

            if ($this->props['collection']['display_user_stat']) {
                $html .= '<div class="field">';
                $html .= $this->get_user_review();
                $html .= '</div>';
            }

            if ($this->props['collection']['display_description']) {
                $html .= '<div class="field">';
                $html .= '<label>Review Description</label>';
                $html .= '<textarea rows="5" spellcheck="false" name="description" placeholder="Description"></textarea>';
                $html .= '</div>';
            }

            if ($this->props['collection']['display_pros_and_cons']) {
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

            $html .= '</div></div>';

            return $html;
        }

        protected function get_pros_field()
        {
            $html = '<div class="column review-pros-repeater">';
            $html .= '<div class="ui attached label"> Pros </div><br />';
            $html .= '<div data-repeater-list="pros" >';
            $html .= '<div data-repeater-item >
                <select class="ui fluid search dropdown" data-pros="pros" >
                <option value="">Pros</option>            
                <option value="affordable">Affordable</option>
                <option value="ui">UI</option>
                </select>
                <div data-repeater-delete class="mini ui red basic button">&#8722;</div>
            </div></div>';
            $html .= '<div data-repeater-create class="mini ui green basic button">&#65291;</div>';
            $html .= '</div>';

            return $html;
        }

        protected function get_cons_field()
        {
            $html = '<div class="column review-cons-repeater">';
            $html .= '<div class="ui attached label"> Cons </div> <br />';
            $html .= '<div data-repeater-list="cons" >';
            $html .= '<div data-repeater-item >
                <select  class="ui fluid search dropdown"  data-cons="cons" >
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
            $html  = '';
            $html .= '<label>User Review</label>';
            $html .= '<ul class="review-list"
                data-type="' . $this->props['collection']['review_type'] . '"
                data-limit="' . $this->props['collection']['limit'] . '" 
                data-valuetype="' . $this->props['collection']['value_type'] . '"
                data-no-rated-message ="' . $this->props['collection']['no_rated_message'] . '"
                data-list="items"
                >';

            foreach ($this->props['items'] as $key => $value) {
                switch ($this->props['collection']['review_type']) {
                    case "star":
                        $html .= $this->get_star_rating($key);
                        break;
                    case "bar":
                        $html .= $this->get_bar_rating($key);
                        break;
                    case "range":
                        $html .= $this->get_range_rating_fallback($key);
                        break;
                    default:
                        $html .= $this->get_text_rating_fallback($key);
                }
            }

            $html .= '</ul>';

            return $html;
        }

        protected function get_star_rating($key)
        {
            return $this->star_rating->get_review_stat($key, 0, 0);
        }

        protected function get_bar_rating($key)
        {
            return $this->bar_rating->get_review_stat($key, 0, 0);
        }

        //  Todo: Text Rating
        protected function get_text_rating_fallback()
        {
            return '<div class="column">
                <div> Feature </div>
                <div class="ui left labeled input"> 
                    <div class="ui basic label"> # </div>                  
                    <input type="number" name="review_number" placeholder="Number" min="1" max="100" maxlength="2">                   
                </div>
            </div>';
        }

        //  Todo: Range Rating
        protected function get_range_rating_fallback($value = 10, $min = 0, $max = 100)
        {
            $html = '<div class="hrp-rating-wrapper"><hr class="hrp-divider">';

            $html .= '<div class="hrp-user-review__rating">';
            $html .= '<input type="range" min="' . $min . '" max="' . $max . '" value="' . $value . '" class="hrp-user-review__range">';
            $html .= '</div><span class="hrp-user-review__value">' . $value . " / " . $max . "%" . '</span>';
            $html .= '</div>';

            return $html;
        }
    } // END CLASS
}
