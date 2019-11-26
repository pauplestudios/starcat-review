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
            $collectionProps = $viewProps['collection'];

            if (!isset($viewProps['items']) || empty($viewProps['items'])) {
                return '';
            }

            $html = '<div class="ui threaded scr_user_reviews comments">';
            $html .= '<h3 class="ui dividing header"> User Reviews </h3>';

            foreach ($viewProps['items'] as $comment) {
                $html .= $this->get_item($comment);
            }

            // $html .= $this->get_comment2();
            // $html .= $this->get_comment();
            // $html .= $this->get_comment2();
            $html .= '</div>';

            return $html;
        }

        protected function get_item($comment)
        {
            $html = '<div class="comment" id="' . $comment['comment_id'] . '">';
            $html .= '<a class="avatar"> ' . $comment['commentor_avatar'] . '</a>';

            $html .= '<div class="content">';
            $html .= '<span class="author"> ' . $comment['comment_author'] . ' </span>';
            $html .= '<div class="metadata"> <span class="date"> ' . $comment['comment_date'] . '</span> </div>';

            $html .= '<div class="text">';
            $html .= '<div class="title"> ' . $comment['title'] . ' </div>';
            $html .= '<div class="stats"> ' . $this->get_stats_view($comment) . '</div>';
            $html .= '<div class="prosandcons"> ' . $this->get_prosandcons_view($comment) . '</div>';
            $html .= '<div class="content"> ' . $comment['content'] . ' </div>';
            $html .= '</div>';

            $html .= '<div class="actions"> <a class="reply">Reply</a> </div>';
            $html .= '</div>';

            $html .= '</div>';

            return $html;

        }

        protected function get_comment()
        {
            $html = '<div class="comment">';
            $html .= '<a class="avatar"> <img src="https://semantic-ui.com/images/avatar/small/joe.jpg"> </a>';
            $html .= '<div class="content">';
            $html .= '<a class="author">Joe Henderson</a>';
            $html .= '<div class="metadata"> <span class="date">5 days ago</span> </div>';
            $html .= '<div class="text">
                    First thing you’d notice about this product is the stealthy nature of its built.
                </div>';
            $html .= '<div class="actions">
                    <a class="reply">Reply</a>
                </div>';
            $html .= '</div>';
            $html .= $this->get_comments();
            $html .= '</div>';

            return $html;

        }

        protected function get_comment2()
        {
            $html = '<div class="comment">';
            $html .= '<a class="avatar"> <img src="https://semantic-ui.com/images/avatar/small/joe.jpg"> </a>';
            $html .= '<div class="content">';
            $html .= '<a class="author">Joe Henderson</a>';
            $html .= '<div class="metadata"> <span class="date">5 days ago</span> </div>';
            $html .= '<div class="text">
                    First thing you’d notice about this product is the stealthy nature of its built. True to its name Bose manages to provide a balanced sound out that sits just right for most ears without being too bass heavy. Frequency response as per my test sits between 35 hz - 15 khz. Best feature of this pair is the listening comfort. Most comfortable headphones I ever owned. Period. Does amazing job in filtering out ambient noice but I would suggest using this feature sparingly when it is actually required as it drains the battery faster. Overall a superior device and best in class for a refined and dignified listening experience.
                </div>';
            $html .= '<div class="actions">
                    <a class="reply">Reply</a>
                </div>';
            $html .= '</div>';
            $html .= '</div>';

            return $html;

        }

        protected function get_comments()
        {
            $html = '<div class="comments">';
            $html .= '<div class="comment">';
            $html .= '<a class="avatar"> <img src="https://semantic-ui.com/images/avatar/small/joe.jpg"> </a>';
            $html .= '<div class="content">';
            $html .= '<a class="author">Joe Henderson</a>';
            $html .= '<div class="metadata"> <span class="date">5 days ago</span> </div>';
            $html .= '<div class="text">
                    First thing you’d notice about this product is the stealthy nature of its built. True to its name Bose manages to provide a balanced sound out that sits just right for most ears without being too bass heavy. Frequency response as per my test sits between 35 hz - 15 khz. Best feature of this pair is the listening comfort. Most comfortable headphones I ever owned. Period. Does amazing job in filtering out ambient noice but I would suggest using this feature sparingly when it is actually required as it drains the battery faster. Overall a superior device and best in class for a refined and dignified listening experience.
                </div>';
            $html .= '<div class="actions">
                    <a class="reply">Reply</a>
                </div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';

            return $html;

        }

        protected function get_reply_form()
        {
            $html = '<form class="ui reply form">
                <div class="field">
                <textarea spellcheck="false"></textarea>
                </div>
                <div class="ui blue labeled submit icon button">
                <i class="icon edit"></i> Add Reply
                </div>
            </form>';

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
