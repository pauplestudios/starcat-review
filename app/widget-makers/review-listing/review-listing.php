<?php

namespace HelpieReviews\App\Widget_Makers\Review_Listing;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widget_Makers\Review_Listing\Review_Listing')) {
    class Review_Listing
    {
        public function load()
        {
            // Shortcode
            add_shortcode('helpie_reviews_list', array($this, 'get_view'));

            // WordPress Widget
            add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }

        public function get_view()
        {
            $listing_controller = new \HelpieReviews\App\Widgets\Listing\Controller();
            $args = [];
            return $listing_controller->get_view($args);
        }

        public function register_widget()
        {

            // error_log(' register_widget: ');
            $widget_args = $this->get_widget_args();

            require_once HELPIE_REVIEWS_PATH . '/includes/lib/widgetry/widget-factory.php';
            $widget = new \Widgetry\Widget_Factory($widget_args);
            register_widget($widget);
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

        public function propsRegister()
        {

            $register = [
                'title' => [
                    'settings' => ''
                ],
                'show_controls' => [
                    'settings' => 'cp_show_controls'
                ],
                'show_search' => [
                    'settings' => 'cp_show_search'
                ],
                'show_sortBy' => [
                    'settings' => 'show_sortBy'
                ],
                'show_num_of_reviews_filter' => [
                    'settings' => 'cp_show_num_of_reviews_filter'
                ],

                'default_sortBy' => [
                    'settings' => 'cp_default_sortBy'
                ],
                'listing_num_of_cols' => [
                    'settings' => 'cp_listing_num_of_cols'
                ],

            ];
        }
    } // END CLASS
}
