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
        
        
        public function scr_mail($args){

            $user_mail      = $args['user_mail']; // its comes array || string
            $subject        = $args['subject'];
            $mail_content   = $args['content'];
            error_log("mail arguments".print_r($args,true));

            wp_mail($user_mail,$subject,$mail_content);
        }
    }
    
}
?>
