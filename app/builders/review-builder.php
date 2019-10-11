<?php

namespace HelpieReviews\App\Builders;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Builders\Review_Builder')) {
    class Review_Builder
    {
        public function __construct()
        {
            $this->summary = new \HelpieReviews\App\Summary();
            $this->user_review = new \HelpieReviews\App\User_Review();
        }

        public function get_reviews()
        {
            $html = $this->summary->get_view();
            $html .= $this->user_review->get_view();

            return $html;
        }
    } // END CLASS

}
