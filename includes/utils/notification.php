<?php

namespace StarcatReview\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification')) {
    class Notification{

        public function __construct()
        {
            error_log('Notification->__construct');
            $this->Data = new \StarcatReview\Includes\Utils\Notification_Test_Data();

            add_action( 'init', [$this, 'schedule_executer'] ); // on load
            add_action( 'woocommerce_order_status_completed', [$this,'add_order_to_schedule'], 10, 1 ); // on purchase
        }
    

        /* Top Level Methods */
        public function add_order_to_schedule($order_id){
            error_log('add_order_to_schedule $order_id: ' . $order_id);
            // 1. Get schedule which is updated with new STATUS based on timestamp of Schedule Settings
            $schedule = $this->get_updated_schedule();

            // 2. Add new order schedule. Just the first email
            $schedule[$order_id] = [
                'emails' => [
                    0 => [
                        'status' => 'LATER',
                        'attempts' =>  0
                    ]
                ]
            ];

           // 3. Save new schedule to DB
           $this->save_schedule_to_db($schedule);

           error_log('schedule : ' . print_r($schedule, true));
        }

        public function schedule_executer($schedule = []){
            error_log('Notification->schedule_executer()');
              // 1. Get schedule which is updated with new STATUS based on timestamp of Schedule Settings
            $schedule = $this->get_updated_schedule();
            error_log('get_updated_schedule : ' . print_r($schedule, true));

            // 2. Loop through all orders and send PENDING emails
            foreach ($schedule as $order_id => $order) {
                $emails = $order['emails'];

                for ($ii = 0; $ii < sizeof($emails) ; $ii++) { 
                    if($emails[$ii]['status'] == 'PENDING'){
                        $this->send_email($order_id, $emails[$ii], $ii);
                       // $this->update_schedule();
                    }
                } // closes $emails loop
            } // closes $schedule loop
        }

        /* 2nd Level Methods */

         // TODO: replace with actual db saving code
        public function save_schedule_to_db($schedule){
            $this->schedule = $schedule;
        }

         // TODO: replace with actual db code
        public function get_schedule_from_db(){
            return $this->schedule; 
        }

        // TODO: write timestamp and status update code
        // TODO: replace with actual db code
        public function get_updated_schedule(){
            
            $schedule = $this->get_schedule_from_db();

            // 1. Loop through each order in schedule and each email in each order
            foreach ($schedule as $order_id => $order) {
                $emails = $order['emails'];
                $current_timestamp = time();

                for ($ii = 0; $ii < sizeof($emails) ; $ii++) { 
                    $email_number = $ii + 1;
                    $email_schedule_timestamp = $this->get_email_schedule_time($order_id,  $email_number);

                    // error_log(' ' . $email_number );
                    // error_log('$email_schedule_timestamp ' . $email_schedule_timestamp );
                    // error_log('$current_timestamp ' . $current_timestamp );

                    // 2. Find email with LATER status
                    if(($emails[$ii]['status'] == 'LATER') && ( $email_schedule_timestamp <= $current_timestamp)){
                        $schedule[$order_id]['emails'][$ii]['status'] = 'PENDING';
                   
                    }
                } // closes $emails loop
            } // closes $schedule loop

            // 3. Save new schedule to DB
            $this->save_schedule_to_db($schedule);

            return $schedule; 
        }

        public function get_email_schedule_time($order_id, $email_number){
            $order_timestamp = $this->get_order_timestamp($order_id);
            // error_log('$order_timestamp ' . $order_timestamp );
            $schedule_interval = $this->settings['time_schedule'][$email_number-1];
            $email_schedule_timestamp = 0;
            if($schedule_interval['unit'] == 'hours'){
                $email_schedule_timestamp = $order_timestamp + ($schedule_interval['value'] * (60 * 60));
            }

            if($schedule_interval['unit'] == 'days'){
                $email_schedule_timestamp = $order_timestamp + ($schedule_interval['value'] * (60*60*24));
            }

            return $email_schedule_timestamp;
        }

        // TODO: Replace with actual data
        public function get_order_timestamp($order_id){
           return $this->order_test_data[$order_id];
        }


        public function send_email($order_id, $email_info, $email_number){
            error_log('Notification->send_email()');
            $to = 'sendto@example.com';
            $subject = 'The subject';
            $body = 'The email body content of order_id: ' . $order_id . " - attempt_no:  " .  ++$email_info['attempts'] . " email_number: " . ++$email_number;
            $headers = array('Content-Type: text/html; charset=UTF-8');
            
            // 1. Send Email
            $email_result = wp_mail( $to, $subject, $body, $headers );

            // 2. Update Schedule Based on email result
            $this->update_schedule($order_id, $email_result);
        }

        public function update_schedule($order_id, $email_result){
            $schedule = $this->schedule;

            $order = $schedule[$order_id];
            $emails = $order['emails'];
            for ($ii=0; $ii < sizeof($emails) ; $ii++) { 
                if($emails[$ii]['status'] == 'PENDING' && $email_result == 1){
                   $emails['status'] = 'SUCCESS';
                   $emails['attempts']++;
                }

                if($emails[$ii]['status'] == 'PENDING' && $email_result == 0){
                    // $emails['status'] == 'SUCCESS';
                    $emails['attempts']++;
                 }

                 if($emails[$ii]['status'] == 'PENDING' && $email_result == 0 && $emails['attempts'] == 2){
                    $emails['status'] = 'FAILED';
                 }
                
                /* SUCCESS ACTIONS */
                 
                 $current_email_number = $ii + 1;
                 $is_last_email = $this->is_last_email($current_email_number);

                // Check if email is successful and last email
                if($emails['status'] == 'SUCCESS' && $is_last_email){
                    unset($schedule[$order_id]);
                 }

                 // Check if email is successful and not last email
                if($emails['status'] == 'SUCCESS' && !$is_last_email){
                    $schedule[$order_id]['emails'][] =  [
                        'status' => 'LATER',
                        'attempts' =>  0
                    ];
                }


            } // closes $emails loop

            $schedule[$order_id]['emails'] = $emails;
        }

        public function is_last_email($current_email_number){
            $is_last_email = false;

            $settings = $this->get_settings();
            $number_of_emails_configured = sizeof($settings['time_schedule']);

            if($current_email_number >= $number_of_emails_configured){
                $is_last_email = true;
            }

            return $is_last_email;

        }

        public function get_settings(){
            return $this->settings;
        }

        public function get_schedule(){
            return Notification::$schedule;
        }
    }  // END CLASS
}

?>