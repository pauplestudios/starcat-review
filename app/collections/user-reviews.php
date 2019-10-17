<?php

namespace StarcatReview\App\Collections;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Collections\User_Reviews')) {
    class User_Reviews extends \StarcatReview\App\Abstracts\Collection
    {

        public function get_reviews()
        {
            $reviews = $this->utils->get_reviews_data();
        }
    } // END CLASS
}