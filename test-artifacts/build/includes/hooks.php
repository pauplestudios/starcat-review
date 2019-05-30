<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Hooks')) {
    class Hooks
    {
        public function __construct()
        {
            // error_log('hooks __construct');
            add_filter('the_content', array($this, 'content_filter'));
            add_filter('the_excerpt', array($this, 'content_filter'));
        }

        public function content_filter($content)
        {
            $review_content = $this->get_review_content();
            $fullcontent = $content . $review_content;
            return $fullcontent;
        }

        public function get_review_content()
        {
            $post_id = get_the_ID();
            $reviews_builder = new \HelpieReviews\App\Builders\Review_Builder();
            return $reviews_builder->get_reviews($post_id);
        }
    } // END CLASS

}