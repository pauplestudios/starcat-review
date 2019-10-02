<?php

namespace HelpieReviews\App\Components\Comparison;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Comparison\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Components\Comparison\Model();
            $this->view = new \HelpieReviews\App\Components\Comparison\View();
        }

        public function get_view($post_ids = [])
        {
            // error_log('$post_ids : ' . print_r($post_ids, true));
            $post_ids = [40, 42, 47, 49];

            $args = array(
                'post__in' => $post_ids,
                'post_type' => HELPIE_REVIEWS_POST_TYPE
            );

            $posts = get_posts($args);


            $stats = $this->model->get($posts);


            return $this->view->get_html($stats);
        }

        public function get_hrp_details($search_key)
        {
            // echo $search_key;
            $search_post_data = [];
            $search_post_data = array('Item1', 'Item2', 'Item3', 'Item4', 'Item5', 'Item6', 'Item7');
            $data = array('status' => '1', 'data' => $search_post_data);
            echo json_encode($data, true);
            wp_die();
        }
    } // END CLASS

}