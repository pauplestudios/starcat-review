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

        protected function get_score($value, $collection)
        {
            // $divisor = ($this->props['collection']['limit'] == 10) ? 10 : 20;
            // $score = $value / $divisor;
            // return (floor($score * 2) / 2);

            $score = $collection['limit'] == 10 ? $value / 10 : $value / 20;
            $score = $collection['value_type'] == "point" ? number_format($score, 1) : $score;

            return $score;
        }

        protected function get_width($value, $collection)
        {
            switch ($collection['value_type']) {
                case "full":
                    $divisor = $collection['limit'] == 5 ? 20 : 10;
                    $width = round($value / $divisor) * $divisor;
                    break;

                case "half":
                    $divisor = $collection['limit'] == 5 ? 10 : 5;
                    $width = round($value / $divisor) * $divisor;
                    break;

                case "point":
                    $divisor = 100 / $collection['limit'];
                    $width = $collection['type'] == "star" ? $value : round($value / $divisor) * $divisor;
                    break;

                case "percentage":
                    $divisor = 100;
                    $width = round($value / $divisor) * $divisor;
                    break;

                default:
                    // 5 Star 
                    $width = round($width / 20) * 20;
            }

            return $width;
        }
    } // END CLASS
}