<?php

namespace StarcatReview\App\Widget_Makers\Review_Listing;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Review_Listing\Review_Listing')) {
    class Review_Listing
    {
        public function load()
        {
            // Shortcode
            add_shortcode('starcat_review_list', array($this, 'get_view'));

            // WordPress Widget
            add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }

        public function get_view($args)
        {
            $posts = !isset($args['posts']) ? [] : $args['posts'];
            $terms = !isset($args['terms']) ? [] : $args['terms'];

            /* Stat HTML */
            $posts = $this->get_combine_rating($posts);

            // error_log('get_view $args : ' . print_r($args, true));

            $component_args = [
                'posts' => $posts,
                'terms' => $terms,
                'show_controls' => $args['show_controls'],
                'show_search' => isset($args['show_search']) ? $args['show_search'] : '',
                'show_sortBy' => isset($args['show_sortBy']) ? $args['show_sortBy'] : '',
                // 'show_num_of_reviews_filter' => isset($args['show_num_of_reviews_filter']) ? $args['show_num_of_reviews_filter'] : '',
                'num_of_cols' => $args['num_of_cols'],
                'items_display' => isset($args['items_display']) ? $args['items_display'] : ['title', 'content', 'link'],
                'pagination' => isset($args['pagination']) ? $args['pagination'] : true
            ];

            // error_log('$component_args : ' . print_r($component_args, true));

            $listing_controller = new \StarcatReview\App\Components\Listing\Controller();
            return $listing_controller->get_view($component_args);
        }

        public function register_widget()
        {

            // error_log(' register_widget: ');
            $widget_args = $this->get_widget_args();

            require_once SCR_PATH . '/includes/lib/widgetry/widget-factory.php';
            $widget = new \Widgetry\Widget_Factory($widget_args);
            register_widget($widget);
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

        protected function get_combine_rating($posts)
        {
            foreach ($posts as $key => $post) {
                $args = SCR_Getter::get_stat_default_args();
                $args['post_id'] = $post->ID;
                $args['combination'] = 'overall_combine';
                $args['items'] = get_post_meta($post->ID, '_scr_post_options', true);
                $comments = $this->get_comments_list($post->ID);
                if (isset($comments) || !empty($comments)) {
                    $args['items']['comments-list'] = $comments;
                }
                $stats_controller = new \StarcatReview\App\Components\Stats\Controller($args);
                $post->stat_html = $stats_controller->get_view();
            }

            return $posts;
        }

        protected function get_comments_list($post_id)
        {
            $args = [
                'post_id' => $post_id,
                'type' => SCR_POST_TYPE
            ];

            $comments = get_comments($args);

            foreach ($comments as $comment) {
                $comment->reviews = get_comment_meta($comment->comment_ID, 'scr_user_review_props', true);
            }

            return $comments;
        }
    } // END CLASS
}
