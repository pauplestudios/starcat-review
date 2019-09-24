<?php

namespace HelpieReviews\Includes\Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Settings\HRP_Getter')) {

    // HRP - Helpie Review Plugin
    class HRP_Getter
    {

        private static $options;
        private static $defaults;

        public  function __construct()
        {
            error_log('HRP_Getter');
        }


        public static function  get($option_name)
        {

            self::$defaults = self::default_settings();

            // Only set one time
            if (!isset(self::$options) || empty(self::$options)) {
                self::$options = get_option('helpie-reviews'); // unique id of the framework
            }


            // self::$options = get_option('helpie-reviews');
            // error_log(' self::$options : ' . print_r(self::$options, true));
            if (isset(self::$options[$option_name])) {
                return self::$options[$option_name];
            } else {
                return self::$defaults[$option_name];
            }
        }

        public static function get_settings()
        {
            return self::$options;
        }

        public static function default_settings()
        {

            $defaults = array(
                'template_source' => 'theme', // General Settings Start
                'enable-pros-cons' => true,
                'review-location' => [HELPIE_REVIEWS_POST_TYPE],
                'stats-type' => 'star',
                'stats-limit' => 5,
                'stat-singularity' => 'single',
                'single-stat-field-name' => 'Overall',
                'multiple-stat-fields' => [
                    ['stat' => 'Pricing']
                ],
                'mp_slug' => 'reviews', // Mainpage Settings Start
                'mp_meta_title' => 'Reviews',
                'mp_meta_description' => 'These are your reviews',
                'mp_components_order' => [
                    'mp_show_search' => true,
                    'mp_show_categories' => true,
                    'mp_show_review_listing' => true
                ],
                'mp_template' => 'boxed',
                'mp_boxed_description' => false,
                'mp_cl_cols' => 'three',
                'mp_review_listing_title' => 'Reviews',
                'mp_review_listing_sortby' => 'recent',
                'cp_show_controls' => true, // Category Page Start 
                'cp_show_search' => true,
                'cp_show_sortBy' => true,
                'cp_show_num_of_reviews_filter' => true,
                'cp_default_sortBy' => 'recent',
                'cp_listing_num_of_cols' => 'three',
                'sp_show_controls' => true, // Single Page Start
                'sp_rating_combination' => 'combined',
                'sp_stats_order' => [
                    'enabled' => [],
                    'disabled' => []
                ],
                'user-review-post-types' => [HELPIE_REVIEWS_POST_TYPE], // User Review Start
                'ur_show_controls' => true,
                'ur_controls_subheading' => true,
                'ur_show_search' => true,
                'ur_show_sortBy' => true,
                'ur_enable_replies' => true,
                'ur_enable_approval' => true,
                'ur_form' => [
                    ['Stat' => 'Price']
                ],
                'ct_page' => '' // Comparison Table Start

            );

            return $defaults;
        }
    } // END CLASS
}