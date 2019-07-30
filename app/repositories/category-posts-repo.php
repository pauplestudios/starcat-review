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
    } // END CLASS
}