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
                'author_name' => get_author_name($post->post_author),
                'featured_image_url' => isset($post_image_url) ? $post_image_url : $default_image
            );


            $schema_service = new \StarcatReview\App\Services\Review_Schema();
            $get_schema = $schema_service->get_schema($post_infos);

            $email_service = new \StarcatReview\App\Services\Email_Notifications();

            $mail_args = array(
                'user_mail_address'  => 'themechanic.dev@gmail.com',
                'user_name'     => 'sekar',
                'to_address'    => 'gnanasekaran.srgm@gmail.com',
                'subject'       => 'mail subject content',
                'content'       => 'body of the mail content',
                'disclaimer'   => 'diclaimer',
            );
            error_log('mail args : ' . print_r($mail_args, true));
            $send_mail  = $email_service->send_mail($mail_args);

            return $get_schema;
        }
    }
}
