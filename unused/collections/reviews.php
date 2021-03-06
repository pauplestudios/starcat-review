<?php

namespace StarcatReview\App\Collections;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Collections\Reviews')) {
    class Reviews
    {

        public function get_reviews()
        {
            $args = array(
                'post_type' => SCR_POST_TYPE,
            );
            return get_posts($args);
        }
    } // END CLASS
}
