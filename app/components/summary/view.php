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
            $html .= $props['collection']['reviews_title'];
            $html .= '<div class="scr-summary">';
            $html .= '<div class="ui stackable ' . $props['collection']['no_of_column'] . ' column grid">';

            $html .= $this->get_column($props['collection']['author_title'], $props['items']['author_stat']);
            $html .= $this->get_column($props['collection']['users_title'], $props['items']['comment_stat']);

            if ($props['collection']['is_enable_author']) {
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                $html .= $prosandcons->get_view($props);
            }

            // $attachements = (isset($props['items']['attachments']) && !empty($user_args['items']['attachments'])) ? $user_args['items']['attachments'] : [];
            // $all_photos = apply_filters('scr_photo_reviews/get_all_photos', $attachements);
            // $all_photos_html = is_string($all_photos) ? $all_photos : '';

            // $html .= $all_photos_html;

            $html .= '</div></div>';

            return $html;

        }

        public function get_column($title, $stat_args)
        {
            $html = '';
            $is_stat_set = isset($stat_args['items']) && !empty($stat_args['items']) ? true : false;

            if (!$is_stat_set) {
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
    }
}
