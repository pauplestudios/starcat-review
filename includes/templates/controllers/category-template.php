<?php

namespace HelpieReviews\Includes\Templates\Controllers;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Controllers\Category_Template')) {
    class Category_Template
    {
        public function __construct()
        {
            $this->listing = new \HelpieReviews\App\Widget_Makers\Review_Listing\Review_Listing();
        }

        public function get_view($term)
        {
            $props = $this->get_props($term);
            $html = '';
            $html = '<div class="hrp-category-page-content-area">';
            $html .= $this->get_category_post_listing($props);
            // $html .= $this->get_comparison_table($props);
            $html .= "</div>";
            return $html;
        }

        public function get_category_post_listing($props)
        {
            $posts = $props['posts'];

            $html = '<div class="hrp-category-page-content-area">';

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
        //     $comparison_controller = new \HelpieReviews\App\Components\Comparison\Controller();
        //     return $comparison_controller->get_view($post_ids);
        // }

        protected function get_props($term)
        {
            $args = [
                'posts' => $this->get_category_posts($this->get_args($term)),
                'show_controls' => HRP_Getter::get('cp_controls'),
                'show_search' => HRP_Getter::get('cp_search'),
                'show_sortBy' => HRP_Getter::get('cp_sortBy'),
                'show_num_of_reviews_filter' => HRP_Getter::get('cp_num_of_reviews_filter'),
                'num_of_cols' => HRP_Getter::get('cp_num_of_cols'),
            ];

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
            // the query to set the posts per page to 3
            $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            $args = array(
                'posts_per_page' => -1,
                'post_type' => HELPIE_REVIEWS_POST_TYPE,
                'paged' => $paged,
                'tax_query' => array(
                    array(
                        'taxonomy' => HELPIE_REVIEWS_CATEGORY,
                        'field'    => 'id',
                        'terms'    => $term->term_id,
                    ),
                )
            );

            return $args;
        }
    } // END CLASS

}
