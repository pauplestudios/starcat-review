<?php

namespace HelpieReviews\App\Widgets\Listing;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Listing\Fields_Model')) {
    class Fields_Model
    {
        public function __construct()
        {
            // $this->repo = new \HelpieFaq\Includes\Repos\Faq_Repo();
        }

        public function get_fields()
        {
            // $options = $this->repo->get_options('categories');

            $fields = array(
                'title' => [
                    'name' => 'title',
                    'label' => __('Title', 'helpie-faq'),
                    'default' => '',
                    'type' => 'text',
                ],

                // 'categories' => [
                //     'name' => 'categories',
                //     'label' => __('Categories', 'helpie-faq'),
                //     'default' => 'all',
                //     'options' => $options,
                //     'type' => 'multi-select',
                // ],
                // 'theme' => [
                //     'name' => 'theme',
                //     'label' => __('Theme', 'helpie-faq'),
                //     'default' => 'light',
                //     'options' => array(
                //         'light' => __('Light', 'helpie-faq'),
                //         'dark' => __('Dark', 'helpie-faq'),
                //     ),
                //     'type' => 'select',
                // ],
            );


            return $fields;
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


        // OTHER
    } // END CLASS
}