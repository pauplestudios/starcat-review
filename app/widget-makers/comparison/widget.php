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



        public function get_view($args)
        {


            $default_args = $this->get_default_args();
            $component_args = array_merge($default_args, $args);
            $component_args = $this->get_interpreted_args($component_args);
            $component_args = $this->boolean_conversion($component_args);


            // $post_ids = [176, 174, 147];

            // $args = array(
            //     'post__in' => $post_ids,
            //     'post_type' => SCR_POST_TYPE,
            // );

            // $posts = get_posts($args);

            // $get_post_props = $this->get_default_post_props($posts);

            //view type (its comes to static/dynamic)
            // $ct_args = array(
            //     'posts' => count($get_post_props) ? $get_post_props : [],
            //     'view_type' => 'dynamic'
            // );
            $comparison_controller = new \StarcatReview\App\Components\Comparison\Controller();
            return $comparison_controller->get_view($component_args);
        }

        protected function get_interpreted_args($args)
        {
            $posts = !isset($args['posts']) ? $this->get_default_posts() : $args['posts'];
            $component_args['posts'] = $this->get_default_post_props($args, $posts);
            return $component_args;
        }

        protected function get_default_posts()
        {
            $posts = [];
            // recently add 3 posts
            // $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            // $args = array(
            //     'posts_per_page' => 3,
            //     'post_type' => SCR_POST_TYPE,
            //     'paged' => $paged,
            // );

            // $query = new \WP_Query($args);

            // if ($query->have_posts()) {
            //     while ($query->have_posts()) {
            //         // Optionally, pick parts of the post and create a custom collection.
            //         $query->the_post();
            //         $posts[] = get_post();
            //     }
            //     wp_reset_postdata();
            // }

            $post_ids = [176, 174, 147];

            $args = array(
                'post__in' => $post_ids,
                'post_type' => SCR_POST_TYPE,
            );
            $posts = get_posts($args);

            return $posts;
        }

        protected function get_default_post_props($args, $posts)
        {
            $default_posts = array();
            if (isset($posts)) {
                foreach ($posts as $post) {
                    $post_infos = array();
                    $post_infos['ID'] = $post->ID;
                    $post_infos['title'] = $post->post_title;
                    $post_featured_image = get_the_post_thumbnail_url($post->ID);
                    $post_infos['featured_image_url'] = $post_featured_image != "" ? $post_featured_image : SCR_URL . 'includes/assets/img/dummy-review.jpg';
                    $post_infos['url']   = get_post_permalink($post->ID);
                    // get review ratings from function.php
                    $get_scr_get_user_reviews = scr_get_user_reviews($post->ID);

                    // get post stat list 
                    $get_stat_list  = $this->get_default_stat_list($get_scr_get_user_reviews);

                    // get post overall reatings
                    $get_overall_stats = scr_get_overall_rating($post->ID);
                    $post_infos['stats'] = $get_stat_list;
                    $post_infos['overall_ratings'] = $get_overall_stats;
                    $default_posts[$post->ID] = $post_infos;
                }
            }

            return $default_posts;
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

        /* PROTECTED METHODS */
        protected function boolean_conversion($args)
        {
            foreach ($args as $key => $arg) {

                if ($arg == 'on') {
                    $args[$key] = true;
                } else if ($arg == 'off') {
                    $args[$key] = false;
                }
            }

            return $args;
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
                'show_type' => [
                    'name' => 'show_type',
                    'label' => __('Show Compate Table Type', 'starcat-review'),
                    'default' => 'static',
                    'options' => array(
                        'static' => __('Static', 'starcat-review'),
                        'dynamic' => __('Dynamic', 'starcat-review')
                    ),
                    'type' => 'select',
                ]
            );


            return $fields;
        }

        public function get_style_config()
        { }
    } // END CLASS
}
