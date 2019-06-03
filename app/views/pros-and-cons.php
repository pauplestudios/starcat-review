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
            $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($this->model);
        }

        public function get_html()
        {
            $html = $this->get_pros_html($this->model['pros']);
            $html .= $this->get_cons_html($this->model['cons']);

            $this->html = $html;
            return $this->html;
        }

        private function get_pros_html($pros)
        {
            $html = "Pros Here";
            $html .= '<ul>';

            for ($ii = 0; $ii < sizeof($pros); $ii++) {
                $html .= "<li>" . $pros[$ii] . "</li>";
            }

            $html .= "<li>Pros here</li>";
            $html .= "</ul>";

            return $html;
        }

        private function get_cons_html($cons)
        {
            $html = "Cons Here";
            $html .= '<ul>';

            for ($ii = 0; $ii < sizeof($cons); $ii++) {
                $html .= "<li>" . $cons[$ii] . "</li>";
            }

            $html .= "</ul>";

            return $html;
        }
    } // END CLASS
}