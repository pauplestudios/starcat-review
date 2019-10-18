<?php

namespace StarcatReview\Languages;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Languages\SCR_Strings')) {
    class SCR_Strings
    {
        public function get_strings()
        {
            $strings = array(
                'hide' => __("Hide", "starcat-review"),
                'addSCR' => __("Add SCR", "starcat-review"),
            );

            return $strings;
        }
    }
}
