<?php

namespace StarcatReview\Includes;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Cpt')) {
    class Cpt
    {
        private $post_type_name = SCR_POST_TYPE;

        /* Register post type in init Hook */
        public function register()
        {
            add_action('init', array($this, 'register_post_type_with_taxonomy'));
        }

        /* Register post type on activation hook cause can't call other filter and actions */
        public function register_scr_cpt()
        {
            $this->register_post_type_with_taxonomy();
        }

        public function register_post_type_with_taxonomy()
        {
            $labels = array(
                'name' => _x('Reviews', 'post type general name', 'starcat-review'),
                'singular_name' => _x('Review', 'post type singular name', 'starcat-review'),
                'menu_name' => _x('Starcat Review', 'admin menu', 'starcat-review'),
                'name_admin_bar' => _x('Review', 'add new on admin bar', 'starcat-review'),
                'add_new' => _x('Add New', 'Review', 'starcat-review'),
                'add_new_item' => __('Add New Review', 'starcat-review'),
                'new_item' => __('New Review', 'starcat-review'),
                'edit_item' => __('Edit Review', 'starcat-review'),
                'update_item' => __('Update Review', 'starcat-review'),
                'view_item' => __('View Review', 'starcat-review'),
                'all_items' => __('All Reviews', 'starcat-review'),
                'search_items' => __('Search Reviews', 'starcat-review'),
                'not_found' => __('No Reviews found', 'starcat-review'),
                'parent_item_colon' => __('Parent Reviews:', 'starcat-review'),
                'not_found' => __('No Reviews found.', 'starcat-review'),
                'not_found_in_trash' => __('No Reviews found in Trash.', 'starcat-review'),
                'items_list' => __('Review Items list', 'starcat-review'),
                'items_list_navigation' => __('Review Items list Navigation', 'starcat-review'),
                'filter_items_list' => __('Filter Review Items list', 'starcat-review'),
            );

            $cpt_slug = $this->get_cpt_slug();

            $args = array(
                'labels' => $labels,
                'public' => true,
                'menu_position' => 26,
                'menu_icon' => 'dashicons-star-filled',
                'show_in_nav_menus' => true,
                'show_in_rest' => true,
                'map_meta_cap' => true,
                'can_export' => true,
                'has_archive' => true,
                'exclude_from_search' => false,
                'supports' => array('title', 'editor', 'excerpt', 'custom-fields', 'comments', 'revisions', 'page-attributes', 'post-formats', 'thumbnail', 'author'),
                'rewrite' => array('slug' => $cpt_slug, 'with_front' => false),
            );

            register_post_type($this->post_type_name, $args);
            $this->register_category();
            // $this->register_tag();

            flush_rewrite_rules();
        }

        public function register_category()
        {
            $labels = array(
                'name' => _x('Review Categories', 'taxonomy general name', 'starcat-review'),
                'singular_name' => _x('Review Category', 'taxonomy singular name', 'starcat-review'),
                'search_items' => __('Search Review Categories', 'starcat-review'),
                'all_items' => __('All Review Categories', 'starcat-review'),
                'parent_item' => __('Parent Review Category', 'starcat-review'),
                'parent_item_colon' => __('Parent Review Category:', 'starcat-review'),
                'edit_item' => __('Edit Review Category', 'starcat-review'),
                'update_item' => __('Update Review Category', 'starcat-review'),
                'add_new_item' => __('Add New Review Category', 'starcat-review'),
                'new_item_name' => __('New Review Category Name', 'starcat-review'),
                'menu_name' => __('Review Category', 'starcat-review'),
            );

            $args = array(
                'hierarchical' => true,
                'labels' => $labels,
                'show_ui' => true,
                'show_in_rest' => true,
                'show_admin_column' => true,
                'query_var' => true,
                'rewrite' => array('slug' => SCR_CATEGORY, 'with_front' => false),
            );

            register_taxonomy(SCR_CATEGORY, array($this->post_type_name), $args);
        }

        public function register_tag()
        {
            $labels = array(
                'name' => _x('Review Tags', 'taxonomy general name', 'starcat-review'),
                'singular_name' => _x('Review Tag', 'taxonomy singular name', 'starcat-review'),
                'search_items' => __('Search Review Tags', 'starcat-review'),
                'all_items' => __('All Review Tags', 'starcat-review'),
                'parent_item' => __('Parent Review Tag', 'starcat-review'),
                'parent_item_colon' => __('Parent Review Tag:', 'starcat-review'),
                'edit_item' => __('Edit Review Tag', 'starcat-review'),
                'update_item' => __('Update Review Tag', 'starcat-review'),
                'add_new_item' => __('Add New Review Tag', 'starcat-review'),
                'new_item_name' => __('New Review Tag Name', 'starcat-review'),
                'menu_name' => __('Review Tag', 'starcat-review'),
            );

            $args = array(
                'hierarchical' => true,
                'labels' => $labels,
                'show_ui' => true,
                'show_in_rest' => true,
                'show_admin_column' => true,
                'query_var' => true,
                'rewrite' => array('slug' => 'starcat_review_tag', 'with_front' => false),
            );

            register_taxonomy('starcat_review_tag', array($this->post_type_name), $args);
        }

        /* Protected Methods */

        public function get_cpt_slug()
        {





            // if ($settings_getter->get('mp_slug') == 'archive') {
            //     $cpt_slug = $this->mp_settings->get_mp_slug();
            // } else {
            //     $post_id = $this->get_mp_selected_page();
            //     $post = get_post($post_id);
            //     $cpt_slug = $post->post_name;
            // }

            $cpt_slug = SCR_Getter::get('mp_slug');
            // $cpt_slug = SCR_Getter::get('review_enable_post-types');

            return $cpt_slug;
        }
    } // END CLASS
}
