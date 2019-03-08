<?php

namespace HelpieReviews\App\Collections;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Collections\User_Reviews')) {
    class User_Reviews extends \HelpieReviews\App\Abstracts\Collection
    {

        public function get_reviews()
        {
            $reviews = $this->utils->get_reviews_data();
        }
    } // END CLASS
}