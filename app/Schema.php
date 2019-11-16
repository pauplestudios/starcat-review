<?php

namespace StarcatReview\App;

require __DIR__ . '/../vendor/autoload.php';

use Spatie\SchemaOrg\Schema;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\App\SchemaBuilder')) {
    class SchemaBuilder
    {
        public function __construct()
        { }


        public function get_post_reviews($post_reviews)
        {
            // 
            echo "<pre>";
            print_r($post_reviews);
            echo "</pre>";
        }
    }
}
