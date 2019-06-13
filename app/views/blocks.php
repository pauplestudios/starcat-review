<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Blocks')) {
    class Blocks
    {
        public function __construct()
        {
            $this->collection = new \HelpieReviews\App\Views\Blocks\Simple_Collection();
        }
    } // END CLASS
}