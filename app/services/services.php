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

            add_filter('prepare_stat_args', [$stats_factory, 'get_prepared_stat_args'], 10, 2);

            add_filter('scr_stat', [$this, 'get_allowed_stat'], 1, 1);
            add_filter('scr_stat', [$stats_factory, 'get_single_stat']);
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

    } // END CLASS
}
