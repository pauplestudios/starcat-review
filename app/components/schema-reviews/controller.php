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

            $image_url = SCR_URL . 'includes/assets/img/tomato.png';
            $local_args = array(
                'type' => 'LOCAL_BUSINESS',
                'name'  => 'ABC Corp',
                'telephone_no' => '1234567',
                'url'   => 'https://search.google.com/structured-data/testing-tool',
                'price_range' => '$$',
                'image'     => $image_url,
                'rating'    => array(
                        'value' => 41,
                        'count' => 12
                    ),
                'address'   => array(
                    'locality' => 'srirangam',
                    'region'    =>'trichy',
                    'postal_code' => '620006',
                    'street_address' => '123 vadikalal street'
                )            
            );
            error_log("args".print_r($local_args,true));
            $local_schema = $schema_service->get_schema($local_args);
            error_log("local_business_schema".$local_schema);
            return $get_schema;
        }
    }
}
