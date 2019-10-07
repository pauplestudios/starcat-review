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

        public function get($props)
        {
            // if ($this->is_empty($props['items'])) {
            //     return '';
            // }
            $args = $props;
            // error_log("props : " . print_r($props, true));

            $html = '<div class="ui stackable two column grid">';

            // Author Summary
            $html .= '<div class="column">';
            $args['items'] = $props['items']['author'];
            $author_stat = new \HelpieReviews\App\Components\Stats\Controller($args);
            $author_prosandcons = new \HelpieReviews\App\Components\ProsAndCons\Controller($args);
            $html .= $author_stat->get_view();
            $html .= $author_prosandcons->get_view();
            $html .= '</div>';

            // User Summary         
            $html .= '<div class="column">';
            $args['items'] = $props['items']['user'];
            $user_stat = new \HelpieReviews\App\Components\Stats\Controller($args);
            // $user_prosandcons = new \HelpieReviews\App\Components\ProsAndCons\Controller($props);
            $html .= $user_stat->get_view();
            // $html .= $user_prosandcons->get_view();
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
