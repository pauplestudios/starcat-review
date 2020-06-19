<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Review')) {
    class Review
    {
        public function __construct()
        {
            error_log('!!! Review !!!');
            add_filter('woocommerce_product_review_comment_form_args', [$this, 'add_fields']);
            add_action('comment_post', [$this, 'save_form_field'], 1);
        }

        public function add_fields($args)
        {
            return $this->get_form_fields($args);
        }

        public function save_fields()
        {

        }

        public function trigger_function_hook()
        {

        }

        protected function get_form_fields($args)
        {
            $user_review = new \StarcatReview\App\Widget_Makers\User_Review();

            // $args['comment_field'] = $user_review->get_form_fields() . $args['comment_field'];
            $args['comment_field'] = $user_review->get_form_fields();

            // $args['class_form'] = 'comment-form ui form scr-user-review';

            return $args;
        }

        public function save_form_field($comment_id)
        {
            error_log('Before $_POST : ' . print_r($_POST, true));
            $props = $this->get_processing_data();
            error_log('Props : ' . print_r($props, true));
            error_log('After $_POST : ' . print_r($_POST, true));

            if (isset($_POST['rating'], $_POST['comment_post_ID']) && 'product' === get_post_type(absint($_POST['comment_post_ID']))) {
                add_comment_meta($comment_id, 'scr_user_review_props', $props, true);
            }
            // wp_die();
        }

        protected function get_processing_data()
        {
            $props = [];
            $user_review_repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();

            if (isset($_POST['title']) && !empty($_POST['title'])) {
                $props['title'] = $_POST['title'];
            }

            if (isset($_POST['scores']) && !empty($_POST['scores'])) {
                $props['rating'] = $user_review_repo->get_rating($_POST['scores']);
                // $props['stats'] = $this->get_stat($_POST['scores']);
                $_POST['rating'] = $props['rating'] / 20;
            }

            if (isset($_POST['description']) && !empty($_POST['description'])) {
                $props['description'] = $_POST['description'];
                $_POST['comment'] = $props['description'];
            }

            if (isset($_POST['pros']) && !empty($_POST['pros'])) {
                $props['pros'] = $user_review_repo->get_prosandcons($_POST['pros']);
            }

            if (isset($_POST['cons']) && !empty($_POST['cons'])) {
                $props['cons'] = $user_review_repo->get_prosandcons($_POST['cons']);
            }

            return $props;
        }

    }
}
