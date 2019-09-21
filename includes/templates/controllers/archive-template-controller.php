<?php

namespace HelpieReviews\Includes\Templates\Controllers;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Controllers\Archive_Template_Controller')) {
    class Archive_Template_Controller
    {
        public function __construct()
        { }

        public function get_view()
        {


            $html = '';
            $html .= $this->get_post_listing();


            $terms = get_terms('helpie_reviews_category', array('parent' => 0, 'hide_empty' => false));
            $cats_list = new \HelpieReviews\App\Views\Review_Categories();
            $html .= $cats_list->get_view($terms);

            return $html;
        }

        public function get_post_listing()
        {
            $args = $this->get_args();
            $posts = $this->get_posts($args);

            $html = '<div class="hrp-category-page-content-area">';

            if (isset($posts) && !empty($posts)) {
                $args = $this->get_listing_args();
                $listing_controller = new \HelpieReviews\App\Widgets\Listing\Controller();
                $html .= $listing_controller->get_view($args);
            } else {
                $html .= "No Reviews Found";
            }

            $html .= "</div>";

            return $html;
        }

        public function get_listing_args()
        {
            $term = get_queried_object();

            $args = [
                'term_id' => $term->term_id
            ];


            return $args;
        }


        public function get_posts($args)
        {
            $posts    = [];

            $query = new \WP_Query($args);
            // error_log('get_category_posts $args : ' . print_r($args, true));

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

            );

            return $args;
        }
    } // END CLASS

}