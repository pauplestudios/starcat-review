<?php

namespace StarcatReview\Includes\Widgets;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Widgets\Register_Widgets')) {
    class Register_Widgets
    {
        public function load()
        {
            add_action('widgets_init', function () {
                $widget_args = array(
                    'id' => 'hrp-listing',
                    'name' => 'Review Listing',
                    'description' => 'Review Listing Widget',
                    'model' =>  new \StarcatReview\App\Components\Listing\Model(),
                    'view' => new \StarcatReview\App\Components\Listing\Controller(),
                );

                require_once SCR_PATH . '/lib/widgetry/widget-factory.php';
                $widget = new \Widgetry\Widget_Factory($widget_args);
                register_widget($widget);
            });
        }
    } // END CLASS
}
