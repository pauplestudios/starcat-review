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

        public function get_category_options($show_all = false)
        {
            $category_options = [];
            $terms = get_terms('helpie_reviews_category', array(
                'hide_empty' => false,
            ));

            foreach ($terms as $term) {
                if (!isset($term->term_id)) {
                    continue;
                }
                $category_options[$term->term_id] = $term->name;
            }

            if ($show_all == true) {
                $category_options = array('all' => 'All') + $category_options;
            }
            // error_log('Visible Terms : ' . print_r($category_options, true));

            return $category_options;
        }

        public function get_fields()
        {
            // $options = $this->repo->get_options('categories');
            $categories_options = $this->get_category_options(true);  // $show_all = true

            $fields = array(
                'title' => [
                    'name' => 'title',
                    'label' => __('Title', 'helpie-faq'),
                    'default' => 'Title of Listing',
                    'type' => 'text',
                ],
                'show_controls' => [
                    'name' => 'show_controls',
                    'label' => __('Show Controls', 'helpie-faq'),
                    'default' => 'on',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],
                'show_search' => [
                    'name' => 'show_search',
                    'label' => __('Show Search', 'helpie-faq'),
                    'default' => 'off',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],
                'show_sortBy' => [
                    'name' => 'show_sortBy',
                    'label' => __('Show SortBy', 'helpie-faq'),
                    'default' => 'off',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],
                'show_num_of_reviews_filter' => [
                    'name' => 'show_num_of_reviews_filter',
                    'label' => __('Show Number of Reviews Filter', 'helpie-faq'),
                    'default' => 'off',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],

                'default_sortBy' => [
                    'name' => 'default_sortBy',
                    'label' => __('Default SortBy', 'helpie-faq'),
                    'default' => 'off',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],

                'num_of_cols' => [
                    'name' => 'num_of_cols',
                    'label' => __('Number of Columns', 'helpie-faq'),
                    'default' => 'off',
                    'options' => array(
                        'on' => __('On', 'helpie-faq'),
                        'off' => __('Off', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],

                'categories' => [
                    'name' => 'categories',
                    'label' => __('Categories', 'helpie-faq'),
                    'default' => 'all',
                    'options' => $categories_options,
                    'type' => 'multi-select',
                ],
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