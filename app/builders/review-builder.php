<?php

namespace HelpieReviews\App\Builders;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Builders\Review_Builder')) {
    class Review_Builder
    {
        public function __construct()
        {
            $this->summary = new \HelpieReviews\App\Summary();
            $this->user_reviews = new \HelpieReviews\App\User_Reviews();
        }

        public function get_reviews()
        {
            $html = $this->summary->get_view();
            $html .= $this->user_reviews->get_view();

            return $html;
        }
    } // END CLASS

}
