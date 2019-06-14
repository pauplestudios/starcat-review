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
            $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($this->model);
            // error_log('$stats : ' . print_r($stats, true));
        }

        public function get_html()
        {

            if ($this->is_empty()) {
                return '';
            }

            $html = $this->star_rating->get_html();
            $this->html = $html;
            return $this->html;
        }

        /* PRIVATE CLASS */

        private function is_empty()
        {

            if (isset($this->model) && !empty($this->model)) {
                return false;
            }

            return true;
        }
    } // END CLASS
}