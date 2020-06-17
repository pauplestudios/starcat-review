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
            $components = ['stats' => []];
            $comment_ids = $this->get_comments_ids($post_id);

            if ($this->is_set($comment_ids)) {
                foreach ($comment_ids as $comment_id) {

                    $review = get_comment_meta($comment_id, SCR_COMMENT_META, true);
                    $stat = $this->get_stat($post_id, $comment_id, $review);
                    $vote = $this->get_vote($review);
                    $comment = $this->get_comment($comment_id, $review);
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
                    if ($this->is_set($comment)) {
                        $components['comments'][$comment_id] = $comment;
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

            if ($this->is_key_exist('stats', $review)) {
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

        protected function get_comment($comment_id, $review)
        {
            $comment = [];
            $comment_obj = get_comment($comment_id);
            $comment = [
                'content' => $comment_obj->comment_content,
                'parent' => $comment_obj->comment_parent,
                'user_id' => $comment_obj->user_id,
                'approved' => $comment_obj->comment_approved,
                'date' => get_comment_date('', $comment->comment_ID),
                'time' => $this->get_comment_time($comment_obj->comment_date),
                'email' => $comment_obj->comment_author_email,
                'avatar' => get_avatar($comment->user_id),
            ];

            // error_log('comment : ' . print_r($comment_obj, true));
            if ($this->is_key_exist('title', $review)) {
                $comment['title'] = $review['title'];
            }

            return $comment;
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

        private function is_key_exist($key, $array)
        {
            $is_key_exist = true;
            if (((is_array($array)) && (!array_key_exists($key, $array))) || (!is_array($array))) {
                $is_key_exist = false;
            }
            return $is_key_exist;
        }

        private function is_set($given)
        {
            $is_set = false;
            if (isset($given) && !empty($given)) {
                $is_set = true;
            }
            return $is_set;
        }

        private function get_comment_time($date)
        {
            $date = mysql2date(get_option('time_format'), $date, true);

            return apply_filters('get_comment_time', $date);
        }
    }
}
