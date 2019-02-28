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
            $this->customer_level = 'Gold';
            $this->customer_labels = "Finest Reviewer";
        }

    } // END CLASS

}
