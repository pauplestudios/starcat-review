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
            $this->collection = $this->get_collectionProps($args);
            $viewProps = [
                'collection' => $this->collection,
                'items' => $this->get_itemPorps($args),
            ];

            return $viewProps;
        }

        public function get_collectionProps($args)
        {
            return [
                'post_id' => $args['post_id'],
                'show_list_title' => $args['show_list_title'],
                'list_title' => $args['list_title'],
                'enable_voting' => $args['enable_voting'],
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
                'can_reply' => $args['can_user_reply'],
                'can_vote' => $args['can_user_vote'],
                'current_user_id' => $args['current_user_id'],
            ];
        }

        protected function get_itemPorps($args)
        {
            $items = [];
            if (!isset($args['items']['comments-list']) && empty($args['items']['comments-list'])) {
                return $items;
            }

            foreach ($args['items']['comments-list'] as $comment) {
                // error_log('comment : ' . print_r($comment, true));

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
                'time_stamp' => get_comment_date('U', $comment->comment_ID),
                'comment_parent' => $comment->comment_parent,
                'comment_author' => ucfirst($comment->comment_author),
                'comment_author_email' => $comment->comment_author_email,
                'commentor_avatar' => get_avatar($comment->user_id),
                'comment_approved' => $comment->comment_approved,
                'user_id' => $comment->user_id,
                'comment_author_IP' => $comment->comment_author_IP,
            ];

            $comment_item['can_edit'] = ($comment->user_id == $this->collection['current_user_id']);

            if (isset($args)) {
                $comment_item['args'] = $this->get_args($args, $comment);
            }

            if (isset($comment->review) && !empty($comment->review)) {
                $comment_item['title'] = $comment->review['title'];
                $comment_item['rating'] = $comment->review['rating'];
            }

            // Used by non-logged-in-user
            $comment_item = apply_filters('scr_get_comment_item', $comment_item, $comment);

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

            if (isset($comment->review['votes']) && !empty($comment->review['votes'])) {
                $args['items']['votes'] = $this->get_votes($comment->review['votes']);
            }

            if (isset($comment->review['attachments']) && !empty($comment->review['attachments'])) {
                $args['items']['attachments'] = $this->get_attachments_with_src($comment);
            }

            return $args;
        }

        private function get_comment_time($date)
        {
            $date = mysql2date(get_option('time_format'), $date, true);

            return apply_filters('get_comment_time', $date);
        }

        // TODO: Move to own class?
        public function get_votes($items)
        {
            $votes = [
                'total' => $items,
                'summary' => $this->get_vote_summary($items),
            ];

            // error_log('items : ' . print_r($items, true));
            // error_log('Votes : ' . print_r($votes, true));
            return $votes;
        }

        protected function get_vote_summary($votes)
        {
            $summary = [
                'likes' => 0,
                'dislikes' => 0,
                'active' => 0,
                'people' => 0,
            ];

            foreach ($votes as $vote) {

                // Is active Like or DisLike or Not
                if ($this->collection['current_user_id'] == $vote['user_id']) {
                    if (($vote['vote'] == 1)) {
                        $summary['active'] = 'like';
                    } elseif (($vote['vote'] == -1)) {
                        $summary['active'] = 'dislike';
                    } else {
                        $summary['active'] = 0;
                    }
                }

                // Likes
                if ($vote['vote'] == 1) {
                    $summary['likes']++;
                }

                // Dislikes
                if ($vote['vote'] == -1) {
                    $summary['dislikes']++;
                }
                // poeple
                $summary['people']++;
            }

            return $summary;
        }

        protected function get_attachments_with_src($comment)
        {
            $photos = [];
            for ($ii = 0; $ii < sizeof($comment->review['attachments']); $ii++) {
                $photos[$ii] = [
                    'id' => $comment->review['attachments'][$ii],
                    'review_id' => $comment->comment_ID,
                    'url' => wp_get_attachment_image_src($comment->review['attachments'][$ii], 'medium')[0],
                ];
            }

            return $photos;
        }
    }
}
