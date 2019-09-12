<?php

namespace HelpieReviews\App;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\ReviewsList')) {
    class ReviewsList
    {
        public function __construct()
        {
            $this->filters = array(
                'rating' => 4,
                'number_of_reviews' => 17,
                'time_period' => '6 months',
                'verified_purchase' => true,
            );

            $this->sorting = array(
                'most_helpful',
                'recent',
                'positive',
                'negative',
            );

            $this->parts = array(
                'media' => array(),
                'overview' => 'see flipkart',
                'most_helpful',
                'most_positive',
                'critical',
            );
        }
    } // END CLASS

}
