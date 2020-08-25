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
            $result = false;
            $part1_result = $this->upgrade_below_v061_part_1();
            $part2_result = $this->upgrade_below_v061_part_2();

            return $result;
        }

        /* Non-logged-in authors info review and replies support */
        public function upgrade_below_v061_part_2()
        {
            // Get non-loggedin users comments of version0.6 don’t have the author name in the comment table
            $comments = scr_get_comments_args(['comments'], ['user_id' => 0]);

            $comment_ids = array_keys($comments);
            if (isset($comment_ids) && !empty($comment_ids)) {
                foreach ($comment_ids as $comment_id) {
                    $wp_comment = get_comment($comment_id);
                    if (empty(trim($wp_comment->comment_author))) {
                        // Check out the related SCR-comment meta and get the details if the name, email and website of v0.5 and v0.6 are presents
                        $comment_meta = get_comment_meta($comment_id, SCR_COMMENT_META, true);
                        $comment_modifier = [
                            'comment_ID' => $comment_id,
                        ];

                        if (isset($comment_meta['first_name']) && isset($comment_meta['last_name'])) {
                            $comment_modifier['comment_author'] = $comment_meta['first_name'] . ' ' . $comment_meta['last_name'];
                        }

                        if (isset($comment_meta['author']) && !empty($comment_meta['author'])) {
                            $comment_modifier['comment_author'] = $comment_meta['author'];
                        }

                        if (isset($comment_meta['user_email']) && !empty($comment_meta['user_email'])) {
                            $comment_modifier['comment_author_email'] = $comment_meta['user_email'];
                        }

                        if (isset($comment_meta['email']) && !empty($comment_meta['email'])) {
                            $comment_modifier['comment_author_email'] = $comment_meta['email'];
                        }

                        if (isset($comment_meta['url']) && !empty($comment_meta['url'])) {
                            $comment_modifier['comment_author_url'] = $comment_meta['url'];
                        }

                        // Update the comment table from given details
                        wp_update_comment($comment_modifier);
                    }

                }
            }
            return true;
        }

        /* show in wooCommerce reviews and replies support when starcat plugin deactivated */
        public function upgrade_below_v061_part_1()
        {
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
                }
            }

            return true;
        }
    } // END CLASS
}
