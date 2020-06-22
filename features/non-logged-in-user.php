<?php

namespace StarcatReview\Features;

use StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Non_Logged_In_User')) {
    class Non_Logged_In_User
    {
        public function __construct()
        {
            // error_log('\StarcatReview\Features\Non_Logged_In_User');
            add_action('init', array($this, 'init_hook'));
        }

        public function get_settings()
        {

            $settings = [
                'who_can_review' => SCR_Getter::get('ur_who_can_review'),
            ];
            return $settings;
        }

        public function init_hook()
        {

            $current_user = new \StarcatReview\App\Services\User();

            if ($current_user->is_loggedin()) {
                return;
            }

            add_filter('scr_user_form_start', [$this, 'form_modification'], 10, 2);
            add_filter('scr_form_process_data', [$this, 'process_form']);
            add_filter('scr_user_review_pre_interpreted_args', [$this, 'user_review_args']);
            add_filter('scr_comment', [$this, 'get_comment_item']);
            add_filter('scr_can_view_comment', [$this, 'can_view_comment'], 10, 2);
            add_filter('scr_has_current_user_already_reviewed', [$this, 'has_current_user_already_reviewed'], 10, 2);
        }

        public function get_comment_item($comment_item)
        {
            // Rule for this hook
            if (isset($comment_item->user_id) && $comment_item->user_id != 0) {
                return $comment_item;
            }

            // If user is logged_in, this method should not be called at all.
            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();
            $settings = $this->get_settings();

            if ($settings['who_can_review'] == 'everyone' && $comment_item->comment_item_author_IP == $current_user_IP) {
                $comment_item['can_edit'] = true;
            } else {
                $comment_item['can_edit'] = false;
            }

            return $comment_item;
        }

        public function can_view_comment($can_view, $comment)
        {

            // error_log('$comment_info : ' . print_r($comment_info, true));
            if (!is_array($comment)) {
                error_log('CHECK DATA TYPE OF : ' . print_r($comment, true));
            }

            // $comment = $comment_info['args']['current_user_review'];

            // Exit Rule 1 for this hook
            if ($comment['comment_approved'] == 1) {
                return $can_view;
            }

            // Exit Rule 2 for this hook
            if (isset($comment['user_id']) && $comment['user_id'] != 0) {
                return $can_view;
            }

            error_log('$can_view_comment : ' . print_r($comment, true));

            // If user is logged_in, this method should not be called at all.
            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();
            $settings = $this->get_settings();

            if ($settings['who_can_review'] == 'everyone' && $comment['comment_author_IP'] == $current_user_IP) {
                $can_view = true;
            } else {
                $can_view = false;
            }

            return $can_view;
        }

        public function process_form($props = [])
        {
            if (isset($_POST['user_email']) && !empty($_POST['user_email'])) {
                $props['user_email'] = $_POST['user_email'];
            }

            if (isset($_POST['first_name']) && !empty($_POST['first_name'])) {
                $props['first_name'] = $_POST['first_name'];
            }

            if (isset($_POST['last_name']) && !empty($_POST['last_name'])) {
                $props['last_name'] = $_POST['last_name'];
            }

            return $props;
        }

        public function has_current_user_already_reviewed($has_reviewed, $comment)
        {
            error_log('$has_current_user_already_reviewed COMMENT : ' . print_r($comment, true));
            // Exit Rule 1 for this hook
            if ((isset($comment->user_id) && $comment->user_id != 0)) {
                return $has_reviewed;
            }

            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();

            if ($comment->comment_author_IP == $current_user_IP && $comment->comment_parent == 0) {
                $has_reviewed = true;
            } else {
                $has_reviewed = false;
            }

            return $has_reviewed;

        }

        public function user_review_args($args = [])
        {
            $settings = $this->get_settings();
            $who_can_review = $settings['who_can_review']; // Settings

            if ($who_can_review == 'everyone') {
                $args['can_user_review'] = true;
                $args['can_user_reply'] = true;
            }

            return $args;
        }

        public function form_modification($html = '', $review = [])
        {
            $user_email = (isset($review['user_email'])) ? $review['user_email'] : '';
            $first_name = (isset($review['first_name'])) ? $review['first_name'] : '';
            $last_name = (isset($review['last_name'])) ? $review['last_name'] : '';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="user_email" placeholder="me@mycompany.com" value="' . $user_email . '"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="first_name" placeholder="John" value="' . $first_name . '"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="last_name" placeholder="Doe  " value="' . $last_name . '"/>';
            $html .= '</div>';

            // error_log('html: ' . $html);
            return $html;
        }
    } // END CLASS
}
