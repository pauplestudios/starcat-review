<?php

namespace StarcatReview\App\Components\User_Reviews_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews_New\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            $this->args = $args;
            // error_log('args["arags"] : ' . print_r($this->args, true));

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
                'can_reply' => $args['can_user_reply'],
                'can_vote' => $args['can_user_vote'],
                'current_user_id' => $args['current_user_id'],
            ];
        }

        protected function get_itemProps($args)
        {
            $items = [];

            if (isset($args['items']['comments']) && !empty($args['items']['comments'])) {
                foreach ($args['items']['comments'] as $comment) {
                    $components_item = $this->get_components_item($args['items'], $comment['ID']);
                    $items[$comment['ID']] = array_merge($comment, $components_item);
                }
            }

            /*
             * Parent comment filter
             * components level filters 'stats', 'prosandcons', 'attachments', votes
             */

            /*
             * Child comment filter
             */

            return $items;
        }

        protected function get_components_item($items, $comment_id)
        {
            $item = [
                'likes' => 0,
                'rating' => 0,
            ];

            if (isset($items['stats'][$comment_id]) && !empty($items['stats'][$comment_id])) {
                $item['stats'] = array_merge($this->args['stats_args'], ['items' => $items['stats'][$comment_id]]);
                $item['rating'] = $items['stats'][$comment_id]['overall'];
            }
            if (isset($items['prosandcons'][$comment_id]) && !empty($items['prosandcons'][$comment_id])) {
                $item['prosandcons'] = $items['prosandcons'][$comment_id];
            }
            if (isset($items['votes'][$comment_id]) && !empty($items['votes'][$comment_id])) {
                $item['votes'] = $items['votes'][$comment_id];
                $item['likes'] = $items['votes'][$comment_id]['likes'];
            }
            if (isset($items['attachments'][$comment_id]) && !empty($items['attachments'][$comment_id])) {
                $item['attachments'] = $items['attachments'][$comment_id];
            }

            return $item;
        }

        private function get_vote_likes($props)
        {
            $vote_summary = 0;

            if (isset($props['args']['items']['votes']['summary']) && is_int($props['args']['items']['votes']['summary']['likes'])) {
                $vote_summary = $props['args']['items']['votes']['summary']['likes'];
            }

            return $vote_summary;
        }

        private function get_helpful($props)
        {
            $vote_summary = $this->get_vote_summary($props);

            $like_active = ($vote_summary['active'] === 'like') ? 'active' : '';
            $dislike_active = ($vote_summary['active'] === 'dislike') ? 'active' : '';

            $html = '<div class="helpful"> ';

            $html .= '<div class="vote likes-and-dislikes" data-comment-id="' . $props['comment_id'] . '">';
            $html .= 'Was this helpful to you ? ';
            $html .= '<a class="like ' . $like_active . '"><i class="bordered thumbs up outline icon"></i><span class="likes">' . $vote_summary['likes'] . '</span></a>';
            $html .= '<a class="dislike ' . $dislike_active . '"><i class="bordered thumbs down outline icon"></i><span class="dislikes">' . $vote_summary['dislikes'] . '</span></a>';
            $html .= '</div>';

            $html .= '<div class="vote-summary">';
            $html .= '<span class="helpful">' . $vote_summary['likes'] . '</span> of <span class="people"> ' . $vote_summary['people'] . ' </span> people found this review helpful';
            $html .= '</div>';

            $html .= '</div>';

            return $html;
        }

        private function get_vote_summary($props)
        {
            // Default
            $vote_summary = [
                'active' => '',
                'likes' => 0,
                'dislikes' => 0,
                'people' => 0,
            ];

            if (isset($props['args']['items']['votes'])) {
                $vote_summary = $props['args']['items']['votes']['summary'];
            }

            return $vote_summary;
        }
    }
}
