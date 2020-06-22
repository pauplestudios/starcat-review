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
            $this->form_controller = new \StarcatReview\App\Components\Form_New\Controller();
            $this->reviews_controller = new \StarcatReview\App\Components\User_Reviews\Controller();
        }

        public function get_view()
        {

            $args = $this->get_default_args();
            $form_view = $this->form_controller->get_view($args);
            $ur_controller = new \StarcatReview\App\Components\User_Reviews_New\Controller();
            $reviews_list_view = $ur_controller->get_view($args);

            $wrapper_start_html = '<div id="scr-controlled-list" class="scr-user-controlled-list" data-collectionprops="{<pagination<:true,<page<:9,<type<:2}">';
            $this->controls_builder = new \StarcatReview\App\Builders\Controls_Builder('user_review');

            $args = [
                'search' => 1,
                'sort' => 1,
            ];

            $controls_view = $this->controls_builder->get_controls($args);
            $pagination_view = $this->get_pagination_html();

            $view = $form_view . $wrapper_start_html . $controls_view . $reviews_list_view . $pagination_view . '</div>';

            return $view;
        }

        public function get_form_fields()
        {
            $args = $this->get_default_args();
            return $this->form_controller->get_fields_view($args);
        }

        protected function get_default_args()
        {
            $stat_args = ['stats_args' => SCR_Getter::get_stat_default_args()];

            $args = [
                'post_id' => get_the_ID(),
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

            $args = $this->get_interpreted_args($args);

            return $args;
        }

        protected function get_pagination_html()
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

        private function get_interpreted_args($args)
        {

            $args['can_user_vote'] = false;
            $args['can_user_reply'] = false;
            $args['can_user_review'] = false;

            // Used by non-logged-in-users.php
            $args = apply_filters('scr_user_review_pre_interpreted_args', $args);

            if (is_user_logged_in()) {
                $args['can_user_review'] = true;
                $args['can_user_reply'] = true;
                $args['can_user_vote'] = true;
            }

            $components = ['comments', 'stats', 'prosandcons', 'votes', 'attachments'];
            $args['items'] = scr_get_comments_args($components);

            return $args;
        }
    }
}
