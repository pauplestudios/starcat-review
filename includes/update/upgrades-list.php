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
            // error_log('upgrade_v02');
            $option_name = 'starcat-review';
            $settings = get_option($option_name);

            /* Set new version for verification later */
            $settings['last_version'] = '0.2';

            $result = update_option($option_name, $settings);
            $updated_option = get_option($option_name);

            if (isset($updated_option['last_version']) && $updated_option['last_version'] == '0.2') {
                $result = true;
            }

            return $result;
        }

        public function upgrade_v061()
        {
            // error_log('upgrade_v061');
            $result = false;
            $part1_result = $this->upgrade_below_v061_part_1();
            $part2_result = $this->upgrade_below_v061_part_2();

            if ($part1_result && $part2_result) {
                $result = true;
            }
            return $result;
        }

        /* Non-logged-in authors info review and replies support */
        public function upgrade_below_v061_part_1()
        {
            $result = false;

            // Get all the comments don’t have the author name in the comment table

            // Check out the related SCR-comment meta and get the details if the name, email and website of v0.5 and v0.6 are presents

            // Update the comment table from given details

            // Remove SCR-comment meta details fields after updating.
            return $result;
        }

        /* show in wooCommerce reviews and replies support when starcat plugin deactivated */
        public function upgrade_below_v061_part_2()
        {
            $result = false;
            $comments = scr_get_comments_args(['comments'], $query_args = ['type' => 'starcat_review', 'parent' => '']);
            if (!empty($comments) && is_array($comments)) {
                $comment_ids = array_keys($comments);
                foreach ($comment_ids as $comment_id) {
                    $comment_modifier = [
                        'comment_ID' => $comment_id,
                        'comment_type' => SCR_COMMENT_TYPE,
                    ];

                    wp_update_comment($comment_modifier);

                    $wp_comment = get_comment($comment_id);
                    $scr_comment_meta = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                    // WooCommerce product review
                    if (get_post_type($wp_comment->comment_post_ID) == 'product' && isset($scr_comment_meta['rating']) && !empty($scr_comment_meta['rating'])) {
                        update_comment_meta($comment_id, 'rating', round($scr_comment_meta['rating'] / 20));
                    }
                    $result = true;
                }
            }

            return $result;
        }
    } // END CLASS
}
