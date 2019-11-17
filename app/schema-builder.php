<?php

namespace StarcatReview\App;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly



if (!class_exists('\StarcatReview\App\Schema_Builder')) {
    class Schema_Builder
    {
        public function __construct()
        {
            $this->user_review = new \StarcatReview\App\User_Review();
        }

        public function get_post_review_schema()
        {

            $review_comments = $this->user_review->get_schema_reviews();
            $schema_reviews = new \StarcatReview\App\Components\Schema_Reviews\Controller();
            $generate_scripts = $schema_reviews->get_product_reviews_script($review_comments);
            return $generate_scripts;
        }
    }
}
