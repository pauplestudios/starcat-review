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
                    'helpie_reviews_category' => "Getting Started",
                ],
                'title' => "Yours First Reviews Question",
                'content' => "Yours relevent questions answer."
            ];

            $args = array('post_type' => $post_data['post_type'], 'post_status' => array('publish', 'pending', 'trash'));
            $the_query = new \WP_Query($args);

            // Create Post only if it does not already exists
            if ($the_query->post_count < 1) {
                /* Setup Demo Reviews Question And Answer */
                $utils_helper = new \HelpieReviews\Utils\Helpers();
                $utils_helper->insert_term_with_post($post_data['post_type'], "Getting Started", "helpie_reviews_category", "Yours First Reviews Question", "Yours relevent questions answer.");
            }
            $this->create_page_on_activate();
            wp_reset_postdata();
        }
    } // END CLASS
}