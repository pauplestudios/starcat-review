<?php

namespace HelpieReviews\App\Views\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Blocks\Card')) {
    class Card
    {

        public function __construct()
        { }

        /* HTML for Single Card */
        public function get_view($item)
        {
            $html = '';

            $html .= '<div class="col-4">'; // can't add additional classes
            $html .= '<div class="hrp-review-card">';
            $html .= '<div class="review-card__header">' . $item['title'] . '</div>';
            $html .= '<div class="review-card__body">' . $item['content'] . '</div>';
            $html .= '<div class="review-card__footer"><a href="' . $item['url'] . '">See all >> </a></div>';
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }
    } // END CLASS
}