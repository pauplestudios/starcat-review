<?php

namespace HelpieReviews\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Utils\Utils')) {
    class Utils
    {
        public function __construct()
        {

        }

        /*  ACF Plugin Utils */

        public function get_acf_group()
        {

            return 'value';
        }
    }

} // END CLASS