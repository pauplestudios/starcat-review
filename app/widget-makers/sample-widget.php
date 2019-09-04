<?php

namespace HelpieReviews\App\Widget_Makers;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widget_Makers\Sample_Widget')) {
    class Sample_Widget
    {
        public function get_view()
        { }

        public function get_default_args()
        { }

        public function get_fields()
        { }

        public function get_style_config()
        { }
    } // END CLASS
}