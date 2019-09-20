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

        protected function get_stat_score($stat_value, $collection)
        {
            $stat_score = $collection['limit'] == 10 ? $stat_value / 10 : $stat_value / 20;

            $stat_score = $collection['value_type'] == "point" ? number_format($stat_score, 1) : $stat_score;

            if ($collection['type'] == 'bar') {
                $stat_score = $collection['value_type'] == "point" ? $stat_value / (100 / $collection['limit']) : $stat_value;
            }

            return $stat_score;
        }

        protected function get_stat_width($width, $collection)
        {
            switch ($collection['value_type']) {
                case "full":
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_width = round($width / $divisor) * $divisor;
                    break;

                case "half":
                    $divisor = $collection['limit'] == 5 ? 10 : 5;
                    $stat_width = round($width / $divisor) * $divisor;
                    break;

                case "point":
                    $divisor = 100 / $collection['limit'];
                    $stat_width = $collection['type'] == "star" ? $width : round($width / $divisor) * $divisor;
                    break;

                case "percentage":
                    $stat_width = $width;
                    break;

                default:
                    // Default is Star
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $stat_width = round($width / $divisor) * $divisor;
            }

            $stat_width = number_format($stat_width, 0);
            return $stat_width;
        }
    } // END CLASS
}
