<?php

namespace StarcatReview\Includes\Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Settings\SCR_Setter')) {

    // SCR - Starcat Review Plugin
    class SCR_Setter
    {
        private static $options;

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
    }
}
