<?php

namespace StarcatReview\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            // error_log("Comments List : " . print_r($args['items']['comments-list'], true));
            $viewProps = [
                'collection' => $this->get_collectionProps($args),
                'items' => $this->get_itemPorps($args),
            ];

            return $viewProps;
        }

        public function get_collectionProps($args)
        {
            return [
                'post_id' => $args['post_id'],
                'title' => 'Reviews',
                'columns' => 1,
                'items_display' => ['title', 'content'],
                'show_controls' => [
                    'search' => true,
                    'sort' => true,
                    'reviews' => true,
                    'verified' => false,
                ],
                'pagination' => true,
            ];
        }

        protected function get_itemPorps($args)
        {
            $items = [];
            if (!isset($args['items']['comments-list']) && empty($args['items']['comments-list'])) {
                return $items;
            }

            foreach ($args['items']['comments-list'] as $comment) {

                $items[] = $this->get_comment_item($comment, $args);
            }

            return $items;
        }

        public function get_comment_item($comment, $args)
        {
            $comment_item = [
                'content' => $comment->comment_content,
                'comment_id' => $comment->comment_ID,
                'comment_date' => get_comment_date('', $comment->comment_ID),
                'comment_time' => $this->get_comment_time($comment->comment_date),
                'comment_parent' => $comment->comment_parent,
                'comment_author' => ucfirst($comment->comment_author),
                'commentor_avatar' => get_avatar($comment->user_id),
                'comment_author_email' => $comment->comment_author_email,
            ];

            if (isset($args)) {
                $comment_item['args'] = $this->get_args($args, $comment);
            }

            if (isset($comment->review) && !empty($comment->review)) {
                $comment_item['title'] = $comment->review['title'];
                $comment_item['rating'] = $comment->review['rating'];
            }

            return $comment_item;
        }

        public function get_args($component_args, $comment)
        {
            $args = $component_args;
            unset($args['items']);

            $args['items'] = [];

            if (isset($comment->review['stats']) && !empty($comment->review['stats'])) {
                $args['items']['stats-list'] = $comment->review['stats'];
            }
            if (isset($comment->review['pros']) && !empty($comment->review['pros'])) {

                $args['items']['pros-list'] = $comment->review['pros'];
            }
            if (isset($comment->review['cons']) && !empty($comment->review['cons'])) {
                $args['items']['cons-list'] = $comment->review['cons'];
            }

            return $args;
        }

        private function get_comment_time($date)
        {
            $date = mysql2date(get_option('time_format'), $date, true);

            return apply_filters('get_comment_time', $date);
        }
    }
}
