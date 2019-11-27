<?php

namespace StarcatReview\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\ProsAndCons\View')) {
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

            $html = "<div class='prosandcons'>";
            $html .= "<div class='ui tiny header'>Pros & Cons</div>";
            $html .= "<div class='items-container'>";
            $html .= $this->get_pros_html($this->itemsProps['pros']);
            $html .= $this->get_cons_html($this->itemsProps['cons']);
            $html .= "</div>";

            $html .= "</div>";

            return $html;
        }

        /* PRIVATE METHODS */
        private function get_pros_html($pros)
        {
            $html = "<ul class='pros'>";

            for ($ii = 0; $ii < sizeof($pros); $ii++) {
                if (!empty($pros[$ii])) {
                    $html .= "<li><i class='green thumbs up icon'></i>" . $pros[$ii] . "</li>";
                }
            }

            $html .= "</ul>";

            return $html;
        }

        private function get_cons_html($cons)
        {
            $html = "<ul class='cons'>";
            for ($ii = 0; $ii < sizeof($cons); $ii++) {
                if (!empty($cons[$ii])) {
                    $html .= "<li><i class='red thumbs down icon'></i>" . $cons[$ii] . "</li>";
                }
            }

            $html .= "</ul>";

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
            if (!$is_pros_empty || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}
