<?php

namespace StarcatReview\App\Components\User_Reviews_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews_New\View')) {
    class View
    {
        public function get($viewProps)
        {
            $html = '';

            $this->itemProps = $viewProps['items'];
            $this->collection = $viewProps['collection'];

            // if ($this->collection['show_list_title']) {
            //     $html .= '<h3 class="ui dividing header"> ' . $this->collection['list_title'] . '</h3>';
            // }

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

        public function get_item($comment)
        {
            $html = '<div class="comment" id="' . $comment['ID'] . '">';
            $html .= $this->get_avatar($comment);

            $html .= '<div class="content">';
            $html .= $this->get_content_meta($comment);
            $html .= $this->get_content_text($comment);
            $html .= $this->get_content_moderation_info($comment);
            $html .= $this->get_content_actions($comment);

            // 1 level indentation of comment childrens
            if ($comment['parent'] == 0 && isset($comment['childrens']) && !empty($comment['childrens'])) {
                foreach ($comment['childrens'] as $child_comment) {
                    $html .= $this->get_child_item($child_comment);
                }
            }
            $html . '</div>';

            $html .= '</div>';

            return $html;
        }

        public function get_child_item($comment)
        {
            $html = '<div class="comment" id="' . $comment['ID'] . '" data-comment-parent-id ="' . $comment['parent'] . '" >';
            $html .= $this->get_avatar($comment);

            $html .= '<div class="content">';
            $html .= $this->get_content_meta($comment);
            $html .= '<div class="text">' . $comment['content'] . '</div>';
            $html .= $this->get_content_moderation_info($comment, 'Reply');

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

        protected function get_avatar($comment)
        {
            return '<a class="avatar"> ' . $comment['avatar'] . '</a>';
        }

        protected function get_content_meta($comment)
        {
            $html = '';
            $html .= '<span class="author"> ' . $comment['author'] . ' </span>';
            $html .= '<div class="metadata">';
            $html .= '<span class="date">' . $comment['date'] . '</span>';
            $html .= '<span class="time">AT ' . $comment['time'] . '</span>';

            if ($comment['parent'] == 0) {
                $html .= '<span class="postDate" data-postDate="' . $comment['time_stamp'] . '"></span>'; // used by list-control.JS
                $html .= '<span class="likes" data-likes="' . $comment['likes'] . '"></span>'; // used by list-control.JS
                $html .= '<span class="positiveScore" data-positiveScore="' . $comment['rating'] . '"></span>'; // used by list-control.JS
            }

            $html .= '</div>';

            return $html;

        }

        protected function get_content_text($comment)
        {
            $title = '';
            $stats_view = '';
            $prosandcons_view = '';
            if (isset($comment['stats'])) {
                $stats = new \StarcatReview\App\Components\Stats\Controller($comment['stats']);
                $stats_view = $stats->get_view();
            }

            if (isset($comment['prosandcons'])) {
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                $prosandcons_view = $prosandcons->get_view($comment['prosandcons']);
            }

            if (isset($comment['title'])) {
                $title_html = '<div class="title review-card__header"> ' . $comment['title'] . ' </div>';
            }

            $html = '<div class="text">';
            $html .= $title;
            $html .= '<div class="stats"> ' . $stats_view . '</div>';
            $html .= '<div class="description review-card__body"><p>' . $comment['content'] . '</p></div>';
            $html .= $prosandcons_view;

            $review_photos = apply_filters('scr_photo_reviews/get_single_review_photos', $comment);
            $review_photos_html = is_string($review_photos) ? $review_photos : '';

            $html .= $review_photos_html;

            $html .= '</div>';

            return $html;
        }

        protected function get_content_moderation_info($comment, $title = 'Review')
        {
            $html = '';
            if ($comment['approved'] == 0 && $comment['user_id'] == $this->collection['current_user_id']) {
                $html .= '<div class="comment_in_moderation">' . $title . ' in Moderation !</div>';
            }

            return $html;
        }

        protected function get_content_actions($comment)
        {
            $html = '';
            $html .= '<div class="actions">';
            $html .= $this->get_action_links($comment);
            $html .= $this->get_action_helpful($comment);
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

        private function get_action_helpful($comment)
        {
            $vote_summary = $comment['votes'];

            $like_active = ($vote_summary['active'] === 'like') ? 'active' : '';
            $dislike_active = ($vote_summary['active'] === 'dislike') ? 'active' : '';

            $html = '<div class="helpful"> ';
            if ($this->collection['can_vote'] && $this->collection['enable_voting']) {
                $html .= '<div class="vote likes-and-dislikes" data-comment-id="' . $comment['ID'] . '">';
                $html .= 'Was this helpful to you ? ';
                $html .= '<a class="like ' . $like_active . '"><i class="bordered thumbs up outline icon"></i><span class="likes">' . $vote_summary['likes'] . '</span></a>';
                $html .= '<a class="dislike ' . $dislike_active . '"><i class="bordered thumbs down outline icon"></i><span class="dislikes">' . $vote_summary['dislikes'] . '</span></a>';
                $html .= '</div>';
            }
            $html .= '<div class="vote-summary">';
            $html .= '<span class="helpful">' . $vote_summary['likes'] . '</span> of <span class="people"> ' . $vote_summary['people'] . ' </span> people found this review helpful';
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
            $html .= '<div class="ui mini icon blue submit button"><i class="plus circle icon"></i> REPLY</div>';
            $html .= '<div class="ui mini icon cancel button">Cancel</div>';
            $html .= '</form>';

            return $html;
        }

    } // END CLASS
}
