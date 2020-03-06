<?php

namespace StarcatReviewPt\Components\Photos_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPt\Components\Photos_Review\View')) {
    class View
    {
        public function get_all_photos($props)
        {
            $preview_limit = $props['collection']['preview_limit'];

            $html = '';
            $html .= '<div class="photos-gallery-preview ui tiny images">';
            foreach ($props['items'] as $key => $item) {
                $html .= '<div class="ui image" data-review-id="' . $item['review_id'] . '">';
                $html .= '<img src="' . $item['image_src'] . '"/>';
                if (($props['collection']['preview_limit'] - 1) == $key) {
                    $html .= $this->get_clickable_image_box($props);
                    $html .= '</div>';
                    break;
                }
                $html .= '</div>';
            }
            $html .= '</div>';
            $html .= $this->get_modal($props);

            return $html;
        }

        public function get_single_photos($props)
        {
            $html = '<div class="ui comments">';
            foreach ($props as $key => $images) {
                $html .= $this->get_single_comment($key, $images);
            }
            $html .= '</div>';

            return $html;
        }

        protected function get_clickable_image_box($props)
        {
            $html = '<span ';
            $html .= 'class="show-gallery" ';
            $html .= 'data-limit="' . $props['collection']['photos_per_page'] . '" ';
            $html .= 'data-shown-count="' . $props['collection']['photos_per_page'] . '" ';
            $html .= 'data-total-count="' . $props['collection']['total_count'] . '">+ ';
            $html .= $props['collection']['total_count'];
            $html .= '</span>';

            return $html;
        }

        protected function get_modal($props)
        {

            $html = "<div class='ui dimmer modals photos-review-modal' style='display: none;'>";
            $html .= "<div id='photos-review-modal' class='ui modal' style='display: none;'>";
            $html .= "<i class='circular inverted close icon'></i>";

            // Section 1
            $html .= "<div class='gallery-section'>";
            $html .= "<div class='ui small header'><i class='circular expand icon'></i> All User Review Images </div>";
            $html .= "<div class='scrolling item-content'>";
            $html .= $this->get_photos_gallery($props);
            $html .= '</div>';
            $html .= '</div>';

            // Start Section 2
            $html .= "<div class='slider-section'>";
            $html .= "<div class='ui small header'><i class='circular arrow left icon'></i> Back to Gallery </div>";

            // Slider Top
            $html .= '<div class="scr-photos-review">';
            $html .= '<div class="photos-review-slider-top swiper-container">';
            $html .= '<div class="photos-review-wrapper swiper-wrapper"></div>';
            $html .= $this->get_navigation_buttons();
            $html .= '</div>';

            // Slider Thumbs
            $html .= '<div class="photos-review-slider-thumbs swiper-container">';
            $html .= '<div class="photos-review-wrapper swiper-wrapper"></div>';
            $html .= '</div>';
            $html .= '</div>';

            $html .= '</div>'; // End Section 2

            $html .= "</div>";
            $html .= "</div>";

            return $html;
        }

        protected function get_single_comment($key, $images)
        {
            $html = '<div class="comment">';
            $html .= '<div class="content">';
            $html .= '<a class="author">' . strtoupper($key) . '</a>';
            $html .= '<div class="actions">';
            $html .= '<div class="ui six doubling link cards review-photos">';
            foreach ($images as $image) {
                $html .= '<div class="card" data-review-id="' . $key . '">';
                $html .= '<img class="image" src="' . $image . '" />';
                $html .= '</div>';
            }
            $html .= '</div>';
            $html .= '</div>';

            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        private function get_photos_gallery($props)
        {
            $html = '<div class="ui six doubling link cards photos-gallery">';

            for ($ii = 0; $ii < sizeOf($props['items']); $ii++) {
                $html .= '<div class="card" data-review-id="' . $props['items'][$ii]['review_id'] . '">';
                $html .= '<img class="image" src="' . $props['items'][$ii]['image_src'] . '" />';
                $html .= '</div>';
            }

            $html .= '</div>';

            return $html;
        }

        private function get_navigation_buttons()
        {
            $html = '<div class="photos-review__button-prev"><i class="circular inverted angle left icon"></i></div>';
            $html .= '<div class="photos-review__button-next"><i class="circular inverted angle right icon"></i></div>';

            return $html;
        }

        // Below methods all are not used
        protected function get_slides($size, $limit = '')
        {
            // Get the contents of the JSON file
            $photos_JSON = file_get_contents(SCR_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $html = '<div class="photos-review-wrapper swiper-wrapper">';

            for ($ii = 0; $ii < sizeof($photos['photos']); $ii++) {
                if (!empty($limit) && $limit == $ii) {
                    break;
                }
                $src = $photos['photos'][$ii]['src'][$size];
                $html .= $this->get_slide($src);
            }

            $html .= '</div>';

            return $html;
        }

        protected function get_pagination()
        {
            $html = '<div class="photos-review-pagination swiper-pagination"></div>';
            return $html;
        }

        protected function get_scrollbar()
        {
            $html = '<div class="photos-review-scrollbar swiper-scrollbar"></div>';
            return $html;
        }

        private function get_slide($src)
        {
            return '<div class="photos-review__slide swiper-slide">' . $this->get_img($src) . '</div>';
        }

        private function get_img($src, $class = '')
        {
            $class = (!empty($class)) ? 'class="' . $class . '"' : '';
            return '<img ' . $class . ' src="' . $src . '"/>';
        }

    }
}
