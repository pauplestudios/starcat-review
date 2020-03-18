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
            add_action( 'init', [$this, 'schedule_executer'] );
        }

        private static $settings = [
            'time_schedule' => [
                '0' => [
                    'value' => 1,
                    'option' => 'day'
                ]
            ],
            'email'    => [
                'from_address' => 'themechanic.dev@gmail.com',
                'subject'   => 'Starcat Mail Subject Content',
                'content'   => 'Mail Body Content',
                'disclaimer' => 'Footer (or) disclaimer content'
            ]
        ];

        public function get_setting(){
            return Notification::$settings;
        }

        public function get_schedule(){
            return Notification::$schedule;
        }

        private  $schedule = [
            '12'  => [ // order_id
               'emails' => [
                   0 => [
                       'status' => 'PENDING',
                       'attempts' =>  1
                   ]
               ]
            ],
            '14'  => [ // order_id
                'emails' => [
                    0 => [
                        'status' => 'SUCCESS',
                        'attempts' =>  2
                    ],
                    1 => [
                        'status' => 'PENDING',
                        'attempts' =>  0
                    ]
                ]
            ]
        ];

        public function schedule_executer($schedule = []){
            error_log('Notification->schedule_executer()');
            $schedule = $this->schedule;
            foreach ($schedule as $order_id => $order) {
                $emails = $order['emails'];

                for ($ii=0; $ii < sizeof($emails) ; $ii++) { 
                    if($emails[$ii]['status'] == 'PENDING'){
                        $this->send_email($order_id, $emails[$ii], $ii);
                       // $this->update_schedule();
                    }
                } // closes $emails loop
            } // closes $schedule loop
        }

        public function send_email($order_id, $email_info, $email_number){
            error_log('Notification->send_email()');
            $to = 'sendto@example.com';
            $subject = 'The subject';
            $body = 'The email body content of order_id: ' . $order_id . " - attempt_no:  " .  ++$email_info['attempts'] . " email_number: " . ++$email_number;
            $headers = array('Content-Type: text/html; charset=UTF-8');
            
            $email_result = wp_mail( $to, $subject, $body, $headers );

            if($email_result){
               // $this->update_schedule($order_id, $email_result);
            }
        }

        public function update_schedule($order_id, $email_result){
            $schedule = $this->schedule;

            $order = $schedule[$order_id];
            $emails = $order['emails'];
            for ($ii=0; $ii < sizeof($emails) ; $ii++) { 
                if($emails[$ii]['status'] == 'PENDING' && $email_result == 1){
                   $emails['status'] == 'SUCCESS';
                   $emails['attempts']++;
                }

                if($emails[$ii]['status'] == 'PENDING' && $email_result == 0){
                    // $emails['status'] == 'SUCCESS';
                    $emails['attempts']++;
                 }

                 if($emails[$ii]['status'] == 'PENDING' && $email_result == 0 && $emails['attempts'] == 2){
                    $emails['status'] == 'FAILED';
                 }
            } // closes $emails loop
        }

        public function get_schdeule_intervals(){
            $settings = $this->get_setting();
            $schdeule_intervals = array();
            $time_schedules  = isset($settings['time_schedule']) ?$settings['time_schedule']: [];
            // error_log('settings : ' . print_r($settings, true));
            if(count($time_schedules) > 0){
                
                foreach($time_schedules as $time_schedule){
                    
                    $value  = $time_schedule['value'];
                    $option = $time_schedule['option'];
                    if($option == "day"){
                        $timestamp = $value * 60 * 60;
                        $schdeule_intervals[]   = $timestamp;
                    }
                }
            }
            error_log('schdeule_intervals : ' . print_r($schdeule_intervals, true));
            return $schdeule_intervals;
        }
    }  
}

?>