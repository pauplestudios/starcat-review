<?php

namespace HelpieReviews\Includes\Templates\Controllers;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Controllers\Category_Template_Controller')) {
    class Category_Template_Controller
    {
        public function __construct()
        { }

        public function get_view()
        {
            $args = $this->get_args();
            $posts = $this->get_category_posts($args);

            $html = '';
            $html .= $this->get_category_post_listing($posts);
            $html .= $this->get_comparison_table();

            return $html;
        }

        public function get_category_post_listing($posts)
        {
            $html = '';

            if (isset($posts) && !empty($posts)) {
                $listing_controller = new \HelpieReviews\App\Widgets\Listing\Controller();
                $html .= $listing_controller->get_view($posts);
            } else {
                $html .= "No Reviews Found";
            }

            return $html;
        }


        public function get_comparison_table()
        {
            $post_ids = [131, 123, 119];
            $comparison_controller = new \HelpieReviews\App\Widgets\Comparison\Controller();
            return $comparison_controller->get_view($post_ids);
        }

        public function get_category_posts($args)
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


        public function get_args()
        {
            $term = get_queried_object();
            // the query to set the posts per page to 3
            $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            $args = array(
                'posts_per_page' => -1,
                'post_type' => HELPIE_REVIEWS_POST_TYPE,
                'paged' => $paged,
                'tax_query' => array(
                    array(
                        'taxonomy' => 'helpie_reviews_category',
                        'field'    => 'id',
                        'terms'    => $term->term_id,
                    ),
                )
            );

            return $args;
        }
    } // END CLASS

}