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

        public function get_comments_args($post_id, $use_cases = ['stats'])
        {
            $components = [];
            $comment_ids = $this->get_comments_ids($post_id);

            if ($this->is_set($comment_ids)) {
                foreach ($comment_ids as $comment_id) {

                    $review = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                    $stat = $this->get_stat($post_id, $comment_id, $review);
                    $vote = $this->get_vote($review);
                    $proandcon = $this->get_proandcon($review);
                    $attachment = $this->get_attachment($review);

                    if ($this->is_set($stat)) {
                        $components['stats'][$comment_id] = $stat;
                    }
                    if ($this->is_set($proandcon)) {
                        $components['prosandcons'][$comment_id] = $proandcon;
                    }
                    if ($this->is_set($vote)) {
                        $components['votes'][$comment_id] = $vote;
                    }
                    if ($this->is_set($vote)) {
                        $components['attachments'][$comment_id] = $attachment;
                    }

                }

            }

            if ($this->is_set($use_cases) && count($use_cases) > 1) {
                $cases = [];
                foreach ($use_cases as $case) {
                    $is_exist = array_key_exists($case, $components);
                    if ($is_exist) {
                        $cases[$case] = $components[$case];
                    }
                }
                return $cases;
            }

            return $components['stats'];

        }

        protected function get_comments_ids($post_id)
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

        protected function get_stat($post_id, $comment_id, $review)
        {
            $stat_item = [];
            if ($this->is_set($review['stats'])) {
                $stat_item = apply_filters('scr_stat', $review['stats']);
            }

            // WooCommerce product post_type Only
            if (get_post_type($post_id) == 'product' && !$this->is_set($stat_item)) {
                $rating = apply_filters('scr_convert_product_rating_to_stat', $comment_id);

                if ($this->is_set($rating)) {
                    $stat_item = apply_filters('scr_stat', $rating);
                }
            }

            return $stat_item;

        }

        protected function get_vote($review)
        {
            $vote = [];
            return $vote;

        }

        protected function get_proandcon($review)
        {
            $proandcon = [];
            return $proandcon;

        }

        protected function get_attachment($review)
        {
            $attachment = [];
            return $attachment;
        }

        private function is_set($given)
        {
            $is_set = false;
            if (isset($given) && !empty($given)) {
                $is_set = true;
            }
            return $is_set;
        }
    }
}
