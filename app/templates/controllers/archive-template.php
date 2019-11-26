<?php

namespace StarcatReview\App\Templates\Controllers;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Templates\Controllers\Archive_Template')) {
    class Archive_Template
    {
        public function __construct()
        {

            // $this->listing = new \StarcatReview\App\Components\Listing\Controller();
            $this->review_listing = new \StarcatReview\App\Widget_Makers\Review_Listing\Controller();
            $this->category_listing = new \StarcatReview\App\Widget_Makers\Category_Listing\Controller();

            // $this->listing_new = new \StarcatReview\App\Components\Listing_New\Controller();
        }

        public function get_view()
        {
            $props = $this->get_props($this->get_args());
            // error_log('$props : ' . print_r($props, true));
            $html = '<div id="primary">';
            $html .= '<section class="scr-archive-description">';
            $html .= '<h1>' . get_the_archive_title() . '</h1>';
            $html .= '</section>';
            $html .= '<main id="main" class="site-main" role="main">';
            $html .= '<div class="scr-archive-page-content-area">';
            foreach ($props['order'] as $listing => $display) {
                if ($display) {
                    $html .= $this->get_listing_order($listing, $props);
                }
            }
            $html .= "</div>"; // .scr-archive-page-content-area
            $html .= "</main>";
            $html .= "</div>"; // #primary
            return $html;
        }

        protected function get_listing_order($listing = 'mp_category_listing', $props)
        {
            error_log('get_listing_order');
            $html = '';
            if ($listing == 'mp_category_listing')
                $html .= $this->get_category_listing($props);
            elseif ($listing == 'mp_review_listing')
                $html .= $this->get_post_listing($props);
            // $html .= " Post Listing";
            return $html;
        }

        protected function get_category_listing($props)
        {
            error_log('get_category_listing START');
            if (isset($props['category_list']['terms']) && !empty($props['category_list']['terms'])) {
                $html = '<h2 class="scr-section-title">' . $props['category_list']['title'] . '</h2>';
                $html .= $this->category_listing->get_view($props['category_list']);
                // $html .= "No Reviews Category Found";
            } else {
                $html .= "No Reviews Category Found";
            }
            error_log('get_category_listing END');
            return $html;
        }

        protected function get_post_listing($props)
        {
            error_log('get_post_listing');
            $html = '';

            if (isset($props['review_list']['posts']) && !empty($props['review_list']['posts'])) {
                $html .= '<h2 class="scr-section-title">' . $props['review_list']['title'] . '</h2>';
                $html .= $this->review_listing->get_view($props['review_list']);
            } else {
                $html .= "No Reviews post Found";
            }

            return $html;
        }

        protected function get_category_listing_args($props)
        {

            $args = $props['category_list'];
            $terms = $props['category_list']['terms'];

            $items = [];
            foreach ($terms as $key => $term) {
                $items[] = [
                    'title' => $term->name,
                    'featured_image' => SCR_URL . 'includes/assets/img/dummy-review.jpg',
                    'content' => $term->description,
                    'pre_content_html' => '<div>Pre Content HTML</div>',
                    'url' =>  get_term_link($term),
                    'columns' => $args['num_of_cols'],
                    'items_display' => $args['items_display'],
                ];
            }

            $args['items'] = $items;
            return $args;
        }

        /* Protected */
        protected function get_props($args)
        {
            $collection = $args;
            $collection['category_list']['terms'] = $this->get_terms();
            $collection['category_list']['items_display'] = $this->get_category_display_items($args);
            $collection['review_list']['posts'] = $this->get_posts($args);
            return $collection;
        }

        protected function get_args()
        {
            $args = [
                'order' => SCR_Getter::get('mp_components_order'),
                'category_list' => [
                    'title' => SCR_Getter::get('mp_cl_title'),
                    'description' => SCR_Getter::get('mp_cl_description'),
                    'num_of_cols' => SCR_Getter::get('mp_cl_cols'),
                    'show_controls' => false,
                ],

                'review_list' => [
                    'title' => SCR_Getter::get('mp_rl_title'),
                    'sortby' => SCR_Getter::get('mp_rl_sortby'),
                    'num_of_cols' => SCR_Getter::get('mp_rl_cols'),
                    'show_controls' => false,
                ]
            ];

            return $args;
        }

        protected function get_category_display_items($collection)
        {
            $display_items = ['title', 'link'];
            if ($collection['category_list']['description']) {
                $display_items = ['title', 'content', 'link'];
            }

            return $display_items;
        }

        protected function get_terms()
        {
            $terms = get_terms(SCR_CATEGORY, array('parent' => 0, 'hide_empty' => false));
            return $terms;
        }


        protected function get_posts($args)
        {
            $query_args = $this->get_query_args($args);

            return get_posts($query_args);
        }

        protected function get_query_args($args)
        {
            $sortBy = $args['review_list']['sortby'];

            // the query to set the posts per page to 3
            $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
            $args = array(
                'posts_per_page' => 6, // show 6 posts for now only
                'post_type' => SCR_POST_TYPE,
                'paged' => $paged,
            );

            if ($sortBy == 'alphabetical_asc') {
                $args['orderby'] = "title";
                $args['order'] = "ASC";
            } else if ($sortBy == 'alphabetical_desc') {
                $args['orderby'] = "title";
                $args['order'] = "DESC";
            } else if ($sortBy == 'recent') {
                $args['orderby'] = "date";
                $args['order'] = "DESC";
            } else if ($sortBy == 'updated') {
                $args['orderby'] = "modified";
                $args['order'] = "DESC";
            } else if ($sortBy == 'num_of_reviews') {
                // $args['orderby'] = "modified";
                // $args['order'] = "DESC";
            }

            return $args;
        }
    } // END CLASS

}