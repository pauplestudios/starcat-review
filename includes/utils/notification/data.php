<?php

namespace StarcatReview\Includes\Utils\Notification;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

use StarcatReview\Includes\Settings\SCR_Getter;

if (!class_exists('\StarcatReview\Includes\Utils\Notification\Data')) {
    class Data {

        public function save_schedule($schedule){
            // error_log('Data->save_schedule schedule() : ' . print_r($schedule, true));
            $result = update_option( 'scr_notification_schedule', $schedule);
            return $result;
        }

        public function get_schedule(){
            $schedule = get_option('scr_notification_schedule');

            // error_log('Data->get_schedule() schedule : ' . print_r($schedule, true));
            if(!isset($schedule) || empty($schedule)){
                $schedule = [];
            }

            // error_log('Data->get_schedule() after check schedule : ' . print_r($schedule, true));

            return $schedule; 
        }


        public function get_time_schedule_settings(){
            $time_schedule =  SCR_Getter::get('ns_time_schedule');
            return $time_schedule;
        }

        public function get_email_settings($order_id){
            $from_address =  SCR_Getter::get('ns_from_address');
            $subject =  SCR_Getter::get('ns_subject');
            $content = SCR_Getter::get('ns_content');
            $to =  SCR_Getter::get('ns_from_address');
            $disclaimer = SCR_Getter::get('ns_disclaimer');
            $sitename = get_bloginfo( 'name' ); 

            $order = wc_get_order( $order_id );
            // error_log('$order :' . $order);
           

            // Implement Dynamic Variables
            if($order){
                $product_review_link = $this->get_product_review_links($order);
                $subject = $this->find_and_replace($subject, '{{Sitename}}', $sitename);
                $content = $this->find_and_replace($content, '{{product_review_link}}', $product_review_link);
                $to =  $order->get_billing_email();
            }


            $email_settings = [
                'from_address' => $from_address,
                'subject' => $subject,
                'to' => $to,
                'content' => $content,
                'disclaimer' => $disclaimer,
            ];

            return $email_settings;
        }

        public function get_product_review_links($order){
           
            $items = $order->get_items();

            $content = '';
            $lastElement = end($items);
            foreach ( $items as $item ) {
                $product_name = $item->get_name();
                $product_id = $item->get_product_id();
                $product_variation_id = $item->get_variation_id();
                $product_url = get_permalink( $product_id );

                $content .= '<a href="'.$product_url.'">'.$product_name.'</a>';

                if($item  != $lastElement) {
                    $content .= ', ';
                }
            }

            // error_log('items : ' . print_r($items, true));
            return $content;

            

        }
        public function find_and_replace($string, $original, $replacement){
            return str_replace($original, $replacement, $string);
        }

        public function get_order_data($order_id){
            $order = wc_get_order( $order_id );
            // error_log('order: ' . print_r($order, true));
            $order_completed_timestamp = strtotime($order->get_date_created());

            return $order_completed_timestamp;
           //  return $this->order_test_data[$order_id];
        }
    } // END CLASS
}