<?php

namespace StarcatReview\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews\View')) {
    class View
    {
        private $html;

        public function __construct()
        {
            /* Views */
            $this->card = new \StarcatReview\App\Views\Blocks\Enhanced_Card();
            $this->controls_builder = new \StarcatReview\App\Builders\Controls_Builder();
        }

        public function get($viewProps)
        {
            if (!isset($viewProps['items']) || empty($viewProps['items'])) {
                return '';
            }
            $this->collection = $viewProps['collection'];

            $html = '<div class="ui scr_user_reviews comments">';
            $html .= '<h3 class="ui dividing header"> User Reviews </h3>';

            foreach ($viewProps['items'] as $comment) {

                if ($this->is_can_view($comment) && $comment['comment_parent'] == 0) {
                    $html .= $this->get_comment_item($comment, $viewProps['items']);
                }
            }

            $html .= $this->get_reply_form();

            $html .= '</div>';

            return $html;
        }

        protected function is_can_view($comment)
        {
            $can = false;

            if ($comment['comment_approved'] == 1 || $comment['user_id'] == $this->collection['current_user_id']) {
                $can = true;
            }

            return $can;
        }

        public function get_reply_comment($comment)
        {
            $html = '<div class="comment" id="' . $comment['comment_id'] . '" data-comment-parent-id ="' . $comment['comment_parent'] . '" >';
            $html .= '<a class="avatar"> ' . $comment['commentor_avatar'] . '</a>';
            $html .= '<div class="content">';

            $html .= '<span class="author"> ' . $comment['comment_author'] . ' </span>';
            $html .= '<div class="metadata">';
            $html .= '<span class="date">' . $comment['comment_date'] . '</span>';
            $html .= '<span class="time">AT ' . $comment['comment_time'] . '</span>';
            $html .= '</div>';
            $html .= '<div class="text">' . $comment['content'] . '</div>';
            $html .= $this->get_moderation_html($comment, 'Reply');
            $html .= '<div class="actions">';
            $html .= '<div class="links">';
            if ($this->collection['can_reply'] && $comment['can_edit']) {
                $html .= '<a class="reply_edit_link"><i class="edit icon"></i> EDIT</a>';
            }
            $html .= '</div></div>';

            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        protected function get_moderation_html($comment, $title = 'Review')
        {
            $html = '';
            if ($comment['comment_approved'] == 0 && $comment['user_id'] == $this->collection['current_user_id']) {
                $html .= '<div class="comment_in_moderation">' . $title . ' in Moderation !</div>';
            }

            return $html;
        }

        protected function get_comment_item($comment, $items)
        {
            $html = '<div class="comment" id="' . $comment['comment_id'] . '">';
            $html .= '<a class="avatar"> ' . $comment['commentor_avatar'] . '</a>';

            $html .= '<div class="content">';

            $html .= '<span class="author"> ' . $comment['comment_author'] . ' </span>';
            $html .= '<div class="metadata">';
            $html .= '<span class="date">' . $comment['comment_date'] . '</span>';
            $html .= '<span class="time">AT ' . $comment['comment_time'] . '</span>';
            $html .= '</div>';

            $html .= '<div class="text">';
            $html .= '<div class="title"> ' . $comment['title'] . ' </div>';
            $html .= '<div class="stats"> ' . $this->get_stats_view($comment) . '</div>';
            $html .= $this->get_prosandcons_view($comment);
            $html .= '<div class="description">' . $comment['content'] . '</div>';
            $html .= '</div>';
            $html .= $this->get_moderation_html($comment);

            $html .= '<div class="actions">';
            $html .= '<div class="links">';
            if ($this->collection['can_reply']) {
                $html .= '<a class="reply_link"><i class="reply icon"></i> REPLY</a>';
            }
            if ($this->collection['can_reply'] && $comment['can_edit']) {
                $html .= '<a class="edit_link"><i class="edit icon"></i> EDIT</a>';
            }
            // if ($this->collection['can_reply']) {
            //     $html .= '<a class="delete_link"><i class="delete icon"></i> DELETE</a>';
            // }

            $html .= '</div>';
            // $html .= $this->get_helpful();
            $html .= '</div>';

            //1st level comment children
            foreach ($items as $item) {
                if ($item['comment_parent'] == $comment['comment_id'] && $this->is_can_view($item)) {
                    $html .= $this->get_reply_comment($item);
                }
            }

            $html .= '</div>';

            $html .= '</div>';

            return $html;

        }

        private function get_stats_view($props)
        {
            $stats = new \StarcatReview\App\Components\Stats\Controller($props['args']);
            $view = $stats->get_view();

            return $view;
        }

        private function get_prosandcons_view($props)
        {
            $view = '';
            if ($props['args']['enable_pros_cons']) {
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller($props['args']);
                $view = $prosandcons->get_view();
            }

            return $view;
        }

        private function get_helpful()
        {
            $html = '<div class="ui user-review-helpful"> ';

            $html .= '<div class="vote">';
            $html .= 'Was this helpful to you ? ';
            $html .= '<a><i class="green bordered thumbs up outline icon"></i></a>';
            $html .= '<a><i class="red bordered thumbs down outline icon"></i></a>';
            $html .= '</div>';

            $html .= '<div class="vote-summary">';
            $html .= '0 of 0 people found this review helpful';
            $html .= '</div>';

            $html .= '</div>';

            return $html;
        }

        private function get_reply_form()
        {
            $html = '<form class="ui user-review-reply form" action="scr_user_review_submission" method="post" data-post-id ="' . $this->collection['post_id'] . '">';
            $html .= '<div class="field">';
            $html .= '<textarea rows="2" name="description" placeholder="Reply to @them ..." ></textarea>';
            $html .= '</div>';
            $html .= '<div class="ui mini icon basic submit button"><i class="plus circle icon"></i> REPLY</div>';
            $html .= '</form>';

            return $html;
        }

        private function get_excerpt($content)
        {
            $word_count = 150;
            $excerpt = $content;
            $excerpt = strip_tags($excerpt);
            $excerpt = substr($excerpt, 0, $word_count);
            $excerpt .= ' ...';

            return $excerpt;
        }
    } // END CLASS
}
