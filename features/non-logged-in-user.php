<?php

namespace StarcatReview\Features;

use \StarcatReview\Services\Recaptcha as Recaptcha;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Non_Logged_In_User')) {
    class Non_Logged_In_User
    {
        public function __construct()
        {
            error_log('\StarcatReview\Features\Non_Logged_In_User');
            add_action('init', array($this, 'init_hook'));
        }

        public function init_hook(){

            $current_user = new \StarcatReview\App\Services\User();

            if($current_user->is_loggedin()){
                return;
            }

            add_filter('scr_user_form_start', [$this, 'form_modification']);
            add_filter('scr_form_process_data', [$this, 'process_form']);
            add_filter('scr_user_review_pre_interpreted_args', [$this, 'user_review_args']);
        }

        public function process_form($props=[]){
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


        public function user_review_args($args = []){
            $who_can_review = 'everyone'; // Settings

            if($who_can_review == 'everyone'){
                $args['can_user_review'] = true;
            }

            return $args;
        }


        public function form_modification($html = ''){
            
            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="user_email" placeholder="Title" value="Email"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="first_name" placeholder="John" value="First Name"/>';
            $html .= '</div>';

            $html .= '<div class="inline field">';
            // $html .= '<label>Review Title</label>';
            $html .= '<input type="text" name="last_name" placeholder="Doe  " value="Last Name"/>';
            $html .= '</div>';

            error_log('html: ' . $html);
            return $html;
        }
    } // END CLASS
}