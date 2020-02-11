<?php

namespace StarcatReview\App\Actions;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Actions\Review_Actions')) {
    class Review_Actions
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