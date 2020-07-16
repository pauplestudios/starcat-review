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

            return $strings[$stringName];
        }

        public static function getAllStrings()
        {
            $strings = [];
            $strings = array_merge($strings, self::settings());
            $strings = array_merge($strings, self::formSrings());

            return $strings;
        }

        protected static function settings()
        {
            return [
                'GeneralSettings' => __('General Settings', SCR_DOMAIN),
                'MainPage' => __('Main Page', SCR_DOMAIN),
            ];
        }

        protected static function formSrings()
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
