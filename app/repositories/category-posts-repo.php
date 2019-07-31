<?php

namespace HelpieReviews\App\Repositories;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Repositories\Category_Posts_Repo')) {
    class Category_Posts_Repo
    {

        public function get_category_posts($args)
        {

            $args = $this->get_args();

            $posts = [];

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