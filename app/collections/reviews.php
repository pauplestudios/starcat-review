<?php

namespace HelpieReviews\App\Collections;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Collections\Reviews')) {
    class Reviews
    {

        public function get_reviews()
        {
            $args = array(
                'post_type' => HELPIE_REVIEWS_POST_TYPE,
            );
            return get_posts($args);
        }
    } // END CLASS
}