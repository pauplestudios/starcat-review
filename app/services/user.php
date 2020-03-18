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
