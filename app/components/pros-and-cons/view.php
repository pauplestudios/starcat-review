<?php

namespace HelpieReviews\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\ProsAndCons\View')) {
    class View
    {
        private $html;

        public function __construct($viewProps)
        {
            $this->itemsProps = $viewProps['items'];
        }


        public function get_html()
        {
            // Return '' if pros and cons are empty
            if ($this->is_empty()) {
                return '';
            }

            $html = "<div class='hrv-pros-cons hrp-container '>";
            $html .= $this->get_pros_html($this->itemsProps['pros']);
            $html .= $this->get_cons_html($this->itemsProps['cons']);
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

            if (!isset($this->itemsProps) || empty($this->itemsProps)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($this->itemsProps['pros']) || empty($this->itemsProps['pros']));
            $is_cons_empty = (!isset($this->itemsProps['cons']) || empty($this->itemsProps['cons']));

            // Either should be NOT EMPTY 
            if (!$is_pros_empty  || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}
