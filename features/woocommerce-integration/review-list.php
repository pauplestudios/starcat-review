<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Review_List')) {
    class Review_List
    {
        public function __construct()
        {
            // error_log('!!! List !!!');
            add_action('woocommerce_review_before_comment_text', [$this, 'list_result']);
            add_action('woocommerce_review_after_comment_text', [$this, 'list_prosandcons_result']);
            // add_action('woocommerce_review_meta', [$this, 'list_review_meta_result']);
            add_filter('woocommerce_product_review_list_args', [$this, 'review_list_args']);
            add_filter('woocommerce_reviews_title', [$this, 'modify_review_title']);

        }

        public function modify_review_title($html)
        {
            error_log('comment review title html: ' . $html);

            return $html;
        }

        public function list_result($comment)
        {
            $review = get_comment_meta($comment->comment_ID, SCR_COMMENT_META, true);
            $args = [
                'items' => $review,
            ];
            $html = '';
            if ($review) {
                $html .= '<strong class="review-title">' . $review['title'] . '</strong>';
            }

            echo $html;
        }

        public function list_prosandcons_result($comment)
        {
            $review = get_comment_meta($comment->comment_ID, SCR_COMMENT_META, true);
            $args = [
                'items' => $review,
            ];
            $html = '';
            if ($review) {
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                $html .= $prosandcons->get_view($args);
            }

            echo $html;
        }

        public function list_review_meta_result($comment)
        {
            $review = get_comment_meta($comment->comment_ID, SCR_COMMENT_META, true);
            $args = [
                'items' => $review,
            ];
            $html = '';
            if ($review) {
                $html .= '<strong class="review-title"><i>' . $review['title'] . '</i></strong>';
            }

            echo $html;
        }

        public function review_list_args($list_args)
        {

            error_log('list_args : ' . print_r($list_args, true));
            return $list_args;
        }
    }
}
