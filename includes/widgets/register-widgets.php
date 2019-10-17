<?php

namespace HelpieReviews\Includes\Widgets;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Widgets\Register_Widgets')) {
    class Register_Widgets
    {
        public function load()
        {
            add_action('widgets_init', function () {
                $widget_args = array(
                    'id' => 'hrp-listing',
                    'name' => 'Review Listing',
                    'description' => 'Review Listing Widget',
                    'model' =>  new \HelpieReviews\App\Components\Listing\Model(),
                    'view' => new \HelpieReviews\App\Components\Listing\Controller(),
                );

                require_once STARCAT_REVIEW_PATH . '/lib/widgetry/widget-factory.php';
                $widget = new \Widgetry\Widget_Factory($widget_args);
                register_widget($widget);
            });
        }
    } // END CLASS
}
