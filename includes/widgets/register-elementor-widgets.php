<?php

namespace StarcatReview\Includes\Widgets;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Widgets\Register_Elementor_Widgets')) {
    class Register_Elementor_Widgets
    {
        public function load()
        {
            add_action('elementor/widgets/widgets_registered', [$this, 'register']);
        }

        public function register()
        {
            $widget_args = array(
                'name' => 'hrp-listing',
                'title' => 'Review Listing',
                'icon' => 'fa fa-th-list',
                'categories' => ['general-elements'],
                'model' =>  new \StarcatReview\App\Components\Listing\Model(),
                'view' => new \StarcatReview\App\Components\Listing\Controller(),
            );


            require_once SCR_PATH . '/lib/widgetry/elementor-widget-factory.php';


            \Elementor\Plugin::instance()->widgets_manager->register_widget_type(new \Widgetry\Elementor_Widget_Factory([], $widget_args));
        }
    }
}
