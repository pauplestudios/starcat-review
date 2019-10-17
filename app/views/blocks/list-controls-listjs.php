<?php

namespace StarcatReview\App\Views\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Views\Blocks\List_Controls_Listjs')) {
    class List_Controls_Listjs
    {

        public function __construct()
        { }

        /* HTML for List_Controls */
        public function get_view()
        {

            $html = '';

            $html .= '<div class="hrp-controls-container hrp-container">';
            $html .= '<input class="collection-search" placeholder="Search lovely things" />';
            $html .= '<ul class="sort-by">';
            $html .= '<li class="sort btn" data-sort="review-card__header">Sort by name</li>';
            $html .= '</ul>';
            $html .= "</div>";

            return $html;
        }

        public function search()
        {
            $html = '';
            $html .= '<input class="collection-search hrp-search" placeholder="Search lovely things" />';

            return $html;
        }

        public function sort_button()
        {
            $html = '';
            $html .= '<ul class="sort-by">';
            $html .= '<li class="sort btn" data-sort="review-card__header">Sort by name</li>';
            $html .= '</ul>';
            return $html;
        }
    } // END CLASS
}