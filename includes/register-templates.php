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
            add_filter('archive_template', array($this, 'get_archive_template'));
            add_filter('taxonomy_template', array($this, 'get_category_template'));
            add_filter('single_template', array($this, 'single_template_callback'));
        }

        public function get_archive_template($archive_template)
        {
            global $post;
            if (is_post_type_archive('helpie_reviews')) {
                if (file_exists(HELPIE_REVIEWS_PATH . '/includes/templates/archive-helpie_reviews.php')) {
                    $archive_template = HELPIE_REVIEWS_PATH . '/includes/templates/archive-helpie_reviews.php';
                }
            }

            return $archive_template;
        }

        public function get_category_template($archive_template)
        {
            global $post;
            if (is_tax('helpie_reviews_category')) {
                if (file_exists(HELPIE_REVIEWS_PATH . '/includes/templates/category-helpie_reviews.php')) {
                    $archive_template = HELPIE_REVIEWS_PATH . '/includes/templates/category-helpie_reviews.php';
                }
            }

            return $archive_template;
        }

        public function single_template_callback($single)
        {
            global $wp_query, $post;

            $template_source = \HelpieReviews\Includes\Settings\HRP_Getter::get('template_source');

            // error_log('$template_source : ' . $template_source);
            if ($template_source == 'theme') {
                return;
            }

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