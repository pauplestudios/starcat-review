<?php

namespace StarcatReview\Includes\Utils\Notification;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification\Notification')) {
    class Notification{

        public function __construct($Data)
        {
            // error_log('Notification->__construct');
            $this->Data = $Data;
            add_action( 'woocommerce_after_register_post_type', [$this, 'schedule_executer'], 11, 1 ); // on load
            add_action( 'woocommerce_order_status_completed', [$this,'add_order_to_schedule'], 10, 1 ); // on purchase
        }
    

        /* Top Level Method */
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

            error_log('Notification->add_order_to_schedule schedule() : ' . print_r($schedule, true));

           // 3. Save new schedule to DB
           $this->save_schedule_to_db($schedule);

           $this->scheduler_log('schedule at the end of add_order_to_schedule');
        }

    
        public function get_updated_schedule(){
            
            $schedule = $this->get_schedule_from_db();
            error_log('initial_schedule : ' . print_r($schedule, true));

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

         /* Top Level Method */
        public function schedule_executer($schedule = []){
           
            error_log('scheduler_called');
            // 1. Get schedule which is updated with new STATUS based on timestamp of Schedule Settings
            $schedule = $this->get_updated_schedule();
            // error_log('get_updated_schedule : ' . print_r($schedule, true));
            
            
            // 2. Loop through all orders and send PENDING emails
            foreach ($schedule as $order_id => $order) {
                $emails = $order['emails'];
                $ii = sizeof($emails) - 1; // most recent email

                 // 3. Send Email if status is PENDING
                if($emails[$ii]['status'] == 'PENDING'){
                    $this->send_email($order_id, $emails[$ii], $ii);
                }
              
            } // closes $schedule loop

            $this->scheduler_log('schedule at the end of schedule_executer');
          
        }

        public function scheduler_log($message){
            $schedule  = $this->get_schedule_from_db();
            error_log($message . print_r($schedule, true));
        }

        /* 2nd Level Methods */
        public function update_schedule($order_id, $email_result){
            $schedule = $this->get_schedule_from_db();

            $order = $schedule[$order_id];
            $emails = $order['emails'];
            $completed_order_notifications = false; // Completed all the emails for this order

            $ii = sizeof($emails) - 1; // most recent email

            if($emails[$ii]['status'] == 'PENDING' && $email_result == 0){
                $emails[$ii]['attempts']++;
            }

            // SUCCESS condition
            if($emails[$ii]['status'] == 'PENDING' && $email_result == 1){
                $emails[$ii]['status'] = 'SUCCESS';
                $emails[$ii]['attempts']++;
            }

            // FAILED condition
            if($emails[$ii]['status'] == 'PENDING' && $email_result == 0 && $emails[$ii]['attempts'] == 2){
                $emails[$ii]['status'] = 'FAILED';
            }
            
            /* ACTIONS for SUCCESS/FAILED conditions */
                
            $current_email_number = $ii + 1;
            $is_last_email = $this->is_last_email($current_email_number);
            

            // Check if email is successful or failed and last email
            if(($emails[$ii]['status'] == 'SUCCESS' || $emails[$ii]['status'] == 'FAILED') && $is_last_email){
                $completed_order_notifications = true;
            }

                // Check if email is successful or failed and not last email
            if(($emails[$ii]['status'] == 'SUCCESS' || $emails[$ii]['status'] == 'FAILED') && !$is_last_email){
                $emails[] =  [
                    'status' => 'LATER',
                    'attempts' =>  0
                ];
            }

            $schedule[$order_id]['emails'] = $emails; // update $schdule from temporary variable $emails 

            if($completed_order_notifications == true){
                unset($schedule[$order_id]);
            }

            $schedule = $this->save_schedule_to_db($schedule);
            return $schedule;
        }

        public function save_schedule_to_db($schedule){
            $this->Data->save_schedule($schedule);
            return $schedule;
        }

 
        public function get_schedule_from_db(){
            return $this->Data->get_schedule(); 
        }

        public function get_order_timestamp($order_id){
            return $this->Data->get_order_data($order_id);
        }


        public function get_email_schedule_time($order_id, $email_number){
            $order_timestamp = $this->get_order_timestamp($order_id);
            $time_schedule_settings = $this->get_time_schedule_settings();
            $schedule_interval = $time_schedule_settings[$email_number-1];
            $email_schedule_timestamp = 0;
            if($schedule_interval['unit'] == 'hours'){
                $email_schedule_timestamp = $order_timestamp + ($schedule_interval['value'] * (60 * 60));
            }

            if($schedule_interval['unit'] == 'days'){
                $email_schedule_timestamp = $order_timestamp + ($schedule_interval['value'] * (60*60*24));
            }

            return $email_schedule_timestamp;
        }


        public function send_email($order_id, $email_info, $email_number){
            $email_settings = $this->get_email_settings($order_id);
            
            $to = $email_settings['to'];
            $subject = $email_settings['subject'];
            $body =  $email_settings['content'];
            // $body = 'The email body content of order_id: ' . $order_id . " - attempt_no:  " .  ++$email_info['attempts'] . " email_number: " . ++$email_number;
            $headers = array('Content-Type: text/html; charset=UTF-8');
            
            // 1. Send Email
            $email_result = wp_mail( $to, $subject, $body, $headers );

            // 2. Update Schedule Based on email result
            $schedule = $this->update_schedule($order_id, $email_result);
           // error_log('schedule at the end of send_email: ' . print_r($schedule, true));
        }



        public function is_last_email($current_email_number){
            $is_last_email = false;

            $time_schedule_settings = $this->get_time_schedule_settings();
            $number_of_emails_configured = sizeof($time_schedule_settings);

            if($current_email_number >= $number_of_emails_configured){
                $is_last_email = true;
            }

            return $is_last_email;

        }

        public function get_email_settings($order_id){
            $email_settings = $this->Data->get_email_settings($order_id);
            return $email_settings;
        }

        public function get_time_schedule_settings(){
            return $this->Data->get_time_schedule_settings();
        }

   

    }  // END CLASS
}

?>