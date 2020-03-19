<?php

namespace StarcatReview\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\Includes\Utils\Notification_Test_Data')) {
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
                'subject'   => 'Starcat Mail Subject Content',
                'content'   => 'Mail Body Content',
                'disclaimer' => 'Footer (or) disclaimer content'
            ]
        ];

        private $order_test_data = [
            '12' => '1584246839', // 17th March 2020 11am
            '14' =>  '1584506039' // 18th March 2020 10am
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
            ]
        ];

        public function get_schedule(){
            return $this->get_schedule();
        }

        public function get_settings(){
            return $this->settings;
        }

        public function get_order_data(){
            return $this->order_test_data;
        }
    } // END CLASS
}