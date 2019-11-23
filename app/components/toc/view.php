<?php

namespace StarcatReview\App\Components\Toc;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Toc\View')) {
    class View
    {
        public function __construct()
        {
            // 
        }

        public function get_html()
        {
            $html = '';
            $html += '<h4>TOC Container</h4>';
            return $html;
        }
    }
}
