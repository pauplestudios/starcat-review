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

        protected function get_collection_props($args)
        {
            $collectionProps = [
                'title' => 'Reviews of Category: xxx',
                'posts_per_page' => 6,
                // 'show_controls' => false,
                'show_controls' => [
                    'search' => true,
                    'sort' => true,
                    'reviews' => true,
                    'verified' => false
                ],
                'pagination' => true,
                'columns' => 2,
                'items_display' => ['title', 'content', 'link']
            ];

            $collectionProps = array_merge($collectionProps, $args);

            return $collectionProps;
        }

        protected function get_items_props($args)
        {
            return $this->cat_posts_repo->get_category_posts($args);
        }

        public function get_default_args()
        {
            $default_args = $this->fields_model->get_default_args();

            return $default_args;
        }
    } // END CLASS
}