<?php

namespace StarcatReview\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Services\Recaptcha')) {
    class Recaptcha
    {

        public static function load_script()
        {
            // <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            // wp_enqueue_script('semantic-js', SCR_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'));
        }

        public static function load_v2_html()
        {
            $key = "6LdhPdYUAAAAAHEpw1Rz7G9kcHaL4A39bFyDgS2x";

            $html = '';
            $html .= self::js_script();
            $html .= '<script src="https://www.google.com/recaptcha/api.js" async defer></script>';
            $html .= '<div class="g-recaptcha" data-callback="starcat_recaptcha_callback" data-sitekey="' . $key . '"></div><br>';
            $html .= '<input type="hidden" id="captcha" name="captcha" value="">';
            return $html;
        }

        public static function js_script()
        {
            $html = '';
            $html .= '<script>function starcat_recaptcha_callback(response) { ';
            $html .= 'console.log("response:"); console.log(response);';
            $html .= 'jQuery("form.scr-user-review.active #captcha").val(response);';
            $html .= '}</script>';

            return $html;
        }

        public static function verify()
        {
            $secret_key = '6LdhPdYUAAAAAHR08h7-uwDmcjoqqvwo6GSRDltj';
            $response = $_POST["captcha"];

            // error_log('verify');
            // error_log('$_POST : ' . print_r($_POST, true));
            // error_log('$response : ' . $response);
            // error_log('$response : ' . print_r($response, true));

            $url = 'https://www.google.com/recaptcha/api/siteverify';
            $data = array(
                'secret' => $secret_key,
                'response' => $response
            );

            $query = http_build_query($data);
            $options = array(
                'http' => array(
                    'header' => "Content-Type: application/x-www-form-urlencoded\r\n" .
                        "Content-Length: " . strlen($query) . "\r\n" .
                        "User-Agent:MyAgent/1.0\r\n",
                    'method' => 'POST',
                    'content' => $query
                )
            );
            $context  = stream_context_create($options);
            $verify = file_get_contents($url, false, $context);
            $captcha_success = json_decode($verify);

            // error_log(' $captcha_success: ' . print_r($captcha_success, true));
            // error_log('$captcha_success : ' . $captcha_success);

            if ($captcha_success->success == false) {
                // echo "<p>You are a bot! Go away!</p>";
                $captcha_success = false;
            } else if ($captcha_success->success == true) {
                $captcha_success = true;
                // echo "<p>You are not not a bot!</p>";
            }

            return $captcha_success;
        }
    }
}