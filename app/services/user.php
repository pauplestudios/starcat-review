<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly



use Spatie\SchemaOrg\Schema;

if (!class_exists('\StarcatReview\App\Services\User')) {
    class User
    {

        public function __construct()
        {
            
        }

        public function get_user_IP(){
            if (!empty($_SERVER['REMOTE_ADDR']) && rest_is_ip_address(wp_unslash($_SERVER['REMOTE_ADDR']))) { // WPCS: input var ok, sanitization ok.
                $IP = wp_unslash($_SERVER['REMOTE_ADDR']); // WPCS: input var ok.
            } else {
                $IP = '127.0.0.1';
            }

            return $IP;
        }
        public function can_user_directly_publish_reviews(){
            return !current_user_can('manage_options');
        }


        public  function can_review(){
            return true;
        }

        public  function is_loggedin(){
            return is_user_logged_in();
           // return true;
        }
    } // END CLASS
}
