<?php

namespace StarcatReview\App\Components\Listing;

use \StarcatReview\App\Abstracts\Widget_Model_Interface as Widget_Model_Interface;
use \StarcatReview\App\Abstracts\Widget_Model as Widget_Model;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Listing\Model')) {
    class Model extends Widget_Model implements Widget_Model_Interface
    {

        public function __construct()
        {
            $this->fields_model = new \StarcatReview\App\Components\Listing\Fields_Model();
            $this->cat_posts_repo = new \StarcatReview\App\Repositories\Category_Posts_Repo();
            parent::__construct($this->fields_model);
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

        public function get_default_args()
        {
            $default_args = $this->fields_model->get_default_args();

            return $default_args;
        }
    } // END CLASS
}
