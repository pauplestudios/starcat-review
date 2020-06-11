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

        public function get_prepared_stat_args(int $post_id, $component = 'post_overall')
        {
            $post_stats = $this->get_post_stats($post_id);
            if ($component == 'summary_author') {
                return $post_stats;
            }

            $comment_stats = $this->get_comment_stats($post_id);

            if ($component == 'listing') {
                return $comment_stats;
            }

            // post overall combined stats
            $comment_overall_stats = $this->get_comment_overall_stats($comment_stats);
            error_log('comment_overall_stats : ' . print_r($comment_overall_stats, true));

            // $this->get_combined_stats($post_stats, $comment_overall_stats);

            return $comment_stats;
        }

        protected function get_post_stats($post_id)
        {
            $stats = [];
            $post_meta = get_post_meta($post_id, SCR_POST_META, true);
            if (isset($post_meta['stats-list']) && !empty($post_meta['stats-list'])) {
                $stats = $this->filter_with_global_stats($post_meta['stats-list']);
            }

            return $stats;
        }

        protected function get_comment_stats($post_id)
        {
            $stats = [];
            $comment_stats = [];
            $product_ratings = [];

            $comment_ids = $this->get_comments_ids($post_id);

            if (!empty($comment_ids)) {
                foreach ($comment_ids as $comment_id) {
                    $filtered_stat = [];
                    $review = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                    if (isset($review['stats']) && !empty($review['stats'])) {
                        $filtered_stat = $this->filter_with_global_stats($review['stats']);
                    }

                    // Ignoring Empty filtered stats
                    if (!empty($filtered_stat)) {
                        // $comment_stats['stats'][$comment_id] = $this->get_overall_stat_along_with($filtered_stat);
                        $comment_stats['stats'][$comment_id] = $filtered_stat;

                    }

                    if (get_post_type($post_id) == 'product') {
                        $rating = get_comment_meta($comment_id, 'rating', true);

                        // Product 5 Star rating changed to Percentage for better calculation
                        if (isset($rating) && !empty($rating)) {
                            $rating = (!empty($rating)) ? $rating * 20 : $rating;
                            $comment_stats['product_ratings'][$comment_id] = $rating;
                        }
                    }
                }
            }

            return $comment_stats;
        }

        protected function get_comment_overall_stats($comment_stats)
        {
            $overall = [];
            $individual = [];
            $overall_count = 0;
            $overall_total = 0;

            if (isset($comment_stats) && !empty($comment_stats)) {
                foreach ($comment_stats['stats'] as $comment_stat) {

                    $stat_count = 0;
                    $stat_total = 0;

                    foreach ($comment_stat as $stat_key => $stat) {

                        $stat_count++;
                        $stat_total += $stat;

                        if (!isset($individual[$stat_key])) {
                            $individual[$stat_key]['total'] = 0;
                            $individual[$stat_key]['times'] = 0;
                        }

                        $individual[$stat_key]['times']++;
                        $individual[$stat_key]['total'] += $comment_stat[$stat_key];
                    }

                    $overall_count++;
                    $overall_total += $stat_total / $stat_count;
                }

                $overall = [
                    'stats' => $this->get_invidual_overall($individual),
                    'overall' => $this->get_round_value($overall_total, $overall_count),
                ];
            }

            return $overall;
        }

        protected function get_combined_stats($post_stats, $comment_overall_stats)
        {
            $stats = [];
            $combined_total = 0;
            if (isset($comment_stats) && !empty($comment_stats)) {
                foreach ($comment_stats['stats'] as $stats) {

                }
            }
            return $stats;
        }

        private function filter_with_global_stats($filter_stats)
        {
            $global_stats = SCR_Getter::get('global_stats');
            $singularity = SCR_Getter::get('stat-singularity');

            if ($singularity == 'single') {
                $global_stats = [$global_stats[0]];
            }

            $stats = [];
            foreach ($global_stats as $allowed_stat) {
                $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                $is_stat_exist = array_key_exists($allowed_stat_name, $filter_stats);

                if ($is_stat_exist && $filter_stats[$allowed_stat_name]['rating'] > 0) {
                    $stats[$allowed_stat_name] = $filter_stats[$allowed_stat_name]['rating'];
                }
            }

            return $stats;
        }

        private function get_comments_ids($post_id)
        {
            $comment_ids = [];
            $comments = get_comments([
                'post_id' => $post_id,
                'comment_type' => 'review',
                'comment_parent' => 0,
            ]);

            $comment_ids = wp_list_pluck($comments, 'comment_ID');

            return $comment_ids;
        }

        private function get_invidual_overall($individual_overall)
        {
            $individual = [];
            foreach ($individual_overall as $single_key => $single) {
                $individual[$single_key] = $this->get_round_value($single['total'], $single['times']);
            }

            return $individual;
        }

        private function get_round_value($total, $devisor, $digit = 0)
        {
            return round(($total / $devisor), $digit);
        }

        // private function get_overall_stat_along_with($given_stats)
        // {
        //     $stat_count = 0;
        //     $stat_total = 0;

        //     foreach ($given_stats as $stat) {
        //         $stat_count++;
        //         $stat_total += $stat;
        //     }

        //     return [
        //         'stats' => $given_stats,
        //         'overall' => $this->get_round_value($stat_total, $stat_count),
        //     ];
        // }

    }
}
