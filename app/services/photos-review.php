<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Photos_Review')) {
    class Photos_Review
    {
        public function get_all_photos()
        {
            $photos_JSON = file_get_contents(SCR_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $html = '';
            $html .= '<div class="all-photos-list ui tiny images">';
            $photos_count = sizeof($photos['photos']);
            for ($i = 0; $i < $photos_count; $i++) {

                if ($i == 9) {
                    break;
                }

                $src = $photos['photos'][$i]['src']['tiny'];
                // $class = 'ui image';

                $html .= '<div class="ui image">';
                $html .= $this->get_img($src);
                if ($i == 8) {
                    $html .= '<span class="show-all-photos-list">+ ' . $photos_count . '</span>';
                }
                $html .= '</div>';
            }

            $html .= '</div>';
            $html .= $this->get_modal();
            // $html .= '<div class="all-photos-review-gallery swiper-container">';
            // $html .= $this->get_slides('medium');
            // $html .= $this->get_pagination();
            $html .= '</div>';

            return $html;
        }

        public function get_all_photos_gallery_list()
        {
            $photos_JSON = file_get_contents(SCR_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $html = '';
            $html .= '<div class="ui six doubling cards all-photos-list-gallery">';
            for ($i = 10; $i < sizeof($photos['photos']); $i++) {
                if ($i == 35) {
                    break;
                }
                $html .= '<div class="card">';
                $html .= '<img class="image" src="' . $photos['photos'][$i]['src']['portrait'] . '"/>';
                $html .= '</div>';
            }
            $html .= '</div>';

            return $html;
        }

        public function get_modal()
        {
            $html = '';

            $html = "<div class='ui dimmer modals photos-review-modal' style='display: none;'>";
            $html .= "<div id='photos-review-modal' class='ui modal' style='display: none;'>";
            $html .= "<div class='ui header'><i class='circular expand icon'></i> All User Review Images</div>";
            $html .= "<div class='item-content'>";
            $html .= $this->get_all_photos_gallery_list();
            $html .= '</div>';

            $html .= "<div class='actions'>";
            $html .= "<div class='ui black deny button'>Close Modal</div>";
            $html .= "</div>";

            $html .= "</div>";
            $html .= "</div>";

            return $html;
        }

        public function get_html()
        {
            $html = '<div class="scr-photos-review">';
            $html .= '<div class="photos-review-gallery-top swiper-container">';
            $html .= $this->get_slides('medium', 5);
            $html .= $this->get_navigation_buttons();
            // $html .= $this->get_pagination();
            // $html .= $this->get_scrollbar();
            $html .= '</div>';

            $html .= '<div class="photos-review-gallery-thumbs swiper-container">';
            $html .= $this->get_slides('small', 5);
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
