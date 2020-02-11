<?php

namespace StarcatReview\App\Components\Form;

use \StarcatReview\Services\Recaptcha as Recaptcha;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Form\View')) {
    class View
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;

            $this->star_rating = new \StarcatReview\App\Views\Rating_Types\Star_Rating($viewProps);
            $this->bar_rating = new \StarcatReview\App\Views\Rating_Types\Bar_Rating($viewProps);
        }

        public function get()
        {
            $html = '';
            $style = 'style="display: block"';
            // User Already Reviewed or Not Logged in User
            if (!$this->props['collection']['can_user_review']) {
                $style = 'style="display: none"';
            }

            // $html .= '<script src="https://www.google.com/recaptcha/api.js" async defer></script>';
            $html .= '<form class="ui form scr-user-review" action="scr_user_review_submission" method="post" post_id ="' . $this->props['collection']['post_id'] . '" ' . $style . '>';

            if ($this->props['collection']['show_form_title']) {
                $html .= '<h2 class="ui header">';
                $html .= $this->props['collection']['form_title'];
                $html .= '</h2>';
            }

            if ($this->props['collection']['show_title']) {
                $html .= '<div class="inline field">';
                // $html .= '<label>Review Title</label>';
                $html .= '<input type="text" name="title" placeholder="Title" />';
                $html .= '</div>';
            }

            if ($this->props['collection']['show_stats']) {
                $html .= '<div class="rating fields">';
                $html .= $this->get_user_review();
                $html .= '</div>';
            }

            if ($this->props['collection']['show_description']) {
                $html .= '<div class="field">';
                // $html .= '<label>Review Description</label>';
                $html .= '<textarea rows="5" spellcheck="false" name="description" placeholder="Description"></textarea>';
                $html .= '</div>';
            }

            if ($this->props['collection']['show_prosandcons']) {
                $html .= $this->get_pros_and_cons();
            }

            if ($this->props['collection']['show_captcha']) {
                $html .= Recaptcha::load_v2_html();
            }

            $html .= '<div class="field">';
            $html .= '<button class="ui blue submit button"> Submit </button>';
            $html .= '</div>';
            $html .= '</form>';

            return $html;
        }

        protected function get_pros_and_cons()
        {
            $html = '';
            // $html .= '<div class="two fields">';

            $html .= $this->get_pros_field();
            $html .= $this->get_cons_field();

            // $html .= '</div>';

            return $html;
        }

        protected function get_pros_field()
        {
            $html = '<div class="field review-pros-repeater">';
            // $html .= '<div class="ui segment">';
            $html .= '<h5> Pros </h5>';
            $html .= '<div data-repeater-list="pros" >';
            $html .= '<div class="unstackable fields" data-repeater-item >';
            $html .= '<div class="fourteen wide field">';
            $html .= '<select class="ui fluid search prosandcons dropdown" name="pros[0]" data-pros="pros">';
            $html .= $this->get_prosandcons_option('pros');
            $html .= '</select>';
            $html .= '</div>';
            $html .= '<div class="two wide field">';
            $html .= '<div class="ui icon basic button" data-repeater-delete><i class="minus icon"></i></div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '<div data-repeater-create class="ui icon basic button"><i class="plus icon"></i></div>';
            // $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        protected function get_cons_field()
        {
            $html = '<div class="field review-cons-repeater">';
            // $html .= '<div class="ui segment">';
            $html .= '<h5> Cons </h5>';
            $html .= '<div data-repeater-list="cons" >';
            $html .= '<div class="unstackable fields" data-repeater-item >';
            $html .= '<div class="fourteen wide field">';
            $html .= '<select  class="ui fluid search prosandcons dropdown" name="cons[0]" data-cons="cons" >';
            $html .= $this->get_prosandcons_option('cons');
            $html .= '</select>';
            $html .= '</div>';
            $html .= '<div class="two wide field">';
            $html .= '<div data-repeater-delete class="ui icon basic button"><i class="minus icon"></i></div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '<div data-repeater-create class="ui icon basic button"><i class="plus icon"></i></div>';
            // $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        protected function get_prosandcons_option($option)
        {
            $html = '<option value=""> Type a new one or select existing ' . $option . '</option>';
            foreach ($this->props['items'][$option] as $value) {
                if (!empty($value['item'])) {
                    $html .= '<option value="' . $value['item'] . '"> ' . $value['item'] . '</option>';
                }
            }

            return $html;
        }

        protected function get_user_review()
        {
            $html = '';
            if (sizeof($this->props['items']['stats']) == 0) {
                return $html;
            }
            // $html .= '<label>User Review</label>';
            $html .= '<ul class="review-list"
                data-type="' . $this->props['collection']['review_type'] . '"
                data-limit="' . $this->props['collection']['limit'] . '"
                data-steps="' . $this->props['collection']['steps'] . '"
                data-no-rated-message ="' . $this->props['collection']['no_rated_message'] . '"
                data-list="items"
                >';

            foreach ($this->props['items']['stats'] as $key => $value) {
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
            $html = '<div class="scr-rating-wrapper"><hr class="scr-divider">';

            $html .= '<div class="scr-user-review__rating">';
            $html .= '<input type="range" min="' . $min . '" max="' . $max . '" value="' . $value . '" class="scr-user-review__range">';
            $html .= '</div><span class="scr-user-review__value">' . $value . " / " . $max . "%" . '</span>';
            $html .= '</div>';

            return $html;
        }
    } // END CLASS
}