<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function register_ajax_actions()
        {
            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_listing_action', array($this, 'hrp_listing_action'));
            add_action('wp_ajax_hrp_listing_action', array($this, 'hrp_listing_action'));

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_helpiereview_search_posts', [$this, 'search_posts']);
            add_action('wp_ajax_helpiereview_search_posts', [$this, 'search_posts']);
        }

        public function hrp_listing_action()
        {
            error_log('wp_ajax_hrp_listing_action');
        }

        public function search_posts()
        {
            $args = array(
                'post_type' => array('helpie_reviews'),
                'post_status' => array('publish'),
                'nopaging' => true,
                'order' => 'ASC',
                'orderby' => 'menu_order',
            );

            $results = new \WP_Query($args);

            if ($results->have_posts()) {
                foreach ($results->posts as $post) {
                    $posts[] = array(
                        'id' => $post->ID,
                        'title' => $post->post_title,
                        'description' => $post->post_content
                        // 'url' => $post->guid,
                    );
                }
            } else {
                $posts = [];
            }

            echo json_encode($posts);
            wp_die();
        }
    }
}
