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
            $class = '';
            $title = '';
            $display = '';
            $cancel_btn = '';
            $description = '';
            $method_type = 'POST';
            $submit_btn_name = 'Submit';

            // User Already Reviewed or Not Logged in User
            if (!$this->props['collection']['can_user_review']) {
                $class = 'mini';
                $method_type = 'PUT';
                $display = 'style="display: none"';
                $review = $this->props['items']['current_user_review'];
                $title = (isset($review['title'])) ? $review['title'] : '';
                $description = (isset($review['description'])) ? $review['description'] : '';

                $cancel_btn = '<div class="ui cancel ' . $class . ' button"> Cancel </div>';
                $submit_btn_name = 'Save';
            }

            $html = '<form
            class="ui form scr-user-review ' . $class . '"
            action="scr_user_review_submission"
            method="post"
            enctype="multipart/form-data"
            post_id ="' . $this->props['collection']['post_id'] . '"
            ' . $display . '
            data-method="' . $method_type . '"
            >';

            if ($this->props['collection']['show_title']) {
                $html .= '<div class="inline field">';
                // $html .= '<label>Review Title</label>';
                $html .= '<input type="text" name="title" placeholder="Title" value="' . $title . '"/>';
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
                $html .= '<textarea rows="5" spellcheck="false" name="description" placeholder="Description">' . $description . '</textarea>';
                $html .= '</div>';
            }

            if ($this->props['collection']['show_prosandcons']) {
                $html .= $this->get_pros_and_cons();
            }

            $html .= apply_filters('scr_photos_review/get_single_review_photos_field', '');

            if ($this->props['collection']['show_captcha']) {
                $html .= Recaptcha::load_v2_html();
            }

            $html .= '<div class="field">';
            $html .= '<div class="ui blue submit ' . $class . ' button"> ' . $submit_btn_name . ' </div>';
            $html .= $cancel_btn;
            $html .= '</div>';

            $html .= '</form>';

            return $html;
        }

        protected function get_pros_and_cons()
        {
            $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
            return $prosandcons->get_fields($this->props);
        }

        protected function get_user_review()
        {
            $html = '';
            if (sizeof($this->props['items']['stats']) == 0) {
                return $html;
            }

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
                    // case "bar":
                    //     $html .= $this->get_bar_rating($key);
                    //     break;
                    default:
                        $html .= $this->get_star_rating($key);
                }
            }

            $html .= '</ul>';

            return $html;
        }

        protected function get_star_rating($key)
        {
            $score = 0;
            $rating = 0;

            if (isset($this->props['items']['current_user_review']['stats']) && !empty($this->props['items']['current_user_review']['stats'])) {
                $rating = $this->props['items']['current_user_review']['stats'][$key]['rating'];
                $score = $rating / (100 / $this->props['collection']['limit']);
            }

            return $this->star_rating->get_review_stat($key, $rating, $score);
        }

        protected function get_bar_rating($key)
        {
            return $this->bar_rating->get_review_stat($key, 5, 5);
        }

        //  Todo: Text Rating
        // protected function get_text_rating_fallback()
        // {
        //     return '<div class="column">
        //         <div> Feature </div>
        //         <div class="ui left labeled input">
        //             <div class="ui basic label"> # </div>
        //             <input type="number" name="review_number" placeholder="Number" min="1" max="100" maxlength="2">
        //         </div>
        //     </div>';
        // }

        //  Todo: Range Rating
        // protected function get_range_rating_fallback($value = 10, $min = 0, $max = 100)
        // {
        //     $html = '<div class="scr-rating-wrapper"><hr class="scr-divider">';

        //     $html .= '<div class="scr-user-review__rating">';
        //     $html .= '<input type="range" min="' . $min . '" max="' . $max . '" value="' . $value . '" class="scr-user-review__range">';
        //     $html .= '</div><span class="scr-user-review__value">' . $value . " / " . $max . "%" . '</span>';
        //     $html .= '</div>';

        //     return $html;
        // }
    } // END CLASS
}
