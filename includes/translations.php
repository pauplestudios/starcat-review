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
            $strings = [];
            $strings = array_merge($strings, self::getAllStrings());
            // error_log('strings : ' . print_r($strings, true));

            return $strings[$stringName];
        }

        public static function getAllStrings()
        {
            $strings = [];
            $strings = array_merge($strings, self::getSettingsStrings());
            $strings = array_merge($strings, self::getFormSrings());

            return $strings;
        }

        public static function getSettingsStrings()
        {
            return [
                'GeneralSettings' => __('General Settings', SCR_DOMAIN),
                'MainPage' => __('Main Page', SCR_DOMAIN),
                'CategoryPage' => __('Category Page', SCR_DOMAIN),
                'SinglePage' => __('Single Page', SCR_DOMAIN),
                'UserReviews' => __('User Reviews', SCR_DOMAIN),
                'PhotoReviews' => __('Photo Reviews', SCR_DOMAIN),
                'ComparisonTable' => __('Comparison Table', SCR_DOMAIN),
                'WoocommerceNotification' => __('Woocommerce Notification', SCR_DOMAIN),
            ];
        }

        public static function getFormSrings()
        {
            return [
                'save' => __('Save', SCR_DOMAIN),
                'edit' => __('Edit', SCR_DOMAIN),
                'cancel' => __('Cancel', SCR_DOMAIN),
                'reply' => __('Reply', SCR_DOMAIN),
                'replyto' => __('Reply to', SCR_DOMAIN),
                'existspros' => __('Type new or select existing pros', SCR_DOMAIN),
                'existscons' => __('Type new or select existing cons', SCR_DOMAIN),
            ];
        }
    } // END CLASS
}