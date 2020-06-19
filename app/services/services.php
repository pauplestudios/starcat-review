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

            add_filter('scr_comment', [$this, 'add_comment_capabilities']);
            add_filter('scr_comments_args', [$comments_factory, 'get_comments_args'], 10, 2);
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

        public function add_comment_capabilities($comment)
        {
            error_log('!!! add_capabilities_to_comment  !!!');
            // error_log('comment : ' . print_r($comment, true));

            return $comment;
        }

    } // END CLASS
}
