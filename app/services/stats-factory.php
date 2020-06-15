<?php

namespace StarcatReview\App\Services;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

/*
 *  Use Cases for listing, post_overall, summary_author and summary_users
 */
if (!class_exists('\StarcatReview\App\Services\StatsFactory')) {
    class StatsFactory
    {
        private $stats_name;
        private $overall_name;

        public function __construct()
        {
            $this->stats_name = 'stats';
            $this->overall_name = 'overall';
        }

        public function get_prepared_stat_args(int $post_id, $component = 'post_overall')
        {
            $author_stat = $this->get_author_stat($post_id);

            if ($component == 'summary_author') {
                return $author_stat;
            }

            $comments_of_stats = $this->get_comments_of_stats($post_id);

            if ($component == 'listing') {
                return $comments_of_stats;
            }

            // Comment Overall with Comment feature stat overall
            $comment_stat = $this->get_comment_stat($comments_of_stats);

            if ($component == 'summary_users') {
                return $comment_stat;
            }

            $post_stat = $this->get_post_stat($author_stat, $comment_stat);

            return $post_stat;
        }

        protected function get_post_stat($author_stat, $comment_stat)
        {
            $post_stat = [];

            $is_author_stat_exist = isset($author_stat[$this->overall_name]) && !empty($author_stat[$this->overall_name]) ? true : false;
            $is_comment_stat_exist = isset($comment_stat[$this->overall_name]) && !empty($comment_stat[$this->overall_name]) ? true : false;

            if ($is_author_stat_exist && $is_comment_stat_exist) {

                foreach ($comment_stat[$this->stats_name] as $comment_stat_key => $comment_stat_value) {
                    $stat_total = $author_stat[$this->stats_name][$comment_stat_key] + $comment_stat_value;
                    $post_stat[$this->stats_name][$comment_stat_key] = $this->get_round_value($stat_total, 2);
                }

                $overall_total = $author_stat[$this->overall_name] + $comment_stat[$this->overall_name];
                $post_stat[$this->overall_name] = $this->get_round_value($overall_total, 2);
                return $post_stat;
            }

            return $comment_stat;
        }

        protected function get_author_stat($post_id)
        {
            $stats = [];
            $post_meta = get_post_meta($post_id, SCR_POST_META, true);

            if (isset($post_meta['stats-list']) && !empty($post_meta['stats-list'])) {
                $stats = $this->get_allowed_stat($post_meta['stats-list']);
                $stats = $this->get_single_stat($stats);
            }

            return $stats;
        }

        protected function get_comment_stat($comments_of_stats)
        {
            $overall = [];
            $comment_stat_of_feature = [];
            $overall_count = 0;
            $overall_total = 0;

            if (isset($comments_of_stats) && !empty($comments_of_stats)) {
                foreach ($comments_of_stats as $comment_stat) {

                    $stat_count = 0;
                    $stat_total = 0;

                    foreach ($comment_stat[$this->stats_name] as $stat_key => $stat) {

                        $stat_count++;
                        $stat_total += $stat;

                        if (!isset($comment_stat_of_feature[$stat_key])) {
                            $comment_stat_of_feature[$stat_key]['total'] = 0;
                            $comment_stat_of_feature[$stat_key]['times'] = 0;
                        }

                        $comment_stat_of_feature[$stat_key]['times']++;
                        $comment_stat_of_feature[$stat_key]['total'] += $comment_stat[$this->stats_name][$stat_key];
                    }

                    $overall_count++;
                    $overall_total += $stat_total / $stat_count;
                }

                $overall = [
                    $this->stats_name => $this->get_comment_stat_of_feature($comment_stat_of_feature),
                    $this->overall_name => $this->get_round_value($overall_total, $overall_count),
                ];
            }

            return $overall;
        }

        protected function get_comments_of_stats($post_id)
        {
            $comments_of_stats = [];

            $comment_ids = $this->get_comments_ids($post_id);

            if (!empty($comment_ids)) {
                foreach ($comment_ids as $comment_id) {
                    $allowed_stat = [];
                    $review = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                    if (isset($review[$this->stats_name]) && !empty($review[$this->stats_name])) {
                        $allowed_stat = $this->get_allowed_stat($review[$this->stats_name]);
                    }

                    // Ignoring Empty filtered stats
                    if (!empty($allowed_stat)) {
                        $comments_of_stats[$comment_id] = $this->get_single_stat($allowed_stat);
                    }

                    // WooCommerce product rating filters
                    $has_single_comment_stat = isset($comments_of_stats[$comment_id]) && !empty($comments_of_stats[$comment_id]) ? true : false;
                    if (get_post_type($post_id) == 'product' && !$has_single_comment_stat) {
                        $woo_added_comment_stat = apply_filters('scr_comment_stat', $comment_id);

                        if (isset($woo_added_comment_stat) && is_array($woo_added_comment_stat)) {
                            $comments_of_stats[$comment_id] = $this->get_single_stat($woo_added_comment_stat);

                        }
                    }
                }

            }

            return $comments_of_stats;
        }

        /*
         *  Get Filtered Stats with Global stats ( Settings )
         */
        private function get_allowed_stat($given_stats)
        {
            $global_stats = SCR_Getter::get('global_stats');
            $singularity = SCR_Getter::get('stat-singularity');

            if ($singularity == 'single') {
                $global_stats = [$global_stats[0]];
            }

            $stats = [];
            foreach ($global_stats as $allowed_stat) {
                $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                $is_stat_exist = array_key_exists($allowed_stat_name, $given_stats);

                if ($is_stat_exist && $given_stats[$allowed_stat_name]['rating'] > 0) {
                    $stats[$allowed_stat_name] = $given_stats[$allowed_stat_name]['rating'];
                }
            }

            return $stats;
        }

        private function get_single_stat($given_stats)
        {
            $stat_count = 0;
            $stat_total = 0;

            foreach ($given_stats as $stat) {
                $stat_count++;
                $stat_total += $stat;
            }

            return [
                $this->stats_name => $given_stats,
                $this->overall_name => $this->get_round_value($stat_total, $stat_count),
            ];
        }

        private function get_comment_stat_of_feature($stat_feature)
        {
            $comment_state_of_feature = [];
            foreach ($stat_feature as $single_key => $single) {
                $comment_state_of_feature[$single_key] = $this->get_round_value($single['total'], $single['times']);
            }

            return $comment_state_of_feature;
        }

        private function get_comments_ids($post_id)
        {
            $comment_ids = [];
            $comments = get_comments([
                'post_id' => $post_id,
                'comment_type' => ['review', 'starcat_review'],
                'comment_parent' => 0,
            ]);

            $comment_ids = wp_list_pluck($comments, 'comment_ID');

            return $comment_ids;
        }

        private function get_round_value($total, $devisor, $digit = 0)
        {
            return round(($total / $devisor), $digit);
        }

    }
}
