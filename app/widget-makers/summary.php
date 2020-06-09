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
            $comments = $this->get_comments_list();

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
                'status' => 'approve',
                'parent' => 0,
            ];

            $comments = get_comments($args);

            foreach ($comments as $comment) {
                $comment->reviews = get_comment_meta($comment->comment_ID, SCR_COMMENT_META, true);
                if (isset($comment->reviews['attachments']) && !empty($comment->reviews['attachments'])) {
                    $comment->reviews['attachments'] = $this->get_attachments_with_src($comment);
                }

            }

            return $comments;
        }

        protected function get_attachments_with_src($comment)
        {
            $photos = [];
            for ($ii = 0; $ii < sizeof($comment->reviews['attachments']); $ii++) {
                $photos[$ii] = [
                    'id' => $comment->reviews['attachments'][$ii],
                    'review_id' => $comment->comment_ID,
                    'url' => wp_get_attachment_image_src($comment->reviews['attachments'][$ii], 'medium')[0],
                ];
            }

            return $photos;
        }
    }
}
