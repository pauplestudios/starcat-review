<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Star_Rating')) {
    class Star_Rating
    {
        private $html;

        public function __construct($stats)
        {
            $this->model = $stats;
        }

        public function get_html()
        {
            $html = "<div class='hrp-rating-collection hrp-container '>";
            $count = 1;
            foreach ($this->model as $key => $value) {

                error_log('$value : ' . $value);
                $star_value = $value / 20;
                $html .= "<div class='single-rating'><span class='rating-label'>" . $key . "</span>";
                $html .= $this->get_star_set($star_value,  $key);
                $html .= "</div>";
                $count++;
            }
            $html .= "</div>";

            $this->html = $html;
            return $this->html;
        }

        public function get_star_set($star_value,  $key = 'star')
        {
            $html = '';
            $html .= '<fieldset class="rating-fieldset">';

            $star_value = (floor($star_value * 2) / 2);

            error_log('$star_value : ' . $star_value);

            // $star_value = 4;
            for ($ii = 5; $ii >= 1; $ii--) {

                $previous_ii = $ii - 1;

                $checked = '';
                $half_checked = '';
                if ($ii == $star_value) {
                    // $additional_class .= ' active';
                    $checked = 'checked';
                }

                if ($ii - 0.5 == $star_value) {
                    // $additional_class .= ' active';
                    $half_checked = 'checked';
                }

                $id = $key . '-rating' . $ii;
                $half_id = $key . '-rating';

                if ($previous_ii != 0) {
                    $half_id = '-rating' . $previous_ii;
                }

                $html .= '<input type="radio" ' . $checked . ' id="' . $id . '" name="' . $key . '-rating" value="' . $ii . '"  /><label class = "full" for="' . $id . '" title="Sucks big time - 1 star"></label>';
                $html .= '<input type="radio" ' . $half_checked . ' id="' . $id . 'half" name="' . $key . '-rating" value="half" /><label class="half" for="' . $id . 'half" title="Sucks big time - 0.5 stars"></label>';
            }


            $html .= '</fieldset>';
            return $html;
        }
        public function get_star_set_old($star_value = 5)
        {
            $html = '';
            $html .= '<fieldset class="rating">';
            $html .= '<input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>';
            $html .= '<input type="radio" id="star4half" name="rating" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>';
            $html .= '<input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>';
            $html .= '<input type="radio" id="star3half" name="rating" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>';
            $html .= ' <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>';
            $html .= '<input type="radio" id="star2half" name="rating" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>';
            $html .= '<input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>';
            $html .= '<input type="radio" id="star1half" name="rating" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>';
            $html .= '<input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>';
            $html .= '<input type="radio" id="starhalf" name="rating" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>';

            $html .= '</fieldset>';

            return $html;
        }
    } // END CLASS
}