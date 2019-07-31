<?php

namespace HelpieReviews\App\Widgets\Comparison;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Comparison\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Widgets\Comparison\Model();
            $this->view = new \HelpieReviews\App\Widgets\Comparison\View();
        }

        public function get_view($post_ids = [])
        {
            // error_log('$post_ids : ' . print_r($post_ids, true));
            $args = array(
                'post__in' => $post_ids,
                'post_type' => HELPIE_REVIEWS_POST_TYPE
            );

            $posts = get_posts($args);

            // error_log('$posts : ' . print_r($posts, true));

            $stats = $this->model->get($posts);
            return $this->view->get_html($stats);
        }
    } // END CLASS

}