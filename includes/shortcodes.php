<?php

namespace StarcatReview\Includes;

use \StarcatReview\App\Repositories\Category_Posts_Repo as Category_Posts_Repo;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Shortcodes')) {
    class Shortcodes
    {

        public function __construct()
        {
            // error_log('shortcodes : ');
            add_shortcode('starcat_review_list', array($this, 'reviews_list'));
            add_shortcode('starcat_review_comparison_table', array($this, 'comparison_table'));
        }

        public function comparison_table()
        {
            error_log('comparison_table : ');
            $comparison_table_widget = new \StarcatReview\App\Widget_Makers\Comparison\Widget();
            return $comparison_table_widget->get_view();
        }
        public function reviews_list()
        {
            $args['term_id'] = 46;
            $category_posts_repo = new Category_Posts_Repo();
            $posts = $category_posts_repo->get_category_posts($args);

            $widget_args = [
                'terms' => 46,
                'posts' => $posts
            ];

            $review_listing_widget = new \StarcatReview\App\Widget_Makers\Review_Listing\Review_Listing();
            return $review_listing_widget->get_view($widget_args);
        }
    } // END CLASS

}