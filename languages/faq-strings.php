<?php

namespace HelpieFaq\Languages;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieFaq\Languages\FAQ_Strings')) {
    class FAQ_Strings
    {
        public function get_strings()
        {
            $strings = array(
                'hide' => __("Hide", "starcat-review"),
                'addFAQ' => __("Add FAQ", "starcat-review"),
            );

            return $strings;
        }
    }
}
