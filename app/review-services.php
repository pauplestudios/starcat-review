<?php

namespace HelpieReviews\App;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\ReviewServices')) {
    class ReviewServices
    {
        public function __construct()
        {

        }

        public function onProductPurchase()
        {
            $this->requestReview();
            $this->requestReviewWithReward();
        }

        public function onNewReview()
        {
            $this->verifyReview();
            $this->notification();
            $this->moderate();
            $this->promote();
            $this->reward();
        }

    } // END CLASS

}
