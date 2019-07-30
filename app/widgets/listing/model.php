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

        public function __construct($fields_model)
        {
            $this->cat_posts_repo = new \HelpieReviews\App\Repositories\Category_Posts_Repo();
            parent::__construct($fields_model);
            $this->style_config = new \HelpieReviews\App\Widgets\Listing\Style_Config_Model();
            // $this->fields_model = $fields_model;
        }

        protected function get_items_props($args)
        {
            $args = $this->get_args();
            return $this->cat_posts_repo->get_category_posts($args);
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

        protected function get_collection_props($args)
        {
            $collectionProps = [];

            $collectionProps = array_merge($collectionProps, $args);

            return $collectionProps;
        }


        // public function get_viewProps($args)
        // {
        //     $args = $this->append_fallbacks($args);

        //     $viewProps = array(
        //         'collection' => $this->get_collection_props($args),
        //         'items' => $this->get_items_props($args['articles']),
        //     );

        //     return $viewProps;
        // }

        public function get_default_args()
        {
            $default_args = $this->fields_model->get_default_args();

            return $default_args;
        }

        public function get_fields()
        {
            return $this->fields_model->get_fields();
        }

        public function get_style_config()
        {
            return $this->style_config->get_config();
        }
    } // END CLASS
}