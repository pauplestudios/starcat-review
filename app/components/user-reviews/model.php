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
            $this->args = $args;

            $collection = $this->get_collectionProps($args);
            $items = $this->get_itemProps($args);

            // error_log('args["items"] : ' . print_r($items, true));
            $viewProps = [
                'collection' => $collection,
                'items' => $items,
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
                'current_user_id' => $args['current_user_id'],
                'capability' => $args['capability'],
            ];
        }

        protected function get_itemProps($args)
        {
            $items = [];

            if (isset($args['items']['comments']) && !empty($args['items']['comments'])) {
                foreach ($args['items']['comments'] as $comment) {
                    $components_item = $this->get_components_item($args['items'], $comment['ID']);
                    $items[$comment['ID']] = array_merge($comment, $components_item);

                    // Childrens of comments
                    $items[$comment['ID']]['childrens'] = scr_get_comments_args(['comments'], ['parent' => $comment['ID']]);
                }
            }

            return $items;
        }

        protected function get_components_item($items, $comment_id)
        {
            $item = [
                'likes' => 0,
                'rating' => 0,
                'props' => [],
            ];

            if (isset($items['stats'][$comment_id]) && !empty($items['stats'][$comment_id])) {
                $item['stats'] = array_merge($this->args['stats_args'], ['items' => $items['stats'][$comment_id]]);
                $item['rating'] = $items['stats'][$comment_id]['overall'];
                $item['props']['stats'] = $items['stats'][$comment_id]['stats'];
            }
            if (isset($items['prosandcons'][$comment_id]) && !empty($items['prosandcons'][$comment_id])) {
                $item['prosandcons'] = $items['prosandcons'][$comment_id];
                $item['props']['prosandcons'] = $items['prosandcons'][$comment_id]['items'];

            }
            if (isset($items['votes'][$comment_id]) && !empty($items['votes'][$comment_id])) {
                $item['votes'] = $items['votes'][$comment_id];
                $item['likes'] = $items['votes'][$comment_id]['likes'];
            }
            if (isset($items['attachments'][$comment_id]) && !empty($items['attachments'][$comment_id])) {
                $item['attachments'] = $items['attachments'][$comment_id];
                $item['props']['attachments'] = $items['attachments'][$comment_id];

            }

            return $item;
        }
    }
}
