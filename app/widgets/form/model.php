<?php

namespace HelpieReviews\App\Widgets\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Form\Model')) {
    class Model
    {
        public function __construct($post_id)
        {
            $this->post_id = $post_id;
        }

        public function get_viewProps()
        {         
            return [
                'show_user_review' => true,
                'limit' => 10,
                'type' => 'slider', // Text field or Star
            ];
        }        

    } // END CLASS
}