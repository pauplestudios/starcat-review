<?php

namespace HelpieReviews\App\Abstracts;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Abstracts\Review')) {
    class Review
    {
        public function __construct()
        {
            // $this->id = 5;
            // $this->title = "Review Title";
            // $this->overall_rating = 4.5;
            // $this->stats = array(
            //     'style' => 4.5,
            //     'speed' => 4,
            //     'power' => 5,
            //     'customisation' => 4.7,
            // );
        }

    } // END CLASS

}
