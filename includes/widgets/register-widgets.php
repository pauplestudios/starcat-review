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
            // error_log('widgets->load() : ');
            add_action('widgets_init', function () {
                $widget_args = array(
                    'id' => 'scr-listing',
                    'name' => 'Review Listing',
                    'description' => 'Review Listing Widget',
                    'model' =>  new \StarcatReview\App\Widget_Makers\Review_Listing\Controller(),
                    'view' => new \StarcatReview\App\Widget_Makers\Review_Listing\Controller(),
                );

                $url = SCR_PATH . '/includes/lib/widgetry/widget-factory.php';
                require_once $url;
                $widget = new \Widgetry\Widget_Factory($widget_args);
                register_widget($widget);
            });

            add_action('widgets_init', function () {
                $widget_args = array(
                    'id' => 'scr-comparison-table',
                    'name' => 'Comparison Table',
                    'description' => 'Comparison Table Widget',
                    'model' =>  new \StarcatReview\App\Widget_Makers\Comparison\Widget(),
                    'view' => new \StarcatReview\App\Widget_Makers\Comparison\Widget(),
                );

                $url = SCR_PATH . '/includes/lib/widgetry/widget-factory.php';
                require_once $url;
                $widget = new \Widgetry\Widget_Factory($widget_args);
                register_widget($widget);
            });
        }
    } // END CLASS
}