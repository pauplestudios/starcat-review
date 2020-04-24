<?php

namespace StarcatReview\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Summary\View')) {
    class View
    {
        public function __construct()
        {}

        public function get($props)
        {
            $author_args = $props;
            $user_args = $props;

            $is_user_empty = $this->is_empty($props['items']['user']);
            $is_author_empty = $this->is_empty($props['items']['author']);

            if (!$is_author_empty && !$is_user_empty) {
                $no_of_column = 'two';
            } elseif (!$is_author_empty || !$is_user_empty) {
                $no_of_column = 'one';
            } else {
                $no_of_column = 'one';
            }

            $html = '<div class="scr-summary">';
            $html .= '<div class="ui stackable ' . $no_of_column . ' column grid">';

            // Author Summary
            if ($is_author_empty !== true) {
                $html .= '<div class="column">';
                $author_args['items'] = $props['items']['author'];
                $html .= '<h4 class="ui header"> Author Rating </h4>';
                $author_stat = new \StarcatReview\App\Components\Stats\Controller($author_args);
                $html .= $author_stat->get_view();
                $html .= '</div>';
            }

            // User Summary
            if ($is_user_empty !== true) {
                $html .= '<div class="column">';
                $html .= '<h4 class="ui header"> User Rating ( ' . $props['items']['user']['review_count'] . ' )</h4>';
                $user_args['items'] = $props['items']['user'];
                $user_stat = new \StarcatReview\App\Components\Stats\Controller($user_args);
                // $user_prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller($props);
                $html .= $user_stat->get_view();
                // $html .= $user_prosandcons->get_view();
                $html .= '</div>';
            }

            if ($author_args['enable-author-review']) {
                $author_prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                $html .= $author_prosandcons->get_view($author_args);
            }            

            $attachements = (isset($user_args['items']['attachments']) && !empty($user_args['items']['attachments'])) ? $user_args['items']['attachments'] : [];
            $html .= apply_filters('scr_photo_reviews/get_all_photos', $attachements);
            
            $html .= '</div></div>';

            return $html;
        }

        /* PRIVATE METHODS */
        private function is_empty($items = [])
        {
            $is_empty = false;

            if (!isset($items['stats-list']) || empty($items['stats-list'])) {
                $is_empty = true;
            }

            return $is_empty;
        }
    }
}
