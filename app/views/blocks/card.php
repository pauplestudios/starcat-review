<?php

namespace StarcatReview\App\Views\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Views\Blocks\Card')) {
    class Card
    {
        /* HTML for Single Card */
        public function get_view($item)
        {
            $this->props = $this->interprete_input_props($item);

            $html = '';

            $col_classes = "col-xs-12 col-lg-" . $this->props['col-lg'];
            $html .= '<div class="scr-collection__col item ' . $col_classes . '">'; // can't add additional classes
            $html .= '<div class="scr-review-card" >';

            if ($this->show_item('title')) {
                $html .= '<div class="review-card__header">' . $item['title'] . '</div>';
            }

            if ($this->show_item('content')) {
                $stat_html = isset($item['stat_html']) ? $item['stat_html'] : '';
                $html .= '<div class="review-card__body">' .  $stat_html . $item['content'] . '</div>';
            }

            if ($this->show_item('link')) {
                $html .= '<div class="review-card__footer"><a href="' . $item['url'] . '">See all >> </a></div>';
            }
            if (isset($item['reviews'])) {
                $html .= '<span class="reviewCount"  data-reviewCount="' . $item['reviews'] . '"></span>';
            }
            if (isset($item['date'])) {
                $html .= '<span class="postDate"   data-postDate="' . $item['date'] .  '"></span>';
            }
            if (isset($item['modified_date'])) {
                $html .= '<span class="postModified"   data-postModified="' . $item['modified_date'] .  '"></span>';
            }
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        protected function show_item($itemName)
        {

            if (in_array($itemName, $this->props['items_display'])) {
                return true;
            }

            return false;
        }

        protected function interprete_input_props($input_props)
        {
            $props = $input_props;
            $props['col-lg'] = 12 / $input_props['columns'];

            return $props;
        }
    } // END CLASS
}
