<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Actions')) {
    class Actions
    {
        public function __construct()
        {
            add_action('pre_get_comments', [$this, 'exclude_from_comments']);
        }

        // Comment Type of 'starcat_review' is exclude from standard comments list Unless we call explicitly by get_comments($type = "helpie_reviews")

        public function exclude_from_comments(\WP_Comment_Query $query)
        {
            /* only allow 'starcat_review' when is required explicitly */

            if ($query->query_vars['type'] !== 'starcat_review') {
                $query->query_vars['type__not_in'] = array_merge(
                    (array) $query->query_vars['type__not_in'],
                    array('starcat_review')
                );
            }
        }
    }
}
