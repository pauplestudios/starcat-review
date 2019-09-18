<?php

namespace HelpieReviews\App\Views\Rating_Types;

use \HelpieReviews\App\Views\Rating_Types\Rating_Type as Rating_Type;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Star_Rating')) {
    class Star_Rating extends Rating_Type
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;
        }

        public function get_view()
        {
            $stats_cumulative_score = 0;
            $count = 0;

            $html = '<ul class="reviewed-list"
                data-animate="' . $this->props['collection']['animate'] . '"
            >';
            $stat_html = '';

            foreach ($this->props['items'] as $key => $value) {

                $stats_cumulative_score += $value;
                $score = $this->get_score($value);

                if ($this->is_stat_included($key, $this->props['collection'])) {
                    $stat_html .= $this->get_reviewed_stat($key, $value, $score);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stat_html;
            $html .= '</ul>';

            return $html;
        }

        public function get_review_stat($key, $value, $score)
        {
            $html = '<li class="review-item">';

            $html .= '<div class="review-item-stars"
                title="' . $score . ' / ' . $this->props['collection']['limit'] . '"
                result                
            >';
            $html .= $this->get_wrapper_html();
            $html .= $this->get_result_html($value);
            $html .= '<input type="hidden" name="score" value="' . $value . '">';
            $html .= '</div>';

            $html .= '<div class="review-item-label">';
            $html .= '<span class="review-item-label__text">' . $key . '</span>';
            $html .= '<span class="review-item-label__divider"></span>';
            $html .= '<span class="review-item-label__score">' . $score . '</span>';
            $html .= '</div>';


            $html .= '</li>';

            return $html;
        }

        protected function get_reviewed_stat($key, $value, $score)
        {
            $html = '<li class="reviewed-item">';

            $html .= '<div class="reviewed-item-stars"
                title="' . $score . ' / ' . $this->props['collection']['limit'] . '"
            >';
            $html .= $this->get_wrapper_html();
            $html .= $this->get_result_html($value);
            $html .= '<input type="hidden" name="score" value="' . $value . '">';
            $html .= '</div>';

            $html .= '<div class="reviewed-item-label">';
            $html .= '<span class="reviewed-item-label__text">' . $key . '</span>';
            $html .= '<span class="reviewed-item-label__divider"></span>';
            $html .= '<span class="reviewed-item-label__score">' . $score . '</span>';
            $html .= '</div>';

            $html .= '</li>';

            return $html;
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count)
        {

            $overall_value = $stats_cumulative_score / $count;
            $overall_score = $this->get_score($overall_value);

            $overall_stat_html = $this->get_reviewed_stat(__('Overall', 'helpie-reviews'), $overall_value, $overall_score);

            return $overall_stat_html;
        }

        protected function get_wrapper_html()
        {
            $outline_icon = $this->props['collection']['outline_icon'];
            $icon_html = "<i class='" . $outline_icon . "'></i>";
            $image_html = "<img src='" . $outline_icon . "' />";

            $outline_icon_html = ($this->props['collection']['source_type'] == 'icon') ? $icon_html : $image_html;

            $html = "<div class='stars-wrapper'>";
            for ($ii = 0; $ii < $this->props['collection']['limit']; $ii++) {
                $html .= $outline_icon_html;
            }
            $html .= "</div>";

            return $html;
        }

        protected function get_result_html($value)
        {
            $icon = $this->props['collection']['icon'];
            $filled_icon_html = "<i class='" . $icon . "'></i>";
            $filled_image_html = "<img src='" . $icon . "' />";

            $icon_html = ($this->props['collection']['source_type'] == 'icon') ? $filled_icon_html : $filled_image_html;

            $html = '<div class="stars-result" style="width: ' . $value . '%">';
            for ($ii = 0; $ii < $this->props['collection']['limit']; $ii++) {
                $html .= $icon_html;
            }
            $html .= '</div>';

            return $html;
        }

        private function get_score($value)
        {
            $divisor = ($this->props['collection']['limit'] == 10) ? 10 : 20;
            $score = $value / $divisor;

            return (floor($score * 2) / 2);
        }
    }
}
