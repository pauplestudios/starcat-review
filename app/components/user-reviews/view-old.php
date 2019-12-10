<?php

namespace StarcatReview\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews\View_Old')) {
    class View_Old
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

            $html = '<div id="scr-controlled-list">';
            $html .= '<h3>' . $collectionProps['title'] . '</h3>';

            if ($collectionProps['show_controls']) {
                $html .= $this->controls_builder->get_controls($collectionProps['show_controls']);
            }

            $html .= $this->get_card_collection($viewProps);

            /* Pagination */
            if ($collectionProps['pagination']) {
                $html .= '<ul class="ui pagination scr-pagination menu"></ul>';
                $html .= $this->get_pagination_html($viewProps);
            }

            $html .= '</div>';

            // error_log('$html; : ' . $html );
            return $html;
        }

        /* PRIVATE CLASS */

        private function get_pagination_html($viewProps)
        {
            if (!isset($viewProps['collection']['total_pages']) || empty($viewProps['collection']['total_pages'])) {
                return '';
            }

            $html = '';
            $html .= '<ul class="ui pagination scr-pagination menu">';

            for ($ii = 1; $ii <= $viewProps['collection']['total_pages']; $ii++) {
                # code...
                $html .= '<li class="active"><a class="page" href="">' . $ii . '</a></li>';
            }

            $html .= '</ul>';
            return $html;
        }

        private function get_card_collection($viewProps)
        {
            $posts = $viewProps['items'];

            $html = '';
            // $html .= '<div class="">';
            $html .= '<div id="scr-cat-collection" class="scr-collection list row ui comments">';

            foreach ($posts as $key => $post) {

                // Set initial $ii
                if (!isset($ii)) {
                    $ii = 0;
                }

                // Assign card to html
                $html .= $this->get_single_card($post, $ii, $viewProps);

                // increment $ii
                $ii++;
            }

            $html .= '</div>';

            return $html;
        }

        private function get_single_card($post, $ii, $viewProps)
        {
            // error_log('$post : ' . print_r($post, true));
            $collectionProps = $viewProps['collection'];
            $reviews = [2, 4, 7, 25, 50, 75, 100];

            // $excerpt = $this->get_excerpt($post->post_content);
            $single_review = isset($reviews[$ii]) ? $reviews[$ii] : 1;

            $stats_html = $this->get_stats_view($post);

            $prosandcons_html = $this->get_prosandcons_view($post);
            $item = [
                'title' => $post['title'],
                'content' => $post['content'],
                'url' => '',
                'reviews' => $single_review,
                'date' => $post['comment_date'],
                'avatar' => $post['commentor_avatar'],
                'author' => $post['comment_author'],
                'columns' => $collectionProps['columns'],
                // 'items_display' => $collectionProps['items_display'],
                'html_parts' => [
                    'title',
                    $stats_html,
                    'content',
                    $prosandcons_html,
                ],
            ];

            return $this->card->get_view($item);
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
