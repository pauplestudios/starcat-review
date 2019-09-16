<?php

namespace HelpieReviews\App\Widget_Makers;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widget_Makers\Comparison_Widget')) {
    class Comparison_Widget
    {

        public function load()
        {
            // Shortcode
            // add_shortcode('helpie_reviews_list', array($this, 'reviews_list'));

            // WordPress Widget
            // add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }

        public function register_widget()
        {

            error_log(' register_widget: ');
            $faq_widget_args = $this->get_widget_args();

            require_once HELPIE_REVIEWS_PATH . '/includes/lib/widgetry/widget-factory.php';
            $faq_widget = new \Widgetry\Widget_Factory($faq_widget_args);
            register_widget($faq_widget);
        }

        public function register_elementor_widget()
        {
            $args = $this->get_widget_args();
            $elementor_args = $this->get_elementor_args($args);


            require_once HELPIE_REVIEWS_PATH . '/includes/lib/widgetry/elementor-widget-factory.php';
            \Elementor\Plugin::instance()->widgets_manager->register_widget_type(new \Widgetry\Elementor_Widget_Factory([], $elementor_args));
        }

        public function get_widget_args()
        {
            $args = [
                'id' => 'helpie-reviews-comparison-table',
                'name' => 'Comparison Table',
                'description' => 'Comparison Table Widget',
                'icon' => 'fa fa-th-list', // Used by Elementor only
                'categories' => ['general-elements'], // Used by Elementor only
                'model' =>  new \HelpieReviews\App\Widgets\Comparison\Model(),
                'view' => new \HelpieReviews\App\Widgets\Comparison\Controller(),
            ];

            return $args;
        }

        public function get_elementor_args($args)
        {
            $elementor_args = [];

            // Different key
            $elementor_args['name'] = $args['id'];
            $elementor_args['title'] = $args['name'];
            $elementor_args['icon'] = $args['icon'];

            // Same key
            $elementor_args['categories'] = $args['categories'];
            $elementor_args['model'] = $args['model'];
            $elementor_args['view'] = $args['view'];

            return $elementor_args;
        }


        public function get_view()
        {
            $comparison_controller = new \HelpieReviews\App\Widgets\Comparison\Controller();
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