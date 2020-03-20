<?php

namespace StarcatReview\Includes\Utils\Notification;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification\Data')) {
    class Data{

        // TODO: TEST THIS
        public function save_schedule($schedule){
            $result = update_option( 'scr_notification_schedule', $schedule);
            return $result;
        }

        // TODO: TEST THIS
        public function get_schedule(){
            $schedule = get_option('scr_notification_schedule');

            if(!isset($schedule) || empty($schedule)){
                $schedule = [];
            }

            return $schedule; 
        }

        // TODO: Replace with actual data
        public function get_settings(){
            return $this->settings;
        }

        // TODO: Replace with actual data
        public function get_order_data($order_id){
            return $this->order_test_data[$order_id];
        }
    } // END CLASS
}