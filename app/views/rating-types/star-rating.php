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

            $html = '<div class="hrp-container">';
            $html .= '<ul class="hrp-review-list">';
            $stat_html = '';

            foreach ($this->props['items'] as $key => $value) {

                $stats_cumulative_score += $value;
                $score = $this->get_score($value);

                if ($this->is_stat_included($key, $this->props['collection'])) {
                    $stat_html .= $this->get_single_stat($key, $value, $score);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stat_html;

            $html .= '</ul></div>';

            return $html;
        }

        public function get_single_stat($key, $value, $score)
        {
            $html = '';
            $html .= '<li>';
            $html .= '<div class="single-review">';
            $html .= '<div class="single-review__wrapper">';
            $html .= $this->get_wrapper_html();
            $html .= '</div>';
            $html .= $this->get_results_html($key, $value, $score);
            $html .= '</div>';
            $html .= '<div class="single-review__label">' . $key . ' - <span>' . $score . '</span></div>';

            $html .= '</li>';

            return $html;
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count)
        {

            $overall_value = $stats_cumulative_score / $count;
            $overall_score = $this->get_score($overall_value);

            $overall_stat_html = $this->get_single_stat(__('Overall', 'helpie-reviews'), $overall_value, $overall_score);

            return $overall_stat_html;
        }

        protected function get_score($value)
        {
            $divisor = ($this->props['collection']['star_scale'] == 10) ? 10 : 20;
            $score = $value / $divisor;

            return (floor($score * 2) / 2);
        }

        protected function get_wrapper_html()
        {
            $html = '';

            $outline_icon = $this->props['collection']['outline_icon'];
            $icon_html = "<i class='" . $outline_icon . "'></i>";
            $image_html = "<img src='" . $outline_icon . "' />";

            $outline_icon_html = ($this->props['collection']['source_type'] == 'icon') ? $icon_html : $image_html;

            for ($ii = 0; $ii < $this->props['collection']['star_scale']; $ii++) {
                $html .= $outline_icon_html;
            }

            return $html;
        }

        protected function get_results_html($key, $value, $score)
        {
            $icon = $this->props['collection']['icon'];
            $filled_icon_html = "<i class='" . $icon . "'></i>";
            $filled_image_html = "<img src='" . $icon . "' />";

            $icon_html = ($this->props['collection']['source_type'] == 'icon') ? $filled_icon_html : $filled_image_html;

            $html = '';
            $html .= '<div
                class="single-review__results"
                name="' . $key . '"
                title="' . $score . ' / ' . $this->props['collection']['star_scale'] . '"
                value="' . $value . '"
                data-rating="0"
                data-animate="' . $this->props['collection']['animate'] . '"
                style="width: 0%"
                >';


            for ($ii = 0; $ii < $this->props['collection']['star_scale']; $ii++) {
                $html .= $icon_html;
            }

            $html .= '</div>';

            return $html;
        }
    }
}
