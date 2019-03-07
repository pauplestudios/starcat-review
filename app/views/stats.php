<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Stats')) {
    class Stats
    {
        private $html;

        public function __construct($stats)
        {
            $this->model = $stats;
        }

        public function get_html()
        {
            $html = '';

            foreach ($this->model as $key => $value) {
                $html .= "<p>" . $key . " - " . $value . "</p>";
            }

            $this->html = $html;
            return $this->html;
        }

    } // END CLASS
}