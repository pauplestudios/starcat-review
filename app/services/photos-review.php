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
            $html .= '<div class="ui tiny images">';
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
                    $html .= '<span>+ ' . $photos_count . '</span>';
                }
                $html .= '</div>';
            }

            $html .= '</div>';

            return $html;
        }

        public function get_modal()
        {
            global $helpie_password_modal;
            $html = '';

            if ($helpie_password_modal == 0) {
                $html = "<div class='ui dimmer modals page' style='display: none;'>";
                $html .= "<div id='helpie-password-modal' class='pauple_helpie ui modal small' style='display: none;'>";
                $html .= "<div class='ui header'><i class='circular lock icon'></i> Password Protected</div>";
                $html .= "<div class='item-content'>";
                $html .= "<br /><label for='password_check'>Enter Password : </label>";
                $html .= "<p><input type='password' id='password_check' name='password_check' class='password' value='' required></p>";
                $html .= "</div>";
                $html .= "<div class='actions'>";
                $html .= "<div class='ui black deny button'>Nope</div>";
                $html .= "<div class='ui positive right labeled icon button'>Yep, that's right!<i class='checkmark icon'></i></div>";
                $html .= "</div>";
                $html .= "<div class='clear'></div>";
                $html .= "</div>";
                $html .= "</div>";

                $helpie_password_modal = 1;
            }

            return $html;
        }

        public function get_html()
        {
            $html = '<div class="starcat-photos-review">';
            $html .= '<div class="swiper-container gallery-top">';
            $html .= $this->get_slides('medium');
            $html .= $this->get_navigation_buttons();
            $html .= $this->get_pagination();
            // $html .= $this->get_scrollbar();
            $html .= '</div>';

            $html .= '<div class="swiper-container gallery-thumbs">';
            $html .= $this->get_slides('small');
            $html .= '</div>';

            $html .= '</div>';

            return $html;
        }

        protected function get_slides($size)
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
                if ($i == 5) {
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
            return '<div class="swiper-slide">' . $this->get_img($src) . '</div>';
        }

        private function get_img($src, $class = '')
        {
            $class = (!empty($class)) ? 'class="' . $class . '"' : '';
            return '<img ' . $class . ' src="' . $src . '"/>';
        }

    }
}
