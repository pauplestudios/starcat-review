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
            $collectionProps = $viewProps['collection'];

            //  error_log('$collectionProps : ' . print_r($collectionProps, true));

            $html = '<div id="hrp-controlled-list">';
            $html .= '<h2>' . $collectionProps['title'] . '</h2>';


            if ($collectionProps['show_controls']) {
                $html .= $this->controls_builder->get_controls($collectionProps['show_controls']);
            }


            $html .= $this->get_card_collection($viewProps);

            /* Pagination */
            if ($collectionProps['pagination']) {
                $html .= '<ul class="ui pagination hrp-pagination menu"></ul>';
            }

            $html .= '</div>';

            return $html;
        }

        /* PRIVATE CLASS */

        private function get_card_collection($viewProps)
        {
            $posts = $viewProps['items'];

            $html = '';
            $html .= '<div id="hrp-cat-collection" class="hrp-collection list row">';

            foreach ($posts as $key => $post) {
                // Set initial $ii
                if (!isset($ii)) $ii = 0;

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
            $collectionProps = $viewProps['collection'];
            $reviews = [2, 4, 7, 25, 50, 75, 100];


            $excerpt = $this->get_excerpt($post->post_content);
            $single_review = isset($reviews[$ii]) ? $reviews[$ii] : 1;

            $item = [
                'title' => $post->post_title,
                'content' => $excerpt,
                'url' => '',
                'reviews' => $single_review,
                'columns' => $collectionProps['columns'],
                'items_display' => $collectionProps['items_display']
            ];

            return $this->card->get_view($item);
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