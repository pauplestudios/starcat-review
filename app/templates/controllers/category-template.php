<?php

namespace StarcatReview\App\Templates\Controllers;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Templates\Controllers\Category_Template')) {
    class Category_Template
    {
        public function __construct()
        {
            $this->listing = new \StarcatReview\App\Widget_Makers\Review_Listing\Controller();
        }

        public function get_view($term)
        {
            $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
            $props = $this->get_props($term);


            $html = '<div id="primary">';

            // $html .=  $breadcrumb->get_view();
            $html .= '<section class="scr-archive-description">';
            $html .= '<h1 class="term-name">Topic:' . $term->name . ' </h1>';
            $html .= '<div class="term-description">' . $term->description . '</div>';
            $html .= '</section>';
            $html .= '<main id="main" class="site-main" role="main">';
            $html .= '<div class="scr-category-page-content-area">';
            $html .= $this->get_category_post_listing($props);
            // $html .= $this->get_comparison_table($props);
            $html .= "</div>";
            $html .= "</main>";
            $html .= "</div>"; // #primary
            return $html;
        }

        public function get_category_post_listing($props)
        {
            $posts = $props['posts'];

            $html = '<div class="scr-category-page-content-area">';

            if (isset($posts) && !empty($posts)) {
                $html .= $this->listing->get_view($props);
            } else {
                $html .= "No Reviews Found";
            }

            $html .= "</div>";

            return $html;
        }

        // public function get_comparison_table()
        // {
        //     $post_ids = [131, 123, 119];
        //     $comparison_controller = new \StarcatReview\App\Components\Comparison\Controller();
        //     return $comparison_controller->get_view($post_ids);
        // }

        protected function get_props($term)
        {
            $args = [
                'posts_per_page' => SCR_Getter::get('cp_posts_per_page'),
                'show_controls' => SCR_Getter::get('cp_controls'),
                'show_search' => SCR_Getter::get('cp_search'),
                'show_sortBy' => SCR_Getter::get('cp_sortBy'),
                // 'show_num_of_reviews_filter' => SCR_Getter::get('cp_num_of_reviews_filter'),
                'num_of_cols' => SCR_Getter::get('cp_num_of_cols'),
            ];

            $query_args = $this->get_args($term);
            $args['posts'] = $this->get_category_posts($query_args);

            return $args;
        }

        private function get_category_posts($args)
        {
            $posts    = [];
            $query = new \WP_Query($args);

            if ($query->have_posts()) {
                while ($query->have_posts()) {
                    // Optionally, pick parts of the post and create a custom collection.
                    $query->the_post();
                    $posts[] = get_post();
                }
                wp_reset_postdata();
            }

            return $posts;
        }


        private function get_args($term)
        {
            $sortBy = SCR_Getter::get('cp_default_sortBy');
            // the query to set the posts per page to 3
            $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            $args = array(
                'posts_per_page' => -1,
                'post_type' => SCR_POST_TYPE,
                'paged' => $paged,
                'tax_query' => array(
                    array(
                        'taxonomy' => SCR_CATEGORY,
                        'field'    => 'id',
                        'terms'    => $term->term_id,
                    ),
                )
            );

            if ($sortBy == 'alphabetical_asc') {
                $args['orderby'] = "title";
                $args['order'] = "ASC";
            } else if ($sortBy == 'alphabetical_desc') {
                $args['orderby'] = "title";
                $args['order'] = "DESC";
            } else if ($sortBy == 'recent') {
                $args['orderby'] = "date";
                $args['order'] = "DESC";
            } else if ($sortBy == 'updated') {
                $args['orderby'] = "modified";
                $args['order'] = "DESC";
            } else if ($sortBy == 'num_of_reviews') {
                // $args['orderby'] = "modified";
                // $args['order'] = "DESC";
            }


            return $args;
        }
    } // END CLASS

}