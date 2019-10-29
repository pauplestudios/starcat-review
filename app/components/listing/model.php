<?php

namespace StarcatReview\App\Components\Listing;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Listing\Model')) {
    class Model
    {

        public function __construct()
        {
            $this->cat_posts_repo = new \StarcatReview\App\Repositories\Category_Posts_Repo();
            $this->style_config = new \StarcatReview\App\Components\Listing\Style_Config_Model();
        }

        protected function get_collection_props($args)
        {
            $post_count = $this->get_posts_count();
            $posts_per_page = 6;

            $collectionProps = [
                'title' => '',
                'posts_per_page' => $posts_per_page,
                'show_controls' => [
                    'search' => $args['show_search'],
                    'sort' => $args['show_sortBy'],
                    // 'reviews' => $args['show_num_of_reviews_filter'],
                ],
                'post_count' => $post_count,
                'total_pages' => $post_count / $posts_per_page,
                'pagination' => true,
                'columns' => $args['num_of_cols'],
                'items_display' => $args['items_display']
            ];

            if ($args['show_controls'] == false) {
                $collectionProps['show_controls'] = $args['show_controls'];
            }

            return $collectionProps;
        }

        protected function get_posts_count()
        {
            return $this->cat_posts_repo->get_last_query_post_count();
        }

        protected function get_items_props($args)
        {
            return $args;
        }
    } // END CLASS
}