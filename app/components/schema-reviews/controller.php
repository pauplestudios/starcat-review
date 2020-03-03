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

        public function generate_schema()
        {

            global $post;
            $get_overall_ratings = scr_get_overall_rating($post->ID);
            $get_comments = scr_get_user_reviews($post->ID);

            $default_image = "http://via.placeholder.com/640x360";
            $post_image_url = get_the_post_thumbnail_url($post);

            
            $post_infos = array(
                'post'  => $post,
                'comments' => $get_comments,
                'ratings'   => $get_overall_ratings,
                'author_name' => get_the_author_meta('display_name',$post->post_author),
                'featured_image_url' => isset($post_image_url) ? $post_image_url : $default_image
            );
            $schema_service = new \StarcatReview\App\Services\Review_Schema();
            $get_schema = $schema_service->get_schema($post_infos);

            return $get_schema;
        }
    }
}
