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
                // General Settings Start
                'template_source' => 'theme',
                'enable-pros-cons' => true,
                'review_enable_post-types' => [HELPIE_REVIEWS_POST_TYPE],
                'global_stat' => ['stat_name' => 'Feature'],
                'stat-singularity' => 'single',
                'stats-type' => 'star',
                'stats-source-type' => 'icon',
                'stats-icons' => 'star',
                'stats-images' => [
                    'image' => [
                        'url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                        'thumbnail' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png'
                    ],

                    'image-outline' => [
                        'url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png',
                        'thumbnail' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png'
                    ]
                ],
                'stats-show-rating-label' => true,
                'stats-steps' => 'precise',
                'stats-bars-limit' => 100,
                'stats-stars-limit' => 5,
                'stats-animate' => false,
                'stats-no-rated-message' => 'Not Rated Yet !!!',

                // Mainpage Settings Start
                'mp_slug' => 'reviews',
                'mp_meta_title' => 'Reviews',
                'mp_meta_description' => 'These are your reviews',
                'mp_components_order' => [
                    // 'mp_show_search' => true,
                    'mp_show_categories' => true,
                    'mp_show_review_listing' => true
                ],
                // 'mp_template' => 'boxed',
                'mp_category_description' => true,
                'mp_cl_cols' => 'three',
                'mp_review_listing_title' => 'Reviews',
                'mp_review_listing_sortby' => 'recent',

                // Category Page Start 
                'cp_show_controls' => true,
                'cp_show_search' => true,
                'cp_show_sortBy' => true,
                'cp_show_num_of_reviews_filter' => true,
                'cp_default_sortBy' => 'recent',
                'cp_listing_num_of_cols' => 'three',
                'sp_show_controls' => true,

                // Single Page Start
                'sp_rating_combination' => 'combined',
                'sp_stats_order' => [
                    'enabled' => [],
                    'disabled' => []
                ],

                // User Review Start
                'ur_enable_post-types' => [HELPIE_REVIEWS_POST_TYPE],
                'ur_show_controls' => true,
                'ur_controls_subheading' => true,
                'ur_show_search' => true,
                'ur_show_sortBy' => true,
                'ur_enable_replies' => true,
                'ur_enable_approval' => true,
                'ur_show_form_title' => true,
                'ur_form_title' => 'Leave a Review',
                'ur_show_title' => true,
                'ur_show_stats' => true,
                'ur_show_description' => true,
                // 'ur_show_prosandcons' => true,
                'ur_form_custom_fields' => [], // [[ 'field_name' => '', 'field_type' => 'text']]                

                // Comparison Table Start
                'ct_page' => ''

            );

            return $defaults;
        }
    } // END CLASS
}
