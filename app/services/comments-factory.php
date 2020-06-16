<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

/*
 *  Use Cases for listing, post_overall, summary_author and summary_users
 */
if (!class_exists('\StarcatReview\App\Services\Comments_Factory')) {
    class Comments_Factory
    {
        private $stats_identifier;

        public function __construct()
        {
            $this->stats_identifier = 'stats';
        }

        public function get_comments_of_items($post_id, $every_component = false)
        {
            $comments_of_stats = [];
            $comments_of_attachments = [];

            $comment_ids = $this->get_comments_ids($post_id);

            if (!empty($comment_ids)) {
                foreach ($comment_ids as $comment_id) {

                    $review = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                    if (isset($review[$this->stats_identifier]) && !empty($review[$this->stats_identifier])) {
                        $stats = apply_filters('scr_stat', $review[$this->stats_identifier]);
                    }

                    $has_stat = isset($stats) && !empty($stats) ? true : false;

                    if ($has_stat) {
                        $comments_of_stats[$comment_id] = $stats;
                    }

                    // WooCommerce product post_type Only
                    if (get_post_type($post_id) == 'product' && !$has_stat) {
                        $rating = apply_filters('scr_convert_product_rating_to_stat', $comment_id);

                        if (isset($rating) && !empty($rating)) {
                            $comments_of_stats[$comment_id] = apply_filters('scr_stat', $rating);
                        }
                    }
                }

            }

            if ($every_component) {
                return [
                    'stats' => $comments_of_stats,
                    'attachments' => $comments_of_attachments,
                ];
            }

            return $comments_of_stats;

        }

        public function get_comments_ids($post_id)
        {
            $comment_ids = [];
            $comments = get_comments([
                'post_id' => $post_id,
                'comment_type' => ['review', 'starcat_review'],
                'comment_parent' => 0,
                // 'comment_status' => 'approve',
            ]);

            $comment_ids = wp_list_pluck($comments, 'comment_ID');

            return $comment_ids;
        }
    }
}
