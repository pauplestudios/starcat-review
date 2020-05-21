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

            $args['comment_field'] = $user_review->get_form_fields();
            // $args['class_form'] = 'comment-form ui form scr-user-review';

            return $args;
        }

    }
}
