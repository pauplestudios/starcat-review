<?php

namespace HelpieReviews\App;

use HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\User_Review')) {
    class User_Review
    {
        public function __construct()
        {
            $this->form_controller = new \HelpieReviews\App\Components\Form\Controller();
            $this->reviews_controller = new \HelpieReviews\App\Components\User_Reviews\Controller();
        }

        public function get_view()
        {

            $args = $this->get_default_args();
            $form_view = $this->form_controller->get_view($args);
            $reviews_list_view = $this->reviews_controller->get_view($args);

            $view = $form_view . $reviews_list_view;

            return $view;
        }

        public function get_default_args()
        {
            $type = HRP_Getter::get('stats-type');
            $limit = ($type == 'star') ? HRP_Getter::get('stats-stars-limit') : HRP_Getter::get('stats-bars-limit');

            $args = [
                'global_stats' => HRP_Getter::get('global_stats'),
                'items' => $this->get_items(),
                'singularity' => HRP_Getter::get('stat-singularity'),
                'type' => $type,
                'source_type' =>  HRP_Getter::get('stats-source-type'),
                'show_rating_label' => HRP_Getter::get('stats-show-rating-label'),
                'icons' =>  HRP_Getter::get('stats-icons'),
                'images' => HRP_Getter::get('stats-images'),
                'steps' => HRP_Getter::get('stats-steps'),
                'limit' => $limit,
                'animate' => HRP_Getter::get('stats-animate'),
                'no_rated_message' => HRP_Getter::get('stats-no-rated-message'),

                'enable_pros_cons' => HRP_Getter::get('enable-pros-cons'),
                'show_form_title' => HRP_Getter::get('ur_show_form_title'),
                'form_title' => HRP_Getter::get('ur_form_title'),
                'show_title' => HRP_Getter::get('ur_show_title'),
                'show_stats' => HRP_Getter::get('ur_show_stats'),
                'show_description' => HRP_Getter::get('ur_show_description'),

            ];

            return $args;
        }

        protected function get_items()
        {
            $post_meta = get_post_meta(get_the_ID(), '_helpie_reviews_post_options', true);
            $comments = $this->get_comments_list();
            // error_log("Options : " . print_r($post_meta, true));
            $items = [];

            if (isset($post_meta['stats-list']) || !empty($post_meta['stats-list'])) {
                $items['stats-list'] = $post_meta['stats-list'];
            }
            if (isset($post_meta['pros-list']) || !empty($post_meta['pros-list'])) {
                $items['pros-list'] = $post_meta['pros-list'];
            }
            if (isset($post_meta['cons-list']) || !empty($post_meta['cons-list'])) {
                $items['cons-list'] = $post_meta['cons-list'];
            }

            if (isset($comments) || !empty($comments)) {
                $items['comments-list'] = $comments;
            }



            return $items;
        }

        protected function get_comments_list()
        {
            $args = [
                'post_id' => get_the_ID(),
                'type' => 'helpie_reviews'
            ];

            $comments = get_comments($args);

            foreach ($comments as $comment) {
                $comment->review = get_comment_meta($comment->comment_ID, 'hrp_user_review_props', true);
            }

            return $comments;
        }
    }
}
