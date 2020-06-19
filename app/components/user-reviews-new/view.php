<?php

namespace StarcatReview\App\Components\User_Reviews_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews_New\View')) {
    class View
    {
        private $html;

        public function __construct()
        {
            /* Views */
            // $this->card = new \StarcatReview\App\Views\Blocks\Enhanced_Card();
        }

        public function get($viewProps)
        {
            $html = '';

            $this->itemProps = $viewProps['items'];
            $this->collection = $viewProps['collection'];

            if ($this->collection['show_list_title']) {
                $html .= '<h3 class="ui dividing header"> ' . $this->collection['list_title'] . '</h3>';
            }

            $html .= '<div class="ui scr_user_reviews list comments">';
            if (isset($viewProps['items']) && !empty($viewProps['items'])) {
                foreach ($viewProps['items'] as $comment) {
                    $html .= $this->get_item($comment);
                }
            }

            $html .= $this->get_reply_form();

            $html .= '</div>';

            return $html;
        }

        protected function get_item($comment)
        {
            // $vote_likes = $this->get_vote_likes($comment);
            // error_log('$comment : ' . print_r($comment, true));
            $html = '<div class="comment" id="' . $comment['ID'] . '">';
            $html .= $this->get_avatar($comment);
            $html .= $this->get_content($comment);
            $html .= $this->get_text($comment);
            $html .= $this->get_moderation_info($comment);
            $html .= $this->get_actions($comment);

            // 1 level indentation of comment childrens
            // foreach ($items as $item) {
            //     if ($item['parent'] == $comment['comment_id'] && $this->can_view_comment($item)) {
            //         $html .= $this->get_reply_comment($item);
            //     }
            // }

            // $html .= '</div>';

            $html .= '</div>';

            return $html;
        }

        protected function get_avatar($comment)
        {
            return '<a class="avatar"> ' . $comment['avatar'] . '</a>';
        }

        protected function get_content($comment)
        {
            // $likes = (isset($comment['votes']['likes']) && !empty($comment['votes']['likes'])) ? $comment['votes']['likes'] : 0;
            // $rating = (isset($comment['stats']['overall']) && !empty($comment['stats']['overall'])) ? $comment['stats']['overall'] : 0;

            $html = '<div class="content">';
            $html .= '<span class="author"> ' . $comment['author'] . ' </span>';
            $html .= '<div class="metadata">';
            $html .= '<span class="date">' . $comment['date'] . '</span>';
            $html .= '<span class="time">AT ' . $comment['time'] . '</span>';
            $html .= '<span class="postDate" data-postDate="' . $comment['time_stamp'] . '"></span>'; // used by list-control.JS
            $html .= '<span class="likes" data-likes="' . $comment['likes'] . '"></span>'; // used by list-control.JS
            $html .= '<span class="positiveScore" data-positiveScore="' . $comment['rating'] . '"></span>'; // used by list-control.JS
            $html .= '</div>';

            return $html;

        }

        protected function get_text($comment)
        {
            $html = '<div class="text">';
            $html .= '<div class="title review-card__header"> ' . $comment['title'] . ' </div>';
            // $html .= '<div class="stats"> ' . $this->get_stats_view($comment) . '</div>';
            $html .= '<div class="description review-card__body"><p>' . $comment['content'] . '</p></div>';
            // $html .= $this->get_prosandcons_view($comment);

            $review_photos = apply_filters('scr_photo_reviews/get_single_review_photos', $comment);
            $review_photos_html = is_string($review_photos) ? $review_photos : '';

            $html .= $review_photos_html;

            $html .= '</div>';

            return $html;
        }

        protected function get_moderation_info($comment, $title = 'Review')
        {
            $html = '';
            if ($comment['approved'] == 0 && $comment['user_id'] == $this->collection['current_user_id']) {
                $html .= '<div class="comment_in_moderation">' . $title . ' in Moderation !</div>';
            }

            return $html;
        }

        protected function get_actions($comment)
        {
            $html = '';
            $html .= '<div class="actions">';
            $html .= $this->get_action_links($comment);
            $html .= $this->get_action_helpful($comment);
            // if ($this->collection['can_vote'] && $this->collection['enable_voting']) {
            //     $html .= $this->get_helpful($comment);
            // }
            $html .= '</div>';

            return $html;
        }

        private function get_action_links($comment)
        {
            $html = '<div class="links">';

            $can_reply = $this->collection['can_reply'];
            $can_edit_comment = $this->collection['can_reply'] && $comment['can_edit'];

            if ($can_reply) {
                $html .= '<a class="reply_link"><i class="reply icon"></i> REPLY</a>';
            }
            if ($can_edit_comment) {
                $html .= '<a class="edit_link"><i class="edit icon"></i> EDIT</a>';
            }
            // if ($this->collection['can_reply']) {
            //     $html .= '<a class="delete_link"><i class="delete icon"></i> DELETE</a>';
            // }

            $html .= '</div>';
            return $html;
        }
        private function get_action_helpful()
        {
            $html = '';
            return $html;
        }

        private function get_reply_form()
        {
            $html = '<form class="ui user-review-reply form" action="scr_user_review_submission" method="post" data-post-id ="' . $this->collection['post_id'] . '">';
            $html .= '<div class="field">';
            $html .= '<textarea rows="2" name="description" placeholder="Reply to @them ..." ></textarea>';
            $html .= '</div>';
            $html .= '<div class="ui mini icon blue submit button"><i class="plus circle icon"></i> REPLY</div>';
            $html .= '<div class="ui mini icon cancel button">Cancel</div>';
            $html .= '</form>';

            return $html;
        }

    } // END CLASS
}
