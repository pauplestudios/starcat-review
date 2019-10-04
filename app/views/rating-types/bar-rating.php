<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Bar_Rating')) {
    class Bar_Rating
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;
            $this->limit = $viewProps['collection']['limit'];
        }

        public function get_view()
        {

            $html = '<ul class="reviewed-list"
                data-animate="' . $this->props['collection']['animate'] . '"
            >';

            foreach ($this->props['items'] as $key => $stat) {
                $html .= $this->get_reviewed_stat($key, $stat['value'], $stat['score']);
            }

            $html .= '</ul>';

            return $html;
        }

        public function get_review_stat($key, $value, $score)
        {
            $html = '<li class="review-item">';

            $html .= '<div class="review-item-bars"
                title="' . $this->props['collection']['no_rated_message'] . '"
                result                
            >';
            $html .= $this->get_bars_box_html();
            $html .= '<input type="hidden" name="scores[' . strtolower($key) . ']"  value="' . $value . '">';
            $html .= '</div>';

            $html .= '<div class="review-item-label">';
            $html .= '<span class="review-item-label__text">' . $key . '</span>';
            $html .= '<span class="review-item-label__divider"></span>';
            if ($this->props['collection']['show_rating_label']) {
                $html .= '<span class="review-item-label__score">' . $score . '</span>';
            }
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
            $html .= '<input type="hidden" name="scores[' . strtolower($key) . ']" value="' . $value . '">';
            $html .= '</div>';

            $html .= '<div class="reviewed-item-label">';
            $html .= '<span class="reviewed-item-label__text">' . $key . '</span>';
            $html .= '<span class="reviewed-item-label__divider"></span>';
            if ($this->props['collection']['show_rating_label']) {
                $html .= '<span class="reviewed-item-label__score">' . $score . '</span>';
            }
            $html .= '</div>';

            $html .= '</li>';

            return $html;
        }

        protected function get_bars_box_html($score = 0, $width = 0)
        {
            $width = $this->props['collection']['animate'] == true ? 0 : $width;
            $score = ($score == 0) ? $this->props['collection']['no_rated_message'] : $score . ' / ' . $this->props['collection']['limit'];

            $html = '<div class="bars-wrapper">';
            $html .= '<div class="bars-result" style="width: ' . $width . '%;"></div>';
            $html .= '<div class="bars-score"> ' . $score . '</div>';
            $html .= '</div>';
            return $html;
        }
    }
}
