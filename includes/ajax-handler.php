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
            add_action('wp_ajax_nopriv_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']);
            add_action('wp_ajax_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']);
        }

        public function search_posts()
        {
            $args = array(
                'post_type'              => array('helpie_reviews'),
                'post_status'            => array('publish'),
                'nopaging'               => true,
                'order'                  => 'ASC',
                'orderby'                => 'menu_order',
            );

            // The Query
            $queried_result = new WP_Query($args);

            // The Loop
            if ($queried_result->have_posts()) {
                while ($queried_result->have_posts()) {
                    $the_post = $queried_result->the_post();
                    $posts[] = array(
                        'id' => $the_post->ID,
                        'title' => $the_post->post_title,
                        'description' => $the_post->post_content,
                        'url' => $the_post->guid
                    );
                }
            } else {
                $posts = [];
            }

            echo json_encode($posts);
            wp_reset_postdata();
            wp_die();
        }
    }
}
