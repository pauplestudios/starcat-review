<?php


namespace HelpieReviews\App\Widgets\Listing;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Listing\View')) {
    class View
    {
        private $html;

        public function __construct()
        {
            /* Views */
            $this->card = new \HelpieReviews\App\Views\Blocks\Card();
            $this->controls_builder = new \HelpieReviews\App\Builders\Controls_Builder();
        }

        public function get_html($viewProps)
        {
            $html = '<div id="hrp-controlled-list">';
            $html .= $this->controls_builder->get_controls();

            $html .= '<div id="hrp-cat-collection" class="hrp-collection list row">';

            $posts = $viewProps['items'];

            foreach ($posts as $key => $post) {
                if (!isset($ii)) $ii = 0;
                $reviews = [2, 4, 7, 25, 50, 75, 100];


                $excerpt = $this->get_excerpt($post->post_content);
                $single_review = isset($reviews[$ii]) ? $reviews[$ii] : 1;

                $item = ['title' => $post->post_title, 'content' => $excerpt, 'url' => '', 'reviews' => $single_review];

                $html .= $this->card->get_view($item);
                $ii++;
            }

            $html .= '</div>';
            $html .= '<ul class="ui pagination hrp-pagination menu"></ul>';
            $html .= '</div>';

            return $html;
        }

        /* PRIVATE CLASS */

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