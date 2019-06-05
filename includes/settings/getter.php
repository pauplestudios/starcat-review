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

            self::$defaults = self::default_settings();
        }


        public static function  get($option_name)
        {

            // Only set one time
            if (!isset(self::$options) || empty(self::$options)) {
                self::$options = get_option('helpie-reviews'); // unique id of the framework
            }


            // self::$options = get_option('helpie-reviews');
            error_log(' self::$options : ' . print_r(self::$options, true));
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
                'template_source' => 'theme',
                'enable-pros-cons' => true,
                'review-location' => [HELPIE_REVIEWS_POST_TYPE]
            );

            return $defaults;
        }
    } // END CLASS
}