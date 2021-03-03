<?php

namespace StarcatReview\App\Widget_Makers\User_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\User_Review\Form')) {
    class Form
    {
        public function get_form(array $args)
        {
            $form_controller = new \StarcatReview\App\Components\Form\Controller();
            return $form_controller->get_view($args);
        }
    }
}