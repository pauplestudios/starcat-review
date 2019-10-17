<?php

namespace HelpieReviews\Includes\Utils;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Utils\Create_Pages')) {
    class Create_Pages
    {

        public function setup_data($post_data)
        {
            $post_data = [
                'post_type' => "helpie_reviews",
                'taxonomy' => [
                    'STARCAT_REVIEW_CATEGORY' => "Getting Started",
                ],
                'title' => "Yours First Reviews Question",
                'content' => "Yours relevent questions answer."
            ];

            $args = array('post_type' => $post_data['post_type'], 'post_status' => array('publish', 'pending', 'trash'));
            $the_query = new \WP_Query($args);

            // Create Post only if it does not already exists
            if ($the_query->post_count < 1) {
                /* Setup Demo Reviews Question And Answer */
                $post_utils = new \HelpieReviews\Includes\Utils\Post();
                $post_utils->insert_term_with_post($post_data['post_type'], "Getting Started", "STARCAT_REVIEW_CATEGORY", "Yours First Reviews Question", "Yours relevent questions answer.");
            }
            $this->create_page_on_activate();
            wp_reset_postdata();
        }

        public function create_page_on_activate()
        {
            // $create_page = new \HelpieReviews\Utils\Create_Pages();
            $this->create('helpie_reviews_page', 'helpie_reviews_page_id', 'Helpie Reviews', '[helpie_reviews]');
        }

        /**
         * Create a page and store the ID in an option.
         *
         * @param mixed $slug Slug for the new page
         * @param string $option Option name to store the page's ID
         * @param string $page_title (default: '') Title for the new page
         * @param string $page_content (default: '') Content for the new page
         * @param int $post_parent (default: 0) Parent for the new page
         * @return int page ID
         */
        public function create($slug, $option = '', $page_title = '', $page_content = '', $post_parent = 0)
        {
            global $wpdb;

            $option_value     = get_option($option);

            if ($option_value > 0) {
                $page_object = get_post($option_value);
                if (isset($page_object) && !empty($page_object)) {
                    if ('page' === $page_object->post_type && !in_array($page_object->post_status, array('pending', 'trash', 'future', 'auto-draft'))) {
                        // Valid page is already in place
                        return $page_object->ID;
                    }
                }
            }

            if (strlen($page_content) > 0) {
                // Search for an existing page with the specified page content (typically a shortcode)
                $valid_page_found = $wpdb->get_var($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE post_type='page' AND post_status NOT IN ( 'pending', 'trash', 'future', 'auto-draft' ) AND post_content LIKE %s LIMIT 1;", "%{$page_content}%"));
            } else {
                // Search for an existing page with the specified page slug
                $valid_page_found = $wpdb->get_var($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE post_type='page' AND post_status NOT IN ( 'pending', 'trash', 'future', 'auto-draft' )  AND post_name = %s LIMIT 1;", $slug));
            }

            $valid_page_found = apply_filters('woocommerce_create_page_id', $valid_page_found, $slug, $page_content);

            if ($valid_page_found) {
                if ($option) {
                    update_option($option, $valid_page_found);
                }
                return $valid_page_found;
            }

            // Search for a matching valid trashed page
            if (strlen($page_content) > 0) {
                // Search for an existing page with the specified page content (typically a shortcode)
                $trashed_page_found = $wpdb->get_var($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE post_type='page' AND post_status = 'trash' AND post_content LIKE %s LIMIT 1;", "%{$page_content}%"));
            } else {
                // Search for an existing page with the specified page slug
                $trashed_page_found = $wpdb->get_var($wpdb->prepare("SELECT ID FROM $wpdb->posts WHERE post_type='page' AND post_status = 'trash' AND post_name = %s LIMIT 1;", $slug));
            }

            if ($trashed_page_found) {
                $page_id   = $trashed_page_found;
                $page_data = array(
                    'ID'             => $page_id,
                    'post_status'    => 'publish',
                );
                wp_update_post($page_data);
            } else {
                $page_data = array(
                    'post_status'    => 'publish',
                    'post_type'      => 'page',
                    'post_author'    => 1,
                    'post_name'      => $slug,
                    'post_title'     => $page_title,
                    'post_content'   => $page_content,
                    'post_parent'    => $post_parent,
                    'comment_status' => 'closed'
                );
                $page_id = wp_insert_post($page_data);
            }

            if ($option) {
                update_option($option, $page_id);
            }

            return $page_id;
        }
    } // END CLASS
}