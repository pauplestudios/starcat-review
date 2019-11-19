<?php

namespace StarcatReview\App\Widget_Makers\Review_Listing;

// use \StarcatReview\App\Abstracts\Widget_Model_Interface as Widget_Model_Interface;
// use \StarcatReview\App\Abstracts\Widget_Model as Widget_Model;
use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Review_Listing\Controller')) {
    class Controller
    {
        public function __construct()
        { }

        public function get_view($args)
        {
            // error_log('$args : ' . print_r($args, true));
            $default_args = $this->get_default_args();
            $component_args = array_merge($default_args, $args);
            $component_args = $this->get_interpreted_args($component_args);
            $component_args = $this->boolean_conversion($component_args);

            $listing_controller = new \StarcatReview\App\Components\Listing\Controller();
            return $listing_controller->get_view($component_args);
        }

        public function get_interpreted_args($component_args)
        { 
            $component_args['items'] = 
        }
    } // END CLASS
}