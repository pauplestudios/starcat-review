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
            // error_log('props : ' . print_r($props, true));

            $html = '';
            $html .= $this->get_product_reviews_title();
            $html .= '<div class="scr-summary">';
            $html .= '<div class="ui stackable ' . $props['collection']['no_of_column'] . ' column grid">';

            $html .= $this->get_column($props['collection']['author_title'], $props['items']['author_stat']);
            $html .= $this->get_column($props['collection']['users_title'], $props['items']['comment_stat']);

            // if ($author_args['enable-author-review']) {
            //     $author_prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
            //     $html .= $author_prosandcons->get_view($author_args);
            // }

            // $attachements = (isset($user_args['items']['attachments']) && !empty($user_args['items']['attachments'])) ? $user_args['items']['attachments'] : [];
            // $all_photos = apply_filters('scr_photo_reviews/get_all_photos', $attachements);
            // $all_photos_html = is_string($all_photos) ? $all_photos : '';

            // $html .= $all_photos_html;

            $html .= '</div></div>';

            return $html;

        }

        public function get_column($title, $stat_args)
        {
            $html = '';
            $is_stat_set = isset($stat_args['items']) && empty($stat_args['items']) ? true : false;

            if ($is_stat_set) {
                return $html;
            }

            $stats = new \StarcatReview\App\Components\Stats\Controller($stat_args);
            $stats_view = $stats->get_view();

            $html .= '<div class="column">';
            $html .= '<h4 class="ui header">' . $title . ' </h4>';
            $html .= $stats_view;
            $html .= '</div>';

            return $html;
        }

        public function get_old($props)
        {
            error_log('props : ' . print_r($props, true));

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

            $html = '';
            $html .= $this->get_product_reviews_title();
            $html .= '<div class="scr-summary">';
            $html .= '<div class="ui stackable ' . $no_of_column . ' column grid">';

            // Author Summary
            if ($is_author_empty !== true) {
                $html .= '<div class="column">';
                $author_args['items'] = $props['items']['summary_author'];
                $html .= '<h4 class="ui header"> Author Rating </h4>';
                $author_stat = new \StarcatReview\App\Components\Stats_Old\Controller($author_args);
                $html .= $author_stat->get_view();
                $html .= '</div>';
            }

            // User Summary
            if ($is_user_empty !== true) {
                $html .= '<div class="column">';
                $html .= '<h4 class="ui header"> User Rating ( ' . $props['items']['user']['review_count'] . ' )</h4>';
                $user_args['items'] = $props['items']['user'];
                $user_stat = new \StarcatReview\App\Components\Stats_Old\Controller($user_args);
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
            $all_photos = apply_filters('scr_photo_reviews/get_all_photos', $attachements);
            $all_photos_html = is_string($all_photos) ? $all_photos : '';

            $html .= $all_photos_html;

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
