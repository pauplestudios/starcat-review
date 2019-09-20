<?php

namespace HelpieReviews\App\Views\Rating_Types;

use \HelpieReviews\App\Views\Rating_Types\Rating_Type as Rating_Type;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Bar_Rating')) {
    class Bar_Rating extends Rating_Type
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;
            $this->limit = $viewProps['collection']['limit'];
        }

        public function get_view()
        {
            $stats_cumulative_score = 0;
            $count = 0;

            $html = '<ul class="reviewed-list"
                data-animate="' . $this->props['collection']['animate'] . '"
            >';
            $stats_html = '';

            foreach ($this->props['items'] as $key => $value) {

                $stats_cumulative_score += $value;
                $score = $this->get_value_byType($value);

                if ($this->is_stat_included($key, $this->props['collection'])) {
                    $stats_html .= $this->get_reviewed_stat($key, $value, $score);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stats_html;
            $html .= "</ul>";

            return $html;
        }

        public function get_review_stat($key, $value, $score)
        {
            $html = '<li class="review-item">';

            $html .= '<div class="review-item-bars"
                title="' . $score . ' / ' . $this->props['collection']['limit'] . '"
                result                
            >';
            $html .= $this->get_bars_box_html();
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

        public function get_reviewed_stat($key, $value, $score)
        {
            $html = '<li class="reviewed-item">';

            $html .= '<div class="reviewed-item-bars"
                title="' . $score . ' / ' . $this->props['collection']['limit'] . '"
            >';
            $html .= $this->get_bars_box_html($score, $value);
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

        protected function get_bars_box_html($score = 0, $width = 0)
        {
            $width = $this->props['collection']['animate'] == true ? 0 : $width;
            $html = '<div class="bars-wrapper">';
            $html .= '<div class="bars-result" style="width: ' . $width . '%;"></div>';
            $html .= '<div class="bars-score"> ' . $score . ' / ' . $this->props['collection']['limit'] . '</div>';
            $html .= '</div>';
            return $html;
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count)
        {
            $overall_stat_value = round($stats_cumulative_score / $count);
            $overall_number_value = $this->get_value_byType($overall_stat_value);
            $overall_stat_html = $this->get_reviewed_stat(__('overall', 'helpie-reviews'), $overall_stat_value, $overall_number_value);

            return $overall_stat_html;
        }

        private function get_value_byType($value)
        {
            $divisor = 100 / $this->limit;
            $number = $value / $divisor;
            return $number;
        }
    }
}

// 1 to 10