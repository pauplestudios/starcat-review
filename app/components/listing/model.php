<?php

namespace HelpieReviews\App\Components\Listing;

use \HelpieReviews\App\Abstracts\Widget_Model_Interface as Widget_Model_Interface;
use \HelpieReviews\App\Abstracts\Widget_Model as Widget_Model;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Listing\Model')) {
    class Model extends Widget_Model implements Widget_Model_Interface
    {

        public function __construct()
        {
            $this->fields_model = new \HelpieReviews\App\Components\Listing\Fields_Model();
            $this->cat_posts_repo = new \HelpieReviews\App\Repositories\Category_Posts_Repo();
            parent::__construct($this->fields_model);
            $this->style_config = new \HelpieReviews\App\Components\Listing\Style_Config_Model();
            // $this->fields_model = $fields_model;
        }

        // protected function execute_methods_with_queries($args)
        // {
        //     $args['term_id'] = $args['categories'][0];
        //     error_log('$args[term_id] : ' . $args['term_id']);
        //     // $args['term_id'] = 42;
        //     $this->posts = $this->cat_posts_repo->get_category_posts($args);
        // }

        protected function get_collection_props($args)
        {
            // error_log('$args : ' . print_r($args, true));
            // error_log('Model -> get_collection_props');
            $post_count = $this->get_posts_count();
            // error_log('$post_count : ' . $post_count);
            $posts_per_page = 6;

            // error_log('post_count : ' . $post_count);
            $collectionProps = [
                'title' => '',
                'posts_per_page' => $posts_per_page,
                // 'show_controls' => false,
                'show_controls' => [
                    'search' => $args['show_search'],
                    'sort' => $args['show_sortBy'],
                    'reviews' => $args['show_num_of_reviews_filter'],
                    // 'verified' => $args['show_sortBy'],
                ],
                'post_count' => $post_count,
                'total_pages' => $post_count / $posts_per_page,
                'pagination' => true,
                'columns' => $args['num_of_cols'],
                'items_display' => ['title', 'content', 'link']
            ];

            if ($args['show_controls'] == false) {
                $collectionProps['show_controls'] = $args['show_controls'];
            }

            // $collectionProps = array_merge($collectionProps, $args);
            // error_log('$collectionProps : ' . print_r($collectionProps, true));

            return $collectionProps;
        }

        protected function get_posts_count()
        {
            return $this->cat_posts_repo->get_last_query_post_count();
        }

        protected function get_items_props($args)
        {
            // error_log('Model -> get_items_props');
            return $args['posts'];
        }

        public function get_default_args()
        {
            $default_args = $this->fields_model->get_default_args();

            return $default_args;
        }
    } // END CLASS
}