<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Widget_Controller')) {
    class Widget_Controller
    {

        public function __construct()
        { }

        public function load()
        {
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);

            add_action('widgets_init', [$this, 'register_widget']);

            add_shortcode('helpie_reviews_list', array($this, 'reviews_list'));
        }

        public function get_args()
        {
            $args = [
                'id' => 'helpie-reviews-listing',
                'name' => 'Helpie Reviews Listing',
                'description' => 'Helpie Reviews Listing Widget',
                'icon' => 'fa fa-th-list', // Used by Elementor only
                'categories' => ['general-elements'], // Used by Elementor only
                'model' =>  new \HelpieReviews\App\Widgets\Listing\Model(),
                'view' => new \HelpieReviews\App\Widgets\Listing\Controller(),
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

        public function register_widget()
        {
            $faq_widget_args = $this->get_args();

            require_once HELPIE_REVIEWS_PATH . '/includes/lib/widgetry/widget-factory.php';
            $faq_widget = new \Widgetry\Widget_Factory($faq_widget_args);
            register_widget($faq_widget);
        }


        public function register_elementor_widget()
        {
            $args = $this->get_args();
            $elementor_args = $this->get_elementor_args($args);


            require_once HELPIE_REVIEWS_PATH . '/includes/lib/widgetry/elementor-widget-factory.php';
            \Elementor\Plugin::instance()->widgets_manager->register_widget_type(new \Widgetry\Elementor_Widget_Factory([], $elementor_args));
        }
    } // END CLASS

}