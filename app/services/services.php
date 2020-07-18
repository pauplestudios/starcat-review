<?php

namespace StarcatReview\App\Services;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Services')) {
    class Services
    {
        public function register_services()
        {
            // error_log('!!! register services !!!');

            $stats_factory = new \StarcatReview\App\Services\Stats_Factory();
            $comments_factory = new \StarcatReview\App\Services\Comments_Factory();

            add_filter('scr_stat', [$this, 'get_allowed_stat'], 1, 1);
            add_filter('scr_stat', [$stats_factory, 'get_single_stat']);
            add_filter('scr_stat_args', [$stats_factory, 'get_stat_args'], 10, 2);

            add_filter('scr_comment', [$comments_factory, 'get_comment'], 1, 2);
            add_filter('scr_comment', [$this, 'get_comment_capabilities']);

            add_filter('scr_comments_args', [$comments_factory, 'get_comments_args'], 10, 2);
            add_filter('scr_capabilities_args', [$this, 'get_capabilities_args'], 1);
        }

        /*
         *  Get Filtered Stats with Global stats ( Settings )
         */
        public function get_allowed_stat($given_stats = [])
        {
            $stats = [];

            if (empty($given_stats)) {
                return $given_stats;
            }

            // error_log('given_stats : ' . print_r($given_stats, true));

            $global_stats = SCR_Getter::get('global_stats');
            $singularity = SCR_Getter::get('stat-singularity');

            if ($singularity == 'single') {
                $global_stats = [$global_stats[0]];
            }

            foreach ($global_stats as $allowed_stat) {
                $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                $is_stat_exist = array_key_exists($allowed_stat_name, $given_stats);

                if ($is_stat_exist && $given_stats[$allowed_stat_name]['rating'] > 0) {
                    $stats[$allowed_stat_name] = $given_stats[$allowed_stat_name]['rating'];
                }
            }

            return $stats;
        }

        /*
         * Adding capabilties to a comment like Can_Edit Can_Reply and Can_Vote
         */

        public function get_comment_capabilities($comment)
        {
            $comment['can_edit'] = false;
            // error_log('!!! add_capabilities_to_comment  !!!');
            if (get_current_user_id() == $comment['user_id']) {
                $comment['can_edit'] = true;
            }
            // error_log('comment : ' . print_r($comment, true));
            return $comment;
        }

        public function get_capabilities_args($comments = [])
        {
            $capability = [
                'can_user_vote' => false,
                'can_user_reply' => false,
                'can_user_review' => false,
            ];

            $who_can_review = SCR_Getter::get('ur_who_can_review');
            $can_same_user_leave_multiple_review = SCR_Getter::get('ur_allow_same_user_can_leave_multiple_reviews');

            if (is_user_logged_in() || $who_can_review == 'everyone') {
                $capability['can_user_review'] = true;
                $capability['can_user_reply'] = true;
                $capability['can_user_vote'] = true;
            }

            if ($can_same_user_leave_multiple_review) {
                $capability['can_user_review'] = true;
            }

            if ($can_same_user_leave_multiple_review == false && isset($comments) && !empty($comments)) {
                foreach ($comments as $comment) {
                    // Current user already reviewed
                    $has_current_user_already_reviewed = ($comment['user_id'] == get_current_user_id() && $comment['parent'] == 0);
                    $has_current_user_already_reviewed = apply_filters('scr_has_current_user_already_reviewed', $has_current_user_already_reviewed, $comment);
                    if ($has_current_user_already_reviewed) {
                        $capability['can_user_review'] = false;
                    }
                }
            }

            return $capability;
        }

    } // END CLASS
}