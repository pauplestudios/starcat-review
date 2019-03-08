<?php

namespace HelpieReviews\App\Abstracts;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Abstracts\Collection')) {
    abstract class Collection
    {
        public function __construct()
        {
            $this->utils = new \HelpieReviews\Includes\Utils();
        }

    } // END CLASS

}