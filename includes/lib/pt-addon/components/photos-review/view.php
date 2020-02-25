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

            $html = '';
            $html .= '<div class="all-photos-gallery-preview ui tiny images">';

            foreach ($props['items'] as $key => $image) {
                $html .= '<div class="ui image">';
                $html .= '<img src="' . $image . '"/>';
                if (($props['collection']['limit'] - 1) == $key) {
                    $html .= '<span class="show-all-photos-gallery" data-shown-count="' . $props['collection']['limit'] . '" data-total-count="' . $props['collection']['total_count'] . '">+ ' . $props['collection']['total_count'] . '</span>';
                }
                $html .= '</div>';
            }

            $html .= '</div>';
            $html .= $this->get_modal($props);

            return $html;
        }

        public function get_modal($props)
        {
            $html = '';

            $html = "<div class='ui dimmer modals photos-review-modal' style='display: none;'>";
            $html .= "<div id='photos-review-modal' class='ui modal' style='display: none;'>";
            $html .= "<i class='circular inverted close icon'></i>";
            $html .= "<div class='all-photos-section'>";
            $html .= "<div class='ui medium header'><i class='circular expand icon'></i> All User Review Images </div>";

            $html .= "<div class='scrolling content item-content'>";
            $html .= $this->get_all_photos_gallery($props);
            $html .= '</div>';

            $html .= '</div>';
            $html .= "</div>";
            $html .= "</div>";

            return $html;
        }

        public function get_all_photos_gallery($props)
        {
            $html = '';
            $html .= '<div class="ui six doubling cards all-photos-gallery">';
            foreach ($props['items'] as $key => $image) {
                $html .= '<div class="card">';
                $html .= '<img class="ui medium circular image" src="' . $props['collection']['placeholder_image'] . '" data-src="' . $image . '"/>';
                $html .= '</div>';
            }
            $html .= '</div>';

            return $html;
        }

        public function get_single_photos($props)
        {
            $html = '<div class="scr-photos-review">';
            $html .= '<div class="photos-review-gallery-top swiper-container">';
            $html .= $this->get_slides('medium', 7);
            $html .= $this->get_navigation_buttons();
            // $html .= $this->get_pagination();
            // $html .= $this->get_scrollbar();
            $html .= '</div>';

            $html .= '<div class="photos-review-gallery-thumbs swiper-container">';
            $html .= $this->get_slides('small', 7);
            $html .= '</div>';

            $html .= '</div>';

            return $html;
        }

        protected function get_slides($size, $limit = '')
        {
            // Get the contents of the JSON file
            $photos_JSON = file_get_contents(SCR_PATH . 'includes/utils/photos.json');
            // Convert to array
            $photos = json_decode($photos_JSON, true);
            // var_dump($array);
            // error_log('photos : ' . print_r($photos, true));

            $html = '';
            $html .= '<div class="photos-review-wrapper swiper-wrapper">';

            for ($i = 0; $i < sizeof($photos['photos']); $i++) {
                if (!empty($limit) && $limit == $i) {
                    break;
                }
                $src = $photos['photos'][$i]['src'][$size];
                $html .= $this->get_slide($src);
            }

            $html .= '</div>';

            return $html;
        }

        protected function get_pagination()
        {
            $html = '';
            $html .= '<div class="photos-review-pagination swiper-pagination"></div>';

            return $html;
        }

        protected function get_scrollbar()
        {
            $html = '';
            $html .= '<div class="photos-review-scrollbar swiper-scrollbar"></div>';
            $html .= '</div>';

            return $html;
        }

        protected function get_navigation_buttons()
        {
            $html = '';

            $html .= '<div class="photos-review__button-prev"><i class="circular inverted angle left icon"></i></div>';
            $html .= '<div class="photos-review__button-next"><i class="circular inverted angle right icon"></i></div>';

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
