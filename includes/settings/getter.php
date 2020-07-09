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

        public static function set($option_name, $option_value)
        {
            // Only set one time
            if (!isset(self::$options) || empty(self::$options)) {
                self::$options = get_option(SCR_OPTIONS); // unique id of the framework
            }

            if (isset($option_value) && !empty($option_value)) {
                self::$options[$option_name] = $option_value;
                update_option(SCR_OPTIONS, self::$options);
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
                'ur_who_can_review' => 'logged_in',
                'ur_allow_same_user_can_leave_multiple_reviews' => false,
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

                // Photos Review start
                'pr_enable' => true,
                'pr_require_photo' => true,
                'pr_photo_order' => 'oldest',
                'pr_photo_size' => 2000,
                'pr_photo_quantity' => 5,

                // Notification
                'ns_from_address' => get_option('admin_email'),
                'ns_subject' => 'Thanks for Puchasing from {{Sitename}}',
                'ns_content' => 'Thank you for purchasing from Starcat Dev. If you liked your product, please leave a review: {{product_review_link}}',
                'ns_disclaimer' => '',
                'ns_time_schedule' => [
                    ['value' => '12', 'unit' => 'hours'],
                    ['value' => '1', 'unit' => 'days'],
                    ['value' => '3', 'unit' => 'days'],
                ]

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

        public static function reviews_enabled_post_types()
        {
            $post_types = SCR_Getter::get('review_enable_post-types');
            $enabled_post_types = is_string($post_types) ? [0 => $post_types] : $post_types;

            return $enabled_post_types;
        }

        public static function addons_available_condition()
        {
            $conditions = [];
            $addon_plugins = self::get_addon_plugins_slugs();

            foreach ($addon_plugins as $addon_name => $addon_slugs) {
                $freemius = 'scr_' . $addon_name . '_fs';
                $is_addon_freemius_active = (function_exists($freemius)) ? true : false;
                $is_addon_plugin_active = is_plugin_active($addon_slugs[0] || $addon_slugs[1]) ? true : false;

                // Assuming addon is not available
                $conditions[$addon_name] = false;

                // Addon Plugin and freeemius licences are activated
                if ($is_addon_plugin_active && $is_addon_freemius_active && $freemius()->can_use_premium_code()) {
                    $conditions[$addon_name] = true;
                }

                // woo notification addon v0.1 compatible support
                if ($addon_name == 'wn' && $is_addon_plugin_active && defined('SCR_WOO_NOTIFY__FILE__') && get_plugin_data(SCR_WOO_NOTIFY__FILE__)['Version'] == 0.1) {
                    $conditions[$addon_name] = function_exists('src_wn') && src_wn()->can_use_premium_code() ? true : false;
                }

            }

            return $conditions;
        }

        public static function get_addon_plugins_slugs()
        {
            return [
                'ct' => [
                    'starcat-review-ct/starcat-review-ct.php',
                    'starcat-review-ct-premium/starcat-review-ct.php',
                ],
                'pr' => [
                    'starcat-review-photo-reviews/starcat-review-photo-reviews.php',
                    'starcat-review-photo-reviews-premium/starcat-review-photo-reviews.php',
                ],
                'wn' => [
                    'starcat-review-woo-notify/starcat-review-woo-notify.php',
                    'starcat-review-woo-notify-premium/starcat-review-woo-notify.php',
                ],
                'cpt' => [
                    'starcat-review-cpt/starcat-review-cpt.php',
                    'starcat-review-cpt-premium/starcat-review-cpt.php',
                ],
            ];
        }

    } // END CLASS
}
