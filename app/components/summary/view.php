<?php

namespace StarcatReview\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Summary\View')) {
    class View
    {
        public function __construct()
        { }

        public function get($props)
        {
            $author_args = $props;
            $user_args = $props;

            $show_user = $this->is_empty($props['items']['user']);
            $show_author = $this->is_empty($props['items']['author']);
            $no_of_column = ($show_user == true) ? 'one' : 'two';


            $html = '<div class="hrp-summary">';
            $html .= '<div class="ui stackable ' . $no_of_column . ' column grid">';

            // Author Summary
            if ($show_author !== true) {
                $html .= '<div class="column">';
                $author_args['items'] = $props['items']['author'];
                $html .= '<h4 class="ui header"> Author Rating </h4>';
                $author_stat = new \StarcatReview\App\Components\Stats\Controller($author_args);
                $html .= $author_stat->get_view();
                $html .= '</div>';
            }

            // User Summary 
            if ($show_user !== true) {
                $html .= '<div class="column">';
                $html .= '<h4 class="ui header"> User Rating ( ' . $props['items']['user']['review_count'] . ' )</h4>';
                $user_args['items'] = $props['items']['user'];
                $user_stat = new \StarcatReview\App\Components\Stats\Controller($user_args);
                // $user_prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller($props);
                $html .= $user_stat->get_view();
                // $html .= $user_prosandcons->get_view();
                $html .= '</div>';
            }

            $author_prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller($author_args);
            $html .= $author_prosandcons->get_view();

            $html .= '</div></div>';

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
