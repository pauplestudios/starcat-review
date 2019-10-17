<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Star_Rating')) {
    class Star_Rating
    {
        public function __construct($viewProps)
        {
            $this->props = $viewProps;
        }

        public function get_view()
        {
            $html = '';
            if (isset($this->props['items']) && !empty($this->props['items'])) {

                $html .= '<ul class="reviewed-list"
                data-animate="' . $this->props['collection']['animate'] . '"
            >';

                foreach ($this->props['items'] as $key => $stat) {
                    $html .= $this->get_reviewed_stat($key, $stat['rating'], $stat['score']);
                }

                $html .= '</ul>';
            }

            return $html;
        }

        public function get_review_stat($key, $value, $score)
        {
            $html = '<li class="review-item">';

            $html .= '<div class="review-item-stars"
                title="' . $this->props['collection']['no_rated_message'] . '"
                result                
            >';
            $html .= $this->get_wrapper_html();
            $html .= $this->get_result_html($value);
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

        protected function get_reviewed_stat($key, $value, $score)
        {
            $html = '<li class="reviewed-item">';

            $html .= '<div class="reviewed-item-stars"
                title="' . $score . ' / ' . $this->props['collection']['limit'] . '"
            >';
            $html .= $this->get_wrapper_html();
            $html .= $this->get_result_html($value);
            $html .= '<input type="hidden" name="scores[' . strtolower($key) . ']"  value="' . $value . '">';
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

            $value = $this->props['collection']['animate'] == true ? 0 : $value;

            $html = '<div class="stars-result" style="width: ' . $value . '%">';
            for ($ii = 0; $ii < $this->props['collection']['limit']; $ii++) {
                $html .= $icon_html;
            }
            $html .= '</div>';

            return $html;
        }
    }
}
