<?php

namespace HelpieReviews\App;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Review')) {
    class Review
    {
        public function __construct()
        {
            $this->id = 5;
            $this->title = "Review Title";
            $this->overall_rating = 4.5;
            $this->ratings = array(
                'style' => 4.5,
                'speed' => 4,
                'power' => 5,
                'customisation' => 4.7,
            );

            // Add All Comments Props to Review Props
            // $this->review_author = "WordPress User";
            // $this->review_url = "www.pauple.com";
            // $this->review_content = "Content Here....";

            $this->comments = array();
            $this->found_helpful_count = 6;
            $this->verified_purchase = false;

        }

    } // END CLASS

}
