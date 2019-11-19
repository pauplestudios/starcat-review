<?php

namespace StarcatReview\App\Widget_Makers\Category_Listing;

// use \StarcatReview\App\Abstracts\Widget_Model_Interface as Widget_Model_Interface;
// use \StarcatReview\App\Abstracts\Widget_Model as Widget_Model;
use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Category_Listing\Controller')) {
    class Controller
    {
        public function __construct()
        { }

        public function get_view($args)
        {
            $component_args = [];
            // error_log('$args : ' . print_r($args, true));
            // $default_args = $this->get_default_args();
            // $component_args = array_merge($default_args, $args);
            $component_args = $this->get_interpreted_args($args);
            // $component_args = $this->boolean_conversion($component_args);

            $listing_controller = new \StarcatReview\App\Components\Listing_New\Controller();
            return $listing_controller->get_view($component_args);
        }

        public function get_interpreted_args($component_args)
        {
            $component_args = $this->get_category_listing_args($component_args);

            return $component_args;
        }

        protected function get_category_listing_args($component_args)
        {

            $args = $component_args;
            $terms = $args['terms'];

            $items = [];
            foreach ($terms as $key => $term) {
                $items[] = [
                    'title' => $term->name,
                    'featured_image' => SCR_URL . 'includes/assets/img/dummy-review.jpg',
                    'content' => $term->description,
                    'pre_content_html' => '<div>Pre Content HTML</div>',
                    'url' =>  get_term_link($term),
                    'columns' => $args['num_of_cols'],
                    'items_display' => $args['items_display'],
                ];
            }

            $args['items'] = $items;
            return $args;
        }
    } // END CLASS
}