<?php

namespace StarcatReview\Includes\Utils\Notification;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification\Notification_Test_Data')) {
    class Notification_Test_Data{

        private $status = [
            'LATER', // schedule time has not reached
            'PENDING', // waiting to be sent
            'SUCESS', // sent successfully
            'FAILED' // failed after 3 attempts
        ];

        private  $settings = [
            'time_schedule' => [
                0 => [
                    'value' => 3,
                    'unit' => 'hours'
                ],
                1 => [
                    'value' => 1,
                    'unit' => 'days'
                ],
                2 => [
                    'value' => 7,
                    'unit' => 'days'
                ],
            ],
            'email'    => [
                'from_address' => 'themechanic.dev@gmail.com',
                'to' => 'buyer@gmail.com',
                'subject'   => 'Starcat Mail Subject Content',
                'content'   => 'Mail Body Content',
                'disclaimer' => 'Footer (or) disclaimer content'
            ]
        ];

        private $order_test_data = [
            '12' => '1584246839', // 17th March 2020 11am
            '14' =>  '1584506039', // 18th March 2020 10am
            '15' => '1583900019', // 11th March 2020 9 43am
        ];

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
                        'status' => 'LATER',
                        'attempts' =>  0
                    ]
                ]
            ],
            '15'  => [ // order_id
                'emails' => [
                    0 => [
                        'status' => 'SUCCESS',
                        'attempts' =>  2
                    ],
                    1 => [
                        'status' => 'FAILED',
                        'attempts' =>  3
                    ],
                    2 => [
                        'status' => 'LATER',
                        'attempts' =>  2
                    ],
                    

                ]
            ]
        ];

        public function save_schedule($schedule){
            $this->schedule = $schedule;
          
        }

        public function add_order_timestamp($order_timestamp, $order_id){
            $this->order_test_data[$order_id] = $order_timestamp;
        }

        public function get_time_schedule_settings(){
            return $this->settings['time_schedule'];
        }

        public function get_email_settings($order_id){
            return $this->settings['email'];
        }

        public function get_schedule(){
            return $this->schedule;
        }

        // DO NOT USE DIRECTLY
        private function get_settings(){
            return $this->settings;
        }

        public function get_order_data($order_id){
            return $this->order_test_data[$order_id];
        }
    } // END CLASS
}