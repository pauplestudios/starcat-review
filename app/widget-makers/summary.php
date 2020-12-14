<?php

namespace StarcatReview\App\Widget_Makers;

use StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Widget_Makers\Summary')) {
    class Summary
    {
        public function get_view()
        {

             $args = [
                'enable-author-review' => SCR_Getter::get('enable-author-review'),
                'enable_pros_cons' => SCR_Getter::is_enabled_pros_cons(),
                'review_count' => scr_get_user_reviews_count(get_the_ID()),
            ];
            $args = array_merge($args, $this->get_default_args());

            $summary = new \StarcatReview\App\Components\Summary\Controller();
            $view = $summary->get_view($args);

            return $view;
        }

        public function get_default_args()
        {
            $args = SCR_Getter::get_stat_default_args();
            $args['post_id'] = get_the_ID();
            $args['items'] = $this->get_items();
            return $args;
        }

        protected function get_items()
        {
            $post_meta = get_post_meta(get_the_ID(), SCR_POST_META, true);

            $items = [];

            $post_id = get_the_ID();
            $items['summary_author'] = scr_get_stat_args($post_id, 'author_stat');
            $items['summary_users'] = scr_get_stat_args($post_id, 'comment_stat');

            if (isset($post_meta['pros-list']) && !empty($post_meta['pros-list'])) {
                $items['pros-list'] = $post_meta['pros-list'];
            }
            if (isset($post_meta['cons-list']) && !empty($post_meta['cons-list'])) {
                $items['cons-list'] = $post_meta['cons-list'];
            }

            $items['attachments'] = scr_get_comments_args(['attachments']);

            return $items;
        }
    }
}
