<?php

namespace StarcatReview\App\Widget_Makers\Review_Listing;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Review_Listing\Loader')) {
    class Loader
    {
        public function load()
        {
            // Shortcode
            add_shortcode('starcat_review_list', array($this, 'get_view'));

            // WordPress Widget
            // add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }

        public function get_view()
        {
            $comparison_controller = new \StarcatReview\App\Components\Listing\Controller();
            $args = [];
            return $comparison_controller->get_view($args);
        }

        public function register_widget()
        {

            // error_log(' register_widget: ');
            $scr_widget_args = $this->get_widget_args();

            require_once SCR_PATH . '/includes/lib/widgetry/widget-factory.php';
            $scr_widget = new \Widgetry\Widget_Factory($scr_widget_args);
            register_widget($scr_widget);
        }


        public function register_elementor_widget()
        {
            $args = $this->get_widget_args();
            $elementor_args = $this->get_elementor_args($args);


            require_once SCR_PATH . '/includes/lib/widgetry/elementor-widget-factory.php';
            \Elementor\Plugin::instance()->widgets_manager->register_widget_type(new \Widgetry\Elementor_Widget_Factory([], $elementor_args));
        }

        public function get_widget_args()
        {
            $args = [
                'id' => 'starcat-review-listing',
                'name' => 'Starcat Review Listing',
                'description' => 'Starcat Review Listing Widget',
                'icon' => 'fa fa-th-list', // Used by Elementor only
                'categories' => ['general-elements'], // Used by Elementor only
                'model' =>  new \StarcatReview\App\Components\Listing\Model(),
                'view' => new \StarcatReview\App\Components\Listing\Controller(),
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
    } // END CLASS
}