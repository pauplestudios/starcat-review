<?php


namespace HelpieReviews\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\User_Reviews\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            // error_log("Comments List : " . print_r($args['items']['comments-list'], true));
            $viewProps = [
                'collection' => $this->get_collectionProps($args),
                'items' => $this->get_itemPorps($args)
            ];

            return $viewProps;
        }

        public function get_collectionProps($args)
        {
            return [
                'title' => 'User Review For ...',
                'columns' => 1,
                'items_display' => ['title', 'content'],
                'show_controls' => [
                    'search' => true,
                    'sort' => true,
                    'reviews' => true,
                    'verified' => false
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
                $items[] = [
                    'comment_id' => $comment->comment_ID,
                    'title' => $comment->review_props['title'],
                    'content' => $comment->comment_content,
                    'comment_author' => $comment->comment_author,
                    'comment_author_email' => $comment->comment_author_email,
                    'comment_date' => get_comment_date('d', $comment->comment_ID),
                    'rating' => $comment->review_props['rating'],
                    'stats_args' => $this->get_stat_args($args, $comment)
                ];
            }

            return $items;
        }

        public function get_stat_args($args, $comment)
        {
            $stat_args = $args;
            unset($stat_args['items']);
            $stat_args['items']['stats-list'] = $comment->review_props['stats'];
            return $stat_args;
        }
    }
}
