<?php

namespace StarcatReview\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Translations')) {
    class Translations
    {

        public static function getStrings($stringName)
        {
            $strings = [
                'GeneralSettings' => __('General Settings', 'starcat-review'),
                'MainPage' => __('Main Page', 'starcat-review'),
            ];

            return $strings[$stringName];
        }
    } // END CLASS
}
