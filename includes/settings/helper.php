<?php


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!function_exists('csf_validate_stat_limit')) {

    function csf_validate_stat_numeric($value)
    {
        if (!is_numeric($value)) {
            return esc_html__('Please giva a numeric limit !', 'csf');
        }

        if ($value > 100 || $value < 1) {
            return esc_html__('Please giva a value between one to hundread ( 1 to 100 ) limit !', 'csf');
        }

        if (!ctype_digit($value)) {
            return esc_html__('Please giva a rounded value limit !', 'csf');
        }
    }
}
