<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\ProsAndCons')) {
    class ProsAndCons
    {
        private $html;

        public function __construct($pros_and_cons)
        {
            $this->model = $pros_and_cons;
        }


        public function get_html()
        {
            // Return '' if pros and cons are empty
            if ($this->is_empty()) {
                return '';
            }

            $html = "<div class='hrv-pros-cons hrp-container '>";
            $html .= $this->get_pros_html($this->model['pros']);
            $html .= $this->get_cons_html($this->model['cons']);
            $html .= "</div>";

            $this->html = $html;
            return $this->html;
        }


        /* PRIVATE METHODS */
        private function get_pros_html($pros)
        {

            $html = "<div class='column'>";
            $html .= "<h4>Pros</h4>";
            $html .= '<ol>';

            for ($ii = 0; $ii < sizeof($pros); $ii++) {
                $html .= "<li>" . $pros[$ii] . "</li>";
            }

            // $html .= "<li>Pros here</li>";
            $html .= "</ol>";
            $html .= "</div>";

            return $html;
        }

        private function get_cons_html($cons)
        {

            $html = "<div class='column'>";
            $html .= "<h4>Cons</h4>";
            $html .= "<ol class='cons'>";

            for ($ii = 0; $ii < sizeof($cons); $ii++) {
                $html .= "<li>" . $cons[$ii] . "</li>";
            }

            $html .= "</ol>";
            $html .= "</div>";

            return $html;
        }

        private function is_empty()
        {
            $is_empty = true;

            if (!isset($this->model) || empty($this->model)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($this->model['pros']) || empty($this->model['pros']));
            $is_cons_empty = (!isset($this->model['cons']) || empty($this->model['cons']));

            // Either should be NOT EMPTY 
            if (!$is_pros_empty  || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}