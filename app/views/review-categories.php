<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Review_Categories')) {
    class Review_Categories
    {

        public function __construct()
        { }

        public function get_view($terms)
        {
            $html = '';
            $html .= '<div class="hrp-categories-list hrp-container container">';
            $count = 1;

            $columns = 3;
            foreach ($terms as $key => $term) {

                if ($count  % $columns == 1) {
                    $html .= '<div class="row">';
                }
                $html .= '<div class="col-4">'; // can't add additional classes
                $html .= '<div class="hrp-review-card">';
                $html .= '<div class="review-card__header">' . $term->name . '</div>';
                $html .= '<div class="review-card__body">' . $term->description . '</div>';
                $html .= '<div class="review-card__footer"><a href="' . get_term_link($term) . '">See all >> </a></div>';
                $html .= '</div>';
                $html .= '</div>';

                if ($count  % $columns == 0) {
                    $html .= '</div>'; // close row
                }

                $count++;
            }
            // $html .= '</div>';
            $html .= '</div>';

            return $html;
        }
    } // END CLASS
}