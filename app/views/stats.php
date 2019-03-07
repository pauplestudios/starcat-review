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
        }

        public function get_html()
        {
            // $html = '';

            // foreach ($this->model as $key => $value) {
            //     $html .= "<p>" . $key . " - " . $value . "</p>";
            // }

            $html = $this->star_rating->get_html();
            $this->html = $html;
            return $this->html;
        }

    } // END CLASS
}