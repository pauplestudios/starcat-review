<?php

namespace StarcatReview\App\Components\Schemabuilder;

require __DIR__ . '/../vendor/autoload.php';


use Spatie\SchemaOrg\Schema;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\App\Components\Schemabuilder\Controller')) {

    class Controller
    {

        public function __construct()
        {
            // $this->review_controller = new \StarcatReview\App\Widget_Makers\Review_Listing\Controller();
        }

        public function get_post_review_info()
        {
            echo "<li>asdasdasdasda</li>";
        }
    }
}
