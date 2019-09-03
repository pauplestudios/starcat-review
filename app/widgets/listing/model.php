<?php

namespace HelpieReviews\App\Widgets\Listing;

use \HelpieReviews\App\Abstracts\Widget_Model_Interface as Widget_Model_Interface;
use \HelpieReviews\App\Abstracts\Widget_Model as Widget_Model;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Listing\Model')) {
    class Model extends Widget_Model implements Widget_Model_Interface
    {

        public function __construct()
        {
            $this->fields_model = new \HelpieReviews\App\Widgets\Listing\Fields_Model();
            $this->cat_posts_repo = new \HelpieReviews\App\Repositories\Category_Posts_Repo();
            parent::__construct($this->fields_model);
            $this->style_config = new \HelpieReviews\App\Widgets\Listing\Style_Config_Model();
            // $this->fields_model = $fields_model;
        }

        protected function execute_methods_with_queries($args)
        {
            $args['term_id'] = $args['categories'][0];
            $args['term_id'] = 42;
            $this->posts = $this->cat_posts_repo->get_category_posts($args);
        }

        protected function get_collection_props($args)
        {
            error_log('$args : ' . print_r($args, true));
            // error_log('Model -> get_collection_props');
            $post_count = $this->get_posts_count();
            $posts_per_page = 6;

            // error_log('post_count : ' . $post_count);
            $collectionProps = [
                'title' => 'Reviews of Category: xxx',
                'posts_per_page' => $posts_per_page,
                // 'show_controls' => false,
                'show_controls' => [
                    'search' => true,
                    'sort' => true,
                    'reviews' => true,
                    'verified' => false
                ],
                'post_count' => $post_count,
                'total_pages' => $post_count / $posts_per_page,
                'pagination' => true,
                'columns' => 2,
                'items_display' => ['title', 'content', 'link']
            ];

            $collectionProps = array_merge($collectionProps, $args);

            return $collectionProps;
        }

        protected function get_posts_count()
        {
            return $this->cat_posts_repo->get_last_query_post_count();
        }

        protected function get_items_props($args)
        {
            // error_log('Model -> get_items_props');
            return $this->posts;
        }

        public function get_default_args()
        {
            $default_args = $this->fields_model->get_default_args();

            return $default_args;
        }
    } // END CLASS
}