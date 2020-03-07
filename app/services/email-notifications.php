<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Email_Notifications')) {

    class Email_Notifications{

        public function default_args(){
            $mail_args = array();
            $mail_args['from_address'] = "";
            $mail_args['mailer'] = "";
            $mail_args['return_path'] = "";
            $mail_args['to_address'] = array();
            $mail_args['subject'] = "";
            $mail_args['content'] = "";
            $mail_args['attachments'] = array();
            $mail_args['cc']    = array();
        }
        
        
        public function send_mail($args){

            $from_address   = $args['from_address']; // its comes array || string
            $to_address     = $args['to_address']; // its comes array || string
            $subject        = $args['subject'];
            $mail_content   = $args['content'];
            $disclaimer     = $args['disclaimer'];
            $header         = $args['header'];
            $attachments    = isset($args['attachments']) ?$args['attachments']: array();
                      
    
            
            error_log("mail arguments".print_r($args,true));

            wp_mail($from_address,$subject,$mail_content);
        }
    }
    
}
?>
