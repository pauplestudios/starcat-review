<?php

namespace StarcatReview\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification')) {
    class Notification{

        private static $schedule = [
            '12'  => [ // order_id
               'email_status' => [
                   'first' => [
                       'status' => 'PENDING',
                       'attempts' =>  '1'
                   ]
               ]
            ]
        ];

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