<?php

namespace StarcatReview\App\Widget_Makers;

use StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\User_Review')) {
    class User_Review
    {
        public function __construct()
        {
            $this->form_controller = new \StarcatReview\App\Components\Form\Controller();
            $this->reviews_controller = new \StarcatReview\App\Components\User_Reviews\Controller();
        }

        public function get_view()
        {

            $args = $this->get_default_args();
            $form_view = $this->form_controller->get_view($args);
            $reviews_list_view = $this->reviews_controller->get_view($args);

            $wrapper_start_html = '<div id="scr-controlled-list" data-collectionprops="{<pagination<:true,<page<:9,<type<:2}">';
            $this->controls_builder = new \StarcatReview\App\Builders\Controls_Builder('user_review');

            $args = [
                'search' => 1,
                'sort' => 1,
            ];
            $controls_view = '';
            $controls_view = $this->controls_builder->get_controls($args);


            $pagination_html = '';

            $pagination_html .= $this->get_pagination_html();


            $view = $form_view . $wrapper_start_html . $controls_view . $reviews_list_view . $pagination_html . '</div>';

            return $view;
        }

        private function get_pagination_html()
        {
            $html = '';
            $html .= '<ul class="ui pagination scr-pagination menu">';

            for ($ii = 1; $ii <= 2; $ii++) {
                # code...
                $html .= '<li class="active"><a class="page" href="">' . $ii . '</a></li>';
            }

            $html .= '</ul>';
            return $html;
        }

        public function get_view_old()
        {

            $args = $this->get_default_args();
            $form_view = $this->form_controller->get_view($args);
            $reviews_list_view = $this->reviews_controller->get_view($args);

            $view = $form_view . $reviews_list_view;

            return $view;
        }

        //for rich snippet product schema purpose
        public function get_schema_reviews()
        {
            $post_meta = get_post_meta(get_the_ID(), '_scr_post_options', true);
            $reviews = $this->get_comments_list();
            return $reviews;
        }

        public function get_default_args()
        {
            $stat_args = SCR_Getter::get_stat_default_args();

            $args = [
                'post_id' => get_the_ID(),
                'items' => $this->get_items(),
                'enable_pros_cons' => SCR_Getter::get('enable-pros-cons'),
                'show_list_title' => SCR_Getter::get('ur_show_list_title'),
                'list_title' => SCR_Getter::get('ur_list_title'),
                'enable_voting' => SCR_Getter::get('ur_enable_voting'),
                'show_form_title' => SCR_Getter::get('ur_show_form_title'),
                'form_title' => SCR_Getter::get('ur_form_title'),
                'show_title' => SCR_Getter::get('ur_show_title'),
                'show_stats' => SCR_Getter::get('ur_show_stats'),
                'show_description' => SCR_Getter::get('ur_show_description'),
                'show_captcha' => SCR_Getter::get('ur_show_captcha'),
                'current_user_id' => get_current_user_id(),
            ];

            $args = array_merge($stat_args, $args);

            $args['can_user_review'] = $this->get_user_can_review();
            $args['can_user_reply'] = $this->get_user_can_reply();
            $args['can_user_vote'] = is_user_logged_in();

            return $args;
        }

        protected function get_items()
        {
            $post_meta = get_post_meta(get_the_ID(), '_scr_post_options', true);
            $comments = $this->get_comments_list();
            // error_log("Options : " . print_r($post_meta, true));
            $items = [];

            if (isset($post_meta['stats-list']) && !empty($post_meta['stats-list'])) {
                $items['stats-list'] = $post_meta['stats-list'];
            }
            if (isset($post_meta['pros-list']) && !empty($post_meta['pros-list'])) {
                $items['pros-list'] = $post_meta['pros-list'];
            }
            if (isset($post_meta['cons-list']) && !empty($post_meta['cons-list'])) {
                $items['cons-list'] = $post_meta['cons-list'];
            }

            if (isset($comments) && !empty($comments)) {
                $items['comments-list'] = $comments;
            }

            return $items;
        }

        protected function get_comments_list()
        {
            $args = [
                'post_id' => get_the_ID(),
                'type' => SCR_COMMENT_TYPE,
                // 'status' => 'approve',
            ];

            $comments = get_comments($args);

            foreach ($comments as $comment) {
                $comment->review = get_comment_meta($comment->comment_ID, 'scr_user_review_props', true);
            }

            return $comments;
        }

        protected function get_user_can_review()
        {
            $args = [
                'post_id' => get_the_ID(),
                'type' => SCR_COMMENT_TYPE,
            ];

            $comments = get_comments($args);

            $user_can_review = false;

            if (is_user_logged_in()) {
                $user_can_review = true;
            }

            if (isset($comments) && !empty($comments)) {
                foreach ($comments as $comment) {

                    if ($comment->user_id == get_current_user_id() && $comment->comment_parent == 0) {
                        $user_can_review = false;
                        break;
                    }
                }
            }

            return $user_can_review;
        }

        protected function get_user_can_reply()
        {
            $user_can_reply = false;

            if (is_user_logged_in()) {
                $user_can_reply = true;
            }

            return $user_can_reply;
        }
    }
}