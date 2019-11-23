<?php

namespace StarcatReview\App\Widget_Makers\Toc;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Toc\Widget')) {

    class Widget
    {
        public function __construct()
        {
            // 
        }

        public function get_view()
        {
            $toc_controller = new \StarcatReview\App\Components\Toc\Controller();
            return $toc_controller->get_view();
        }

        public function get_default_args()
        {
            $args = array();

            // Get Default Values from GET - FIELDS
            $fields = $this->get_fields();
            foreach ($fields as $key => $field) {
                $args[$key] = $field['default'];
            }

            return $args;
        }

        public function get_fields()
        {

            $fields = array(
                'title' => [
                    'name' => 'title',
                    'label' => __('Title', 'starcat-review'),
                    'default' => 'Table of Contents',
                    'type' => 'text',
                ]
            );


            return $fields;
        }
    }
}
