<?php

namespace StarcatReview\Features\Woocommerce;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce\Controller')) {
    class Controller
    {
        public function __construct()
        {
            // $this->model = new \StarcatReview\Features\Woocommerce\Model();
            error_log('!!! Woocommerce !!!');
        }

        public function run_hooks()
        {
            error_log('!!! WooCommerce Controller run_hooks !!!');

            add_action('comment_form_logged_in_after', [$this, 'add_review_title_field_on_comment_form']);
            add_action('comment_form_after_fields', [$this, 'add_review_title_field_on_comment_form']);

            // add_action('comment_form_logged_in_after', [$this, 'get_pros_and_cons']);
            // add_action('comment_form_after_fields', [$this, 'get_pros_and_cons']);
            // add_filter('comment_form_defaults', [$this, 'comment_form_defaults']);

            // add_action('woocommerce_review_comment_text', [$this, 'some']);
            add_filter('woocommerce_product_review_comment_form_args', [$this, 'comment_form_args']);
            // add_filter('woocommerce_product_review_list_args', [$this, 'review_list_args']);
        }

        public function comment_form_defaults($args)
        {
            $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
            // $args['comment_field'] = $args['comment_field'] . $prosandcons->get_fields([]);

            $args['class_form'] = 'ui form' . ' ' . $args['class_form'];
            error_log('comment_form_defaults : ' . print_r($args, true));

            return $args;
        }

        public function comment_form_args($args)
        {
            $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();

            $args['comment_field'] = $args['comment_field'] . $prosandcons->get_fields([]);
            $args['class_form'] = 'ui form' . ' ' . $args['class_form'];

            return $args;

        }

        public function review_list_args($args)
        {
            error_log('review_list_args : ' . print_r($args, true));
        }

        public function some($data)
        {
            error_log('data : ' . print_r($data, true));

            echo 'woocommerce_review_meta';

        }

        public function add_review_title_field_on_comment_form()
        {
            echo '<p class="comment-form-title uk-margin-top"><label for="title">' . __('Review title', 'text-domain') . '</label><input class="uk-input uk-width-large uk-display-block" type="text" name="title" id="title"/></p>';
        }

        public function get_pros_and_cons()
        {
            $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
            echo $prosandcons->get_fields([]);
        }

        public function get_view($args)
        {
            // $viewProps = $this->model->get_viewProps($args);
            // $view = new \StarcatReview\Features\Woocommerce\View($viewProps);
            // return $view->get();
        }
    } // END CLASS
}
