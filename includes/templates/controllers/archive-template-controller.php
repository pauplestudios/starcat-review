<?php

namespace HelpieReviews\Includes\Templates\Controllers;

use \HelpieReviews\Includes\Settings\HRP_Getter;

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
            // $html .= $this->get_category_listing();

            return $html;
        }

        public function get_post_listing()
        {
            $query_args = $this->get_query_args();
            $posts = $this->get_posts($query_args);

            // error_log('$posts : ' . print_r($posts, true));
            // $args = $this->get_args($query_args);
            // error_log('get_post_listing() $args : ' . print_r($args, true));

            $html = '<div class="hrp-category-page-content-area">';

            if (isset($posts) && !empty($posts)) {
                $args = $this->get_listing_args();
                $args['posts'] = $posts;
                $listing_controller = new \HelpieReviews\App\Widgets\Listing\Controller();
                $html .= $listing_controller->get_view($args);
            } else {
                $html .= "No Reviews Found";
            }

            $html .= "</div>";

            return $html;
        }

        public function get_category_listing()
        {
            $terms = get_terms('helpie_reviews_category', array('parent' => 0, 'hide_empty' => false));
            $cats_list = new \HelpieReviews\App\Views\Review_Categories();
            return $cats_list->get_view($terms);
        }

        /* Protected */

        protected function get_listing_args()
        {

            $args = [
                'title' => HRP_Getter::get('mp_review_listing_title'),
                'num_of_cols' => 2,
                // 'orderby' => "title",
                // 'order' => "DESC"

            ];

            return $args;
        }


        protected function get_posts($args)
        {

            return get_posts($args);
        }

        // protected function get_args($query_args)
        // {
        //     $args = array(
        //         'title' => HRP_Getter::get('mp_review_listing_title'),
        //     );

        //     $args = array_merge($args, $query_args);

        //     return $args;
        // }


        protected function get_query_args()
        {
            $sortBy = HRP_Getter::get('mp_review_listing_sortby');
            error_log(' $sortBy : ' .  $sortBy);

            $term = get_queried_object();
            // the query to set the posts per page to 3
            $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            $args = array(
                'posts_per_page' => -1,
                'post_type' => HELPIE_REVIEWS_POST_TYPE,
                'paged' => $paged,
            );

            if ($sortBy == 'alphabetical') {
                $args['orderby'] = "title";
                $args['order'] = "ASC";
            } else if ($sortBy == 'recent') {
                $args['orderby'] = "date";
                $args['order'] = "DESC";
            } else if ($sortBy == 'updated') {
                $args['orderby'] = "modified";
                $args['order'] = "DESC";
            } else if ($sortBy == 'popular') {
                // $args['orderby'] = "modified";
                // $args['order'] = "DESC";
            }

            error_log('$args : ' . print_r($args, true));

            return $args;
        }
    } // END CLASS

}