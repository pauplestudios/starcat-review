<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Photos_Review')) {
    class Photos_Review
    {
        public function get_html()
        {
            $html = '<div class="swiper-container">';
            $html .= $this->get_slides();
            $html .= $this->get_pagination();
            $html .= $this->get_navigation_buttons();
            // $html .= $this->get_scrollbar();
            $html .= '</div>';

            return $html;
        }

        public function get_slides()
        {
            // Get the contents of the JSON file
            $photos_JSON = file_get_contents(SCR_PATH . 'includes/utils/photos.json');
            // Convert to array
            $photos = json_decode($photos_JSON, true);
            // var_dump($array);
            // error_log('photos : ' . print_r($photos, true));

            $html = '';
            $html .= '<div class="swiper-wrapper">';

            for ($i = 0; $i < sizeof($photos['photos']); $i++) {
                if ($i == 15) {
                    break;
                }
                $src = $photos['photos'][$i]['src']['tiny'];
                $html .= $this->get_slide($src);
            }

            $html .= '</div>';

            return $html;

        }

        protected function get_pagination()
        {
            $html = '';
            $html .= '<div class="swiper-pagination"></div>';

            return $html;

        }

        protected function get_scrollbar()
        {
            $html = '';
            $html .= '<div class="swiper-scrollbar"></div>';
            $html .= '</div>';

            return $html;

        }

        protected function get_navigation_buttons()
        {
            $html = '';
            $html .= '<div class="swiper-button-prev"></div>';
            $html .= '<div class="swiper-button-next"></div>';

            return $html;
        }

        private function get_slide($src)
        {
            return '<div class="swiper-slide"><img src="' . $src . '" /></div>';
        }

    }
}
