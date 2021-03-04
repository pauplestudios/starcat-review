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

        public function get(array $props, array $user_args = array())
        {
            error_log('[$user_args] : ' . print_r($user_args, true));
            $html = '';
            $html .= $props['collection']['reviews_title'];
            $html .= '<div class="scr-summary">';
            $html .= '<div class="ui stackable ' . $props['collection']['no_of_column'] . ' column grid">';

            $show_author_review = $this->validate_to_show_the_author_review($user_args);
            $show_user_review = $this->validate_to_show_the_user_review($user_args);

            if ($props['collection']['is_enable_author'] && $show_author_review == true) {
                $html .= $this->get_column($props['collection']['author_title'], $props['items']['author_stat']);
            }

            /*** Enable/Disable the overall users ratings stats content */
            if (isset($props['collection']['enable_user_reviews']) && $props['collection']['enable_user_reviews'] == true) {

                if ($show_user_review == true) {
                    $html .= $this->get_column($props['collection']['users_title'], $props['items']['comment_stat']);
                }

                if ($props['collection']['is_enable_author'] && $props['collection']['is_enable_prosandcons']) {
                    $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                    $html .= $prosandcons->get_view($props);
                }

                $html .= $this->get_all_attachments($props);
            }

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

        public function get_all_attachments($props)
        {
            $html = '';
            $attachments = (isset($props['items']['attachments']) && !empty($props['items']['attachments'])) ? $props['items']['attachments'] : [];

            if (isset($attachments) && !empty($attachments)) {
                $all_photos = apply_filters('scr_photo_reviews/get_all_photos', $attachments);
                $html .= is_string($all_photos) ? $all_photos : '';
            }

            return $html;
        }

        public function validate_to_show_the_author_review(array $user_args = array())
        {
            if (empty($user_args)) {
                return true;
            }
            $show_author_review = isset($user_args['show_author_reviews_summary']) && $user_args['show_author_reviews_summary'] == 1 ? true : false;
            return $show_author_review;
        }

        public function validate_to_show_the_user_review(array $user_args = array())
        {
            if (empty($user_args)) {
                return true;
            }
            $show_user_review = isset($user_args['show_user_reviews_summary']) && $user_args['show_user_reviews_summary'] == 1 ? true : false;
            return $show_user_review;
        }

    }
}