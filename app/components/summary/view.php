<?php

namespace HelpieReviews\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Summary\View')) {
    class View
    {
        public function __construct()
        { }

        public function get($args)
        {
            if ($this->is_empty($args['items'])) {
                return '';
            }
            $this->stat = new \HelpieReviews\App\Components\Stats\Controller($args);
            $this->prosandcons = new \HelpieReviews\App\Components\ProsAndCons\Controller($args);

            $html = '<div class="ui stackable two column grid">';
            $html .= '<div class="column">';
            // Author Summary
            $html .= $this->stat->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';

            $html .= '<div class="column">';
            // User Summary         
            $html .= $this->stat->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        /* PRIVATE METHODS */
        private function is_empty($items)
        {
            $is_empty = true;

            if (!isset($items) || empty($items)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($items['pros-list']) || empty($items['pros-list']));
            $is_cons_empty = (!isset($items['cons-list']) || empty($items['cons-list']));
            $is_stats_empty = (!isset($items['stats-list']) || empty($items['stats-list']));

            // Either should be NOT EMPTY 
            if (!$is_pros_empty  || !$is_cons_empty || !$is_stats_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    }
}
