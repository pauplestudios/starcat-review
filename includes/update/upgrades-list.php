<?php

namespace StarcatReview\Includes\Update;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}
/**

 */
if (!class_exists('\StarcatReview\Includes\Update\Upgrades_List')) {
    class Upgrades_List
    {

        public function get_upgrades()
        {
            $upgrades = [
                '0.2' => 'upgrade_v02',
                '0.6.1' => 'upgrade_v061',
            ];

            return $upgrades;
        }

        public function upgrade_v02()
        {

            error_log('upgrade_v02');
            $option_name = 'starcat-review';
            $settings = get_option($option_name);

            /* Set new version for verification later */
            $settings['last_version'] = '0.2';

            $result = \update_option($option_name, $settings);
            $updated_option = get_option($option_name);

            if (isset($updated_option['last_version']) && $updated_option['last_version'] == '0.2') {
                $result = true;
            }

            return $result;
        }

        public function upgrade_v061()
        {
            error_log('upgrade_v061');
            $result = false;
            $this->upgrade_v061_part_1();
            $this->upgrade_v061_part_2();

            return $result;
        }

        public function upgrade_v061_part_1()
        {
            // Get all the comments don’t have the author name in the comment table
            $args = scr_get_comments_args(['comments', 'stats'], $query_args = []);

            // Check out the related SCR-comment meta and get the details if the name, email and website of v0.5 and v0.6 are presents

            // Update the comment table from given details

            // Remove SCR-comment meta details fields after updating.
            return $args;
        }

        public function upgrade_v061_part_2()
        {

        }
    } // END CLASS
}
