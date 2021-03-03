<?php

namespace StarcatReview\App\Widget_Makers\User_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\User_Review\Lists')) {
    class Lists
    {
        public function get_lists_view(array $args)
        {
            $ur_controller = new \StarcatReview\App\Components\User_Reviews\Controller();
            $reviews_list_view = $ur_controller->get_view($args);

            $wrapper_start_html = '<div id="scr-controlled-list" class="scr-user-controlled-list" data-collectionprops="{<pagination<:true,<page<:9,<type<:2}">';
            $controls_builder = new \StarcatReview\App\Builders\Controls_Builder('user_review');

            $args = [
                'search' => 1,
                'sort' => 1,
            ];

            $controls_view = $controls_builder->get_controls($args);
            $view = $wrapper_start_html . $controls_view . $reviews_list_view . '</div>';

            return $view;
        }
    }
}