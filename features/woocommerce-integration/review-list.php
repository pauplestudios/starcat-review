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
            add_action('woocommerce_review_before_comment_meta', [$this, 'list_result']);
        }

        public function list_result($comment)
        {
            $review = get_comment_meta($comment->comment_ID, "scr_user_review_props", true);
            $args = [
                'items' => $review,
            ];
            $html = '';
            if ($review) {
                $html .= '<strong class="review-title">' . $review['title'] . '</strong>';
                $prosandcons = new \StarcatReview\App\Components\ProsAndCons\Controller();
                $html .= $prosandcons->get_view($args);
            }

            echo $html;
        }
    }
}
