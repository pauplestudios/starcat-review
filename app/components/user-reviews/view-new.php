<?php

namespace StarcatReview\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews\View_New')) {
    class View_New
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

            $html = '<div class="ui scr_user_reviews comments">';
            $html .= '<h3 class="ui dividing header"> User Reviews </h3>';

            foreach ($viewProps['items'] as $comment) {
                $html .= $this->get_comment_item($comment);
            }

            $html .= $this->get_reply_form($viewProps['collection']['post_id']);

            $html .= '</div>';

            return $html;
        }

        protected function get_comment_item($comment)
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

            $html .= '<div class="actions">';
            $html .= '<div><a class="reply_link"><i class="reply icon"></i> REPLY</a></div>';
            $html .= $this->get_helpful();
            $html .= '</div>';

            $html .= '</div>';

            $html .= '</div>';

            return $html;

        }

        protected function get_stats_view($props)
        {
            $stats = new \StarcatReview\App\Components\Stats\Controller($props['args']);
            $view = $stats->get_view();

            return $view;
        }

        protected function get_prosandcons_view($props)
        {
            $view = '';
            if ($props['args']['enable_pros_cons']) {
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller($props['args']);
                $view = $prosandcons->get_view();
            }

            return $view;
        }

        protected function get_helpful()
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

        protected function get_reply_form($post_id)
        {
            $html = '<form class="ui user-review-reply form" action="scr_user_review_submission" method="post" data-post-id ="' . $post_id . '">
                <div class="field">';
            $html .= '<textarea rows="2" name="description" placeholder="Reply to @them ..." ></textarea>';
            // $html .= $this->get_wp_editor_inlite();

            $html .= '</div>
                <div class="ui mini icon basic submit button"><i class="plus circle icon"></i> REPLY</div>
            </form>';

            // $html .= ;

            return $html;
        }

        public function get_wp_editor_inlite()
        {
            $html = "<div class='helpie-wp-editor-container'>";

            ob_start();
            wp_editor('', 'singleticketeditor');
            $html .= ob_get_contents();
            ob_end_clean();

            $html .= '</div>';

            return $html;
        }

        public function get_comment($comment)
        {
            $html = '<div class="comment" id="' . $comment['comment_id'] . '" >';
            $html .= '<a class="avatar"> ' . $comment['commentor_avatar'] . '</a>';
            $html .= '<div class="content">';

            $html .= '<span class="author"> ' . $comment['comment_author'] . ' </span>';
            $html .= '<div class="metadata">';
            $html .= '<span class="date">' . $comment['comment_date'] . '</span>';
            $html .= '<span class="time">AT ' . $comment['comment_time'] . '</span>';
            $html .= '</div>';
            $html .= '<div class="text"> ' . $comment['content'] . '</div>';

            $html .= '</div>';
            $html .= '</div>';

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
