<?php

namespace StarcatReview\App\Widget_Makers\Comparison;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Comparison\Widget')) {
    class Widget
    {

        public function load()
        {
            // Shortcode
            // add_shortcode('starcat_review_list', array($this, 'reviews_list'));

            // WordPress Widget
            add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }



        public function get_view()
        {
            $comparison_controller = new \StarcatReview\App\Components\Comparison\Controller();
            $post_ids = [];
            return $comparison_controller->get_view($post_ids);
        }

        protected function get_collection_props($args)
        { }

        protected function execute_methods_with_queries($args)
        {
            // $this->posts = $this->cat_posts_repo->get_category_posts($args);
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
                    'label' => __('Title', 'helpie-faq'),
                    'default' => 'Title of Comparison Table',
                    'type' => 'text',
                ],
                'max_num_of_items' => [
                    'name' => 'num_of_cols',
                    'label' => __('Maximum Number of Items', 'helpie-faq'),
                    'default' => 'two',
                    'options' => array(
                        '1' => __('1', 'helpie-faq'),
                        '2' => __('2', 'helpie-faq'),
                        '3' => __('3', 'helpie-faq'),
                    ),
                    'type' => 'select',
                ],
            );


            return $fields;
        }

        public function get_style_config()
        { }
    } // END CLASS
}
