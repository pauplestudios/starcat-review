<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Cpt')) {
    class Cpt
    {
        private $post_type_name = HELPIE_REVIEWS_POST_TYPE;

        /* Register post type in init Hook */
        public function register()
        {
            add_action('init', array($this, 'register_post_type_with_taxonomy'));
            add_action('init', array($this, 'show_other_cpt_and_tax'));
        }

        /* Register post type on activation hook cause can't call other filter and actions */
        public function register_helpie_reviews_cpt()
        {
            $this->register_post_type_with_taxonomy();
        }

        public function register_post_type_with_taxonomy()
        {
            $labels = array(
                'name' => _x('Reviews', 'post type general name', 'helpie-reviews'),
                'singular_name' => _x('Review', 'post type singular name', 'helpie-reviews'),
                'menu_name' => _x('Helpie Review', 'admin menu', 'helpie-reviews'),
                'name_admin_bar' => _x('Review', 'add new on admin bar', 'helpie-reviews'),
                'add_new' => _x('Add New', 'Review', 'helpie-reviews'),
                'add_new_item' => __('Add New Review', 'helpie-reviews'),
                'new_item' => __('New Review', 'helpie-reviews'),
                'edit_item' => __('Edit Review', 'helpie-reviews'),
                'update_item' => __('Update Review', 'helpie-reviews'),
                'view_item' => __('View Review', 'helpie-reviews'),
                'all_items' => __('All Reviews', 'helpie-reviews'),
                'search_items' => __('Search Reviews', 'helpie-reviews'),
                'not_found' => __('No Reviews found', 'helpie-reviews'),
                'parent_item_colon' => __('Parent Reviews:', 'helpie-reviews'),
                'not_found' => __('No Reviews found.', 'helpie-reviews'),
                'not_found_in_trash' => __('No Reviews found in Trash.', 'helpie-reviews'),
                'items_list' => __('Review Items list', 'helpie-reviews'),
                'items_list_navigation' => __('Review Items list Navigation', 'helpie-reviews'),
                'filter_items_list' => __('Filter Review Items list', 'helpie-reviews'),
            );

            $args = array(
                'labels' => $labels,
                'public' => true,
                'menu_position' => 26,
                'menu_icon' => 'dashicons-feedback',
                'show_in_nav_menus' => false,
                'show_in_rest' => true,
                'map_meta_cap' => true,
                'can_export' => true,
                'has_archive' => true,
                'exclude_from_search' => false,
                'supports' => array('title', 'editor', 'excerpt', 'custom-fields', 'comments', 'revisions', 'page-attributes', 'post-formats', 'thumbnail', 'author'),
                'rewrite' => array('slug' => $this->post_type_name, 'with_front' => false),
            );

            register_post_type($this->post_type_name, $args);
            $this->register_category();
            // $this->register_tag();

            flush_rewrite_rules();
        }

        public function register_category()
        {
            $labels = array(
                'name' => _x('Review Categories', 'taxonomy general name', 'helpie-reviews'),
                'singular_name' => _x('Review Category', 'taxonomy singular name', 'helpie-reviews'),
                'search_items' => __('Search Review Categories', 'helpie-reviews'),
                'all_items' => __('All Review Categories', 'helpie-reviews'),
                'parent_item' => __('Parent Review Category', 'helpie-reviews'),
                'parent_item_colon' => __('Parent Review Category:', 'helpie-reviews'),
                'edit_item' => __('Edit Review Category', 'helpie-reviews'),
                'update_item' => __('Update Review Category', 'helpie-reviews'),
                'add_new_item' => __('Add New Review Category', 'helpie-reviews'),
                'new_item_name' => __('New Review Category Name', 'helpie-reviews'),
                'menu_name' => __('Review Category', 'helpie-reviews'),
            );

            $args = array(
                'hierarchical' => true,
                'labels' => $labels,
                'show_ui' => true,
                'show_in_rest' => true,
                'show_admin_column' => true,
                'query_var' => true,
                'rewrite' => array('slug' => 'helpie_reviews_category', 'with_front' => false),
            );

            register_taxonomy('helpie_reviews_category', array($this->post_type_name), $args);
        }

        public function register_tag()
        {
            $labels = array(
                'name' => _x('Review Tags', 'taxonomy general name', 'helpie-reviews'),
                'singular_name' => _x('Review Tag', 'taxonomy singular name', 'helpie-reviews'),
                'search_items' => __('Search Review Tags', 'helpie-reviews'),
                'all_items' => __('All Review Tags', 'helpie-reviews'),
                'parent_item' => __('Parent Review Tag', 'helpie-reviews'),
                'parent_item_colon' => __('Parent Review Tag:', 'helpie-reviews'),
                'edit_item' => __('Edit Review Tag', 'helpie-reviews'),
                'update_item' => __('Update Review Tag', 'helpie-reviews'),
                'add_new_item' => __('Add New Review Tag', 'helpie-reviews'),
                'new_item_name' => __('New Review Tag Name', 'helpie-reviews'),
                'menu_name' => __('Review Tag', 'helpie-reviews'),
            );

            $args = array(
                'hierarchical' => true,
                'labels' => $labels,
                'show_ui' => true,
                'show_in_rest' => true,
                'show_admin_column' => true,
                'query_var' => true,
                'rewrite' => array('slug' => 'helpie_reviews_tag', 'with_front' => false),
            );

            register_taxonomy('helpie_reviews_tag', array($this->post_type_name), $args);
        }

        public function show_other_cpt_and_tax()
        {
            if (taxonomy_exists('helpdesk_category')) {
                register_taxonomy_for_object_type('helpdesk_category', $this->post_type_name);
            }

        }

    } // END CLASS
}
