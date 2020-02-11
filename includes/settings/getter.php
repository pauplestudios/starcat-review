<?php

namespace StarcatReview\Includes\Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Settings\SCR_Getter')) {

    // SCR - Starcat Review Plugin
    class SCR_Getter
    {
        private static $options;
        private static $defaults;

        public static function get($option_name)
        {

            self::$defaults = self::default_settings();

            // Only set one time
            if (!isset(self::$options) || empty(self::$options)) {
                self::$options = get_option(SCR_OPTIONS); // unique id of the framework
            }

            // error_log('self::$options : ' . print_r(self::$options, true));

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
                'enable-author-review' => true,
                'enable-pros-cons' => true,
                'review_enable_post-types' => ['post'],
                'global_stats' => ['stat_name' => 'Feature'],
                'stat-singularity' => 'single',
                'stats-type' => 'star',
                'stats-source-type' => 'icon',
                'stats-icons' => 'star',
                'stats-images' => [
                    'image' => [
                        'url' => SCR_URL . 'includes/assets/img/tomato.png',
                        'thumbnail' => SCR_URL . 'includes/assets/img/tomato.png',
                    ],

                    'image-outline' => [
                        'url' => SCR_URL . 'includes/assets/img/tomato-outline.png',
                        'thumbnail' => SCR_URL . 'includes/assets/img/tomato-outline.png',
                    ],
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
                'mp_template_layout' => 'full-width',
                'mp_components_order' => [
                    'mp_category_listing' => true,
                    'mp_review_listing' => true,
                ],
                'mp_cl_title' => 'Review Categories',
                'mp_cl_description' => true,
                'mp_cl_cols' => '2',

                'mp_rl_title' => 'Reviews Posts',
                'mp_rl_sortby' => 'recent',
                'mp_rl_cols' => '3',

                // Category Page Start
                'cp_template_layout' => 'left-sidebar',
                'cp_controls' => true,
                'cp_search' => true,
                'cp_sortBy' => true,
                // 'cp_num_of_reviews_filter' => true,
                'cp_posts_per_page' => '9',
                'cp_default_sortBy' => 'recent',
                'cp_num_of_cols' => '3',

                // Single Page Start
                // 'sp_show_controls' => true,
                // 'sp_rating_combination' => 'combined',
                // 'sp_stats_order' => [
                //     'enabled' => [],
                //     'disabled' => []
                // ],
                'sp_template_layout' => 'left-sidebar',
                // User Review Start
                // 'ur_enable_post-types' => ['post'],
                'ur_show_controls' => true,
                'ur_controls_subheading' => true,
                'ur_show_search' => true,
                'ur_show_sortBy' => true,
                'ur_enable_replies' => true,
                'ur_enable_approval' => true,
                'ur_show_list_title' => true,
                'ur_list_title' => 'User Reviews',
                'ur_enable_voting' => true,
                'ur_show_form_title' => true,
                'ur_form_title' => 'Leave a Review',
                'ur_show_title' => true,
                'ur_show_stats' => true,
                'ur_show_description' => true,
                'ur_show_captcha' => true,
                'ur_form_custom_fields' => [],

                // Comparison Table Start
                // 'ct_page' => ''

            );

            return $defaults;
        }

        public static function get_stat_default_args()
        {
            $type = SCR_Getter::get('stats-type');
            $limit = ($type == 'star') ? SCR_Getter::get('stats-stars-limit') : SCR_Getter::get('stats-bars-limit');

            $args = [
                'global_stats' => SCR_Getter::get('global_stats'),
                'singularity' => SCR_Getter::get('stat-singularity'),
                'type' => $type,
                'source_type' => SCR_Getter::get('stats-source-type'),
                'show_rating_label' => SCR_Getter::get('stats-show-rating-label'),
                'icons' => SCR_Getter::get('stats-icons'),
                'images' => SCR_Getter::get('stats-images'),
                'steps' => SCR_Getter::get('stats-steps'),
                'limit' => $limit,
                'animate' => SCR_Getter::get('stats-animate'),
                'no_rated_message' => SCR_Getter::get('stats-no-rated-message'),
            ];

            return $args;
        }
    } // END CLASS
}