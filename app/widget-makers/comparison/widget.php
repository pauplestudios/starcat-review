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
            // add_action('widgets_init', [$this, 'register_widget']);

            // Elementor Widget
            add_action('elementor/widgets/widgets_registered', [$this, 'register_elementor_widget']);
        }



        public function get_view()
        {
            $comparison_controller = new \StarcatReview\App\Components\Comparison\Controller();

            $post_ids = [176, 174, 147];

            $args = array(
                'post__in' => $post_ids,
                'post_type' => SCR_POST_TYPE,
            );

            $posts = get_posts($args);

            $get_post_props = $this->get_default_post_props($posts);

            //view type (its comes to static/dynamic)
            $ct_args = array(
                'posts' => count($get_post_props) ? $get_post_props : [],
                'view_type' => 'static'
            );

            return $comparison_controller->get_view($ct_args);
        }

        protected function get_default_post_props($args)
        {
            $default_props = array();
            if (isset($args)) {
                foreach ($args as $post) {
                    $post_infos = array();
                    $post_infos['ID'] = $post->ID;
                    $post_infos['title'] = $post->post_title;
                    $post_infos['featured_image_url'] = get_the_post_thumbnail_url($post->ID);

                    // get review ratings from function.php
                    $get_scr_get_user_reviews = scr_get_user_reviews($post->ID);

                    // get post stat list 
                    $get_stat_list  = $this->get_default_stat_list($get_scr_get_user_reviews);

                    // get post overall reatings
                    $get_overall_stats = scr_get_overall_rating($post->ID);
                    $post_infos['stats'] = $get_stat_list;
                    $post_infos['overall_ratings'] = $get_overall_stats;
                    $default_props[$post->ID] = $post_infos;
                }
            }

            return $default_props;
        }

        protected function get_default_stat_list($args)
        {
            $stats = array();
            if (count($args) > 0) {
                foreach ($args  as $post_review) {
                    $reviews = isset($post_review->reviews) ? $post_review->reviews : [];
                    if (isset($reviews) && count($reviews) > 0) {
                        $stats = $reviews['stats'];
                    }
                }
            }
            return $stats;
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
                    'label' => __('Title', 'starcat-review'),
                    'default' => 'Title of Comparison Table',
                    'type' => 'text',
                ],
                'max_num_of_items' => [
                    'name' => 'num_of_cols',
                    'label' => __('Maximum Number of Items', 'starcat-review'),
                    'default' => 'two',
                    'options' => array(
                        '1' => __('1', 'starcat-review'),
                        '2' => __('2', 'starcat-review'),
                        '3' => __('3', 'starcat-review'),
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
