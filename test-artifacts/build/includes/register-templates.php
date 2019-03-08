<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Register_Templates')) {
    class Register_Templates
    {
        public function __construct()
        {
            add_filter('single_template', array($this, 'single_template_callback'));

        }

        public function single_template_callback($single)
        {
            global $wp_query, $post;

            // $template_source = $this->settings->single_page->get_template_source();

            // if ($template_source == 'elementor') {
            //     return;
            // }

            /* Checks for single template by post type */
            if ($post->post_type == HELPIE_REVIEWS_POST_TYPE && is_single()) {
                error_log('TRUE TEmplate');
                if (file_exists(HELPIE_REVIEWS_PATH . '/includes/templates/single-helpie_reviews.php')) {
                    return HELPIE_REVIEWS_PATH . '/includes/templates/single-helpie_reviews.php';
                }
            }

            return $single;
        }

    } // END CLASS
}