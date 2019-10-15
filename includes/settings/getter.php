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

        public static function  get($option_name)
        {

            self::$defaults = self::default_settings();

            // Only set one time
            if (!isset(self::$options) || empty(self::$options)) {
                self::$options = get_option('helpie-reviews'); // unique id of the framework
            }

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
                    'mp_category_listing' => true,
                    'mp_review_listing' => true
                ],
                'mp_cl_title' => 'Review Categories',
                'mp_cl_description' => true,
                'mp_cl_cols' => 'three',

                'mp_rl_title' => 'Reviews Posts',
                'mp_rl_sortby' => 'recent',
                'mp_rl_cols' => 'three',

                // Category Page Start 
                'cp_controls' => true,
                'cp_search' => true,
                'cp_sortBy' => true,
                'cp_num_of_reviews_filter' => true,
                'cp_default_sortBy' => 'recent',
                'cp_num_of_cols' => 'three',

                // Single Page Start
                // 'sp_show_controls' => true,
                // 'sp_rating_combination' => 'combined',
                // 'sp_stats_order' => [
                //     'enabled' => [],
                //     'disabled' => []
                // ],

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
                'ur_form_custom_fields' => [],

                // Comparison Table Start
                // 'ct_page' => ''

            );

            return $defaults;
        }
    } // END CLASS
}
