<?php

namespace StarcatReview\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Register_Templates')) {
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
            if (is_post_type_archive(SCR_POST_TYPE)) {
                if (file_exists(SCR_PATH . '/app/templates/archive-starcat_review.php')) {
                    $archive_template = SCR_PATH . '/app/templates/archive-starcat_review.php';
                }
            }

            return $archive_template;
        }

        public function get_category_template($archive_template)
        {
            global $post;
            if (is_tax(SCR_CATEGORY)) {
                if (file_exists(SCR_PATH . '/app/templates/category-starcat_review.php')) {
                    $archive_template = SCR_PATH . '/app/templates/category-starcat_review.php';
                }
            }

            return $archive_template;
        }

        public function single_template_callback($single)
        {
            global $wp_query, $post;

            /* Checks for single template by post type */
            if ($post->post_type == SCR_POST_TYPE && is_single()) {
                $template_source = \StarcatReview\Includes\Settings\SCR_Getter::get('template_source');

                // if ($template_source == 'theme') {
                //     return $single;
                // }

                if (file_exists(SCR_PATH . '/app/templates/single-starcat_review.php')) {
                    return SCR_PATH . '/app/templates/single-starcat_review.php';
                }
            }

            return $single;
        }
    } // END CLASS
}