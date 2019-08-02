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

            $this->props = [
                'stats' => $stats,
                'divisor' => 20,
                'show_stats' => ['overall', 'price', 'ux']
            ];
        }

        public function get_html()
        {
            $html = "<div class='hrp-rating-collection hrp-container'>";
            $count = 0;

            $stats_html = '';
            $stats_cumulative_score = 0;

            foreach ($this->props['stats'] as $key => $value) {
                $stats_cumulative_score += $value;

                if ($this->is_stat_included($key)) {
                    $stats_html .= $this->get_single_stat($value, $key);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stats_html;
            $html .= "</div>";

            $this->html = $html;
            return $this->html;
        }

        protected function get_single_stat($value, $key)
        {
            $html = '';

            $star_value = $this->get_star_value($value);

            if (!$this->is_stat_included($key)) {
                return $html;
            }

            $html .= "<div class='single-rating'><span class='rating-label'>" . $key . "</span>";
            $html .= $this->get_star_set($star_value,  $key);
            $html .= "</div>";

            return $html;
        }


        protected function get_santized_key($key)
        {
            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }

        protected function is_stat_included($key)
        {
            error_log('$key : ' . $key);
            $key = $this->get_santized_key($key);
            if (in_array($key, $this->props['show_stats'])) {
                return true;
            }

            return false;
        }


        protected function get_overall_stat_html($stats_cumulative_score, $count)
        {
            $overall_stat_value = $stats_cumulative_score / $count;
            $overall_stat_html = $this->get_single_stat($overall_stat_value, __('Overall', 'helpie-reviews'));

            // error_log('$stats_cumulative_score : ' . $stats_cumulative_score);
            // error_log('$overall_stat_value : ' . $overall_stat_value);

            return $overall_stat_html;
        }


        protected function get_star_value($value)
        {
            return $value / $this->props['divisor'];
        }


        protected function get_star_set($star_value,  $key = 'star')
        {
            $html = '';
            $html .= '<fieldset class="rating-fieldset">';

            $star_value = (floor($star_value * 2) / 2);

            // error_log('$star_value : ' . $star_value);

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
                    $half_id = $key . '-rating' . $previous_ii;
                }

                $html .= '<input type="radio" ' . $checked . ' id="' . $id . '" name="' . $key . '-rating" value="' . $ii . '"  /><label class = "full" for="' . $id . '" title="Sucks big time - 1 star"></label>';
                $html .= '<input type="radio" ' . $half_checked . ' id="' . $half_id . 'half" name="' . $key . '-rating" value="half" /><label class="half" for="' . $half_id . 'half" title="Sucks big time - 0.5 stars"></label>';
            }


            $html .= '</fieldset>';
            return $html;
        }
    } // END CLASS
}