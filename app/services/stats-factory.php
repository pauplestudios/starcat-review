<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

/*
 *  Use Cases for listing, post_overall, summary_author and summary_users
 */
if (!class_exists('\StarcatReview\App\Services\Stats_Factory')) {
    class Stats_Factory
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
            // error_log('!!!  get_prepared_stat_args !!!');

            $author_stat = $this->get_author_stat($post_id);

            if ($component == 'summary_author') {
                return $author_stat;
            }

            $comments_factory = new \StarcatReview\App\Services\Comments_Factory();
            $comments_of_stats = $comments_factory->get_comments_of_items($post_id);

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

        public function get_single_stat($given_stats)
        {
            $stat_count = 0;
            $stat_total = 0;

            foreach ($given_stats as $stat) {
                $stat_count++;
                $stat_total += $stat;
            }

            if ($stat_total == 0) {
                return [];
            }

            return [
                $this->stats_name => $given_stats,
                $this->overall_name => $this->get_round_value($stat_total, $stat_count),
            ];
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
                $stats = apply_filters('scr_stat', $post_meta['stats-list']);
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

        private function get_comment_stat_of_feature($stat_feature)
        {
            $comment_state_of_feature = [];
            foreach ($stat_feature as $single_key => $single) {
                $comment_state_of_feature[$single_key] = $this->get_round_value($single['total'], $single['times']);
            }

            return $comment_state_of_feature;
        }

        private function get_round_value($total, $devisor, $digit = 0)
        {
            return round(($total / $devisor), $digit);
        }

    }
}
