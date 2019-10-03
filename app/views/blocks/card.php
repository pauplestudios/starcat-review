<?php

namespace HelpieReviews\App\Views\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Blocks\Card')) {
    class Card
    {

        public function __construct()
        {
            // $input_props = [
            //     'columns' => 2,
            //     'items_display' => ['title', 'content', 'link']
            // ];

            // $this->props = [];
        }

        /* HTML for Single Card */
        public function get_view($item)
        {

            // error_log('$item : ' . print_r($item, true));
            $this->props = $this->interprete_input_props($item);

            // error_log('$item : ' . print_r($item, true));
            $html = '';

            $col_classes = "col-xs-12 col-lg-" . $this->props['col-lg'];
            $html .= '<div class="hrp-collection__col item ' . $col_classes . '">'; // can't add additional classes
            $html .= '<div class="hrp-review-card" >';

            if ($this->show_item('title')) {
                $html .= '<div class="review-card__header">' . $item['title'] . '</div>';
            }

            if ($this->show_item('content')) {
                $html .= '<div class="review-card__body">' . $item['content'] . $item['stat_html'] . '</div>';
            }





            if ($this->show_item('link')) {
                $html .= '<div class="review-card__footer"><a href="' . $item['url'] . '">See all >> </a></div>';
            }

            $html .= '<span class="reviewCount"  data-reviewCount="' . $item['reviews'] . '"></span>';
            $html .= '<span class="postDate"   data-postDate="' . $item['post_date'] .  '"></span>';
            $html .= '<span class="postModified"   data-postModified="' . $item['post_modified'] .  '"></span>';
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