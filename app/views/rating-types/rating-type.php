<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Rating_Type')) {
    class Rating_Type
    {
        protected function is_stat_included($stat_item, $collection)
        {

            $stat_item = $this->get_santized_key($stat_item);
            if (in_array($stat_item, $collection['show_stats'])) {
                return true;
            }

            return false;
        }

        protected function get_santized_key($key)
        {

            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }

    } // END CLASS
}
