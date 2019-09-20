<?php

namespace HelpieReviews\App\Widget_Makers;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widget_Makers\Listing')) {
    class Listing
    {
        public function propsRegister()
        {

            $register = [
                'title' => [
                    'settings' => ''
                ],
                'show_controls' => [
                    'settings' => 'cp_show_controls'
                ],
                'show_search' => [
                    'settings' => 'cp_show_search'
                ],
                'show_sortBy' => [
                    'settings' => 'show_sortBy'
                ],
                'show_num_of_reviews_filter' => [
                    'settings' => 'cp_show_num_of_reviews_filter'
                ],

                'default_sortBy' => [
                    'settings' => 'cp_default_sortBy'
                ],
                'listing_num_of_cols' => [
                    'settings' => 'cp_listing_num_of_cols'
                ],

            ];
        }
    } // END CLASS
}