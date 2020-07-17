<?php

namespace StarcatReview\Features;

use \StarcatReview\Includes\Settings\SCR_Getter;

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
            add_filter('scr_comment', [$this, 'get_comment_item']);
            add_filter('scr_can_view_comment', [$this, 'can_view_comment'], 10, 2);
            add_filter('scr_has_current_user_already_reviewed', [$this, 'has_current_user_already_reviewed'], 10, 2);
        }

        public function get_comment_item($comment_item)
        {
            // Rule for this hook
            if (isset($comment_item['user_id']) && $comment_item['user_id'] != 0) {
                return $comment_item;
            }

            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();
            $settings = $this->get_settings();

            $commenters = wp_get_current_commenter();
            // error_log('commenters : ' . print_r($commenters, true));

            if ($settings['who_can_review'] == 'everyone' && $comment_item['author_IP'] == $current_user_IP) {
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

            // Exit Rule 1 for this hook
            if ($comment['approved'] == 1) {
                return $can_view;
            }

            // Exit Rule 2 for this hook
            if (isset($comment['user_id']) && $comment['user_id'] != 0) {
                return $can_view;
            }

            // If user is logged_in, this method should not be called at all.
            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();
            $settings = $this->get_settings();

            if ($settings['who_can_review'] == 'everyone' && $comment['author_IP'] == $current_user_IP) {
                $can_view = true;
            } else {
                $can_view = false;
            }

            return $can_view;
        }

        public function process_form($props = [])
        {

            if (isset($_POST['name']) && !empty($_POST['name'])) {
                $props['name'] = $_POST['name'];
            }

            if (isset($_POST['email']) && !empty($_POST['email'])) {
                $props['email'] = $_POST['email'];
            }

            if (isset($_POST['website']) && !empty($_POST['website'])) {
                $props['website'] = $_POST['website'];
            }

            return $props;
        }

        public function has_current_user_already_reviewed($has_reviewed, $comment)
        {
            // error_log('$has_current_user_already_reviewed COMMENT : ' . print_r($comment, true));
            // Exit Rule 1 for this hook
            if ((isset($comment['user_id']) && $comment['user_id'] != 0)) {
                return $has_reviewed;
            }

            $Current_User = new \StarcatReview\App\Services\User();
            $current_user_IP = $Current_User->get_user_IP();

            if ($comment['author_IP'] == $current_user_IP && $comment['parent'] == 0) {
                $has_reviewed = true;
            } else {
                $has_reviewed = false;
            }

            return $has_reviewed;
        }

        public function form_modification($html = '', $review = [])
        {
            $commenters = wp_get_current_commenter();
            // error_log('commenter : ' . print_r($commenter, true));

            $name = (isset($commenter['comment_author'])) ? $commenter['comment_author'] : '';
            $email = (isset($commenter['comment_author_email'])) ? $commenter['comment_author_email'] : '';
            $website = (isset($commenter['comment_author_url'])) ? $commenter['comment_author_url'] : '';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="name" placeholder="' . __('Name', SCR_DOMAIN) . '*" value="' . $name . '"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="email" placeholder="' . __('Email', SCR_DOMAIN) . '*" value="' . $email . '"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="website" placeholder="' . __('Website', SCR_DOMAIN) . '" value="' . $website . '"/>';
            $html .= '</div>';

            // error_log('html: ' . $html);
            return $html;
        }
    } // END CLASS
}
