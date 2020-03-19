<?php

namespace StarcatReview\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Scheduler')) {
    class Scheduler{

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


        public function update_schedule($order_id, $email_result){
            $schedule = $this->schedule;

            $order = $schedule[$order_id];
            $emails = $order['emails'];
            for ($ii=0; $ii < sizeof($emails) ; $ii++) { 
                
                if($emails[$ii]['status'] == 'PENDING' && $email_result == 0){
                    // $emails['status'] == 'SUCCESS';
                    $emails['attempts']++;
                }

                // SUCCESS condition
                if($emails[$ii]['status'] == 'PENDING' && $email_result == 1){
                   $emails['status'] = 'SUCCESS';
                   $emails['attempts']++;
                }

                // FAILED condition
                if($emails[$ii]['status'] == 'PENDING' && $email_result == 0 && $emails['attempts'] == 2){
                    $emails['status'] = 'FAILED';
                }
                
                /* ACTIONS for SUCCESS/FAILED conditions */
                 
                $current_email_number = $ii + 1;
                $is_last_email = $this->is_last_email($current_email_number);

                // Check if email is successful or failed and last email
                if(($emails['status'] == 'SUCCESS' || $emails['status'] == 'FAILED') && $is_last_email){
                    unset($schedule[$order_id]);
                 }

                 // Check if email is successful or failed and not last email
                if(($emails['status'] == 'SUCCESS' || $emails['status'] == 'FAILED') && !$is_last_email){
                    $schedule[$order_id]['emails'][] =  [
                        'status' => 'LATER',
                        'attempts' =>  0
                    ];
                }


            } // closes $emails loop

            $schedule[$order_id]['emails'] = $emails;
        }

        // TODO: Replace with actual data
        public function get_order_timestamp($order_id){
            return $this->order_test_data[$order_id];
        }

        // TODO: replace with actual db code
        public function get_schedule_from_db(){
            return $this->schedule; 
        }

            // TODO: replace with actual db saving code
        public function save_schedule_to_db($schedule){
            $this->schedule = $schedule;
        }

    } // END CLASS
}