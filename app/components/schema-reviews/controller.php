<?php

namespace StarcatReview\App\Components\Schema_Reviews;


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly


if (!class_exists('\StarcatReview\App\Components\Schema_Reviews\Controller')) {

    class Controller
    {
        public function __construct()
        { }

        public function generate_schema($args)
        {
            global $post;
            $post_id = $args->ID ? $args->ID : $post->ID;
            $get_comments = scr_get_user_reviews($post_id);
            $schema_service = new \StarcatReview\App\Services\Review_Schema();
            $get_schema = $schema_service->get_schema($get_comments);
            return $get_schema;
        }
    }
}
