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
                '0.7'   => 'upgrade_v07'
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

        public function upgrade_v07(){

            

            $option_name = 'scr_options';
            $settings = get_option($option_name);
            /* Set new version for verification later */
            $settings['last_version'] = '0.7';

            $review_enabled_post_types = isset($settings['review_enable_post-types']) && !empty($settings['review_enable_post-types']) ? $settings['review_enable_post-types'] : [] ;
            
            // Get the product post_type index value 
            $index_of_product =  array_search('product',$review_enabled_post_types);

            $enable_reviews_on_woocommerce = 0;
            if(in_array('product',$review_enabled_post_types)){
                $enable_reviews_on_woocommerce = 1;
            }

            // check and remove the product type from review_enabled_post_types option.
            if(isset($review_enabled_post_types[$index_of_product]) && $review_enabled_post_types[$index_of_product] == 'product'){
                unset($review_enabled_post_types[$index_of_product]);
                // re-index the post_types  
                $settings['review_enable_post-types']      = array_values($review_enabled_post_types); 
            } 

            $settings['enable_reviews_on_woocommerce']  = $enable_reviews_on_woocommerce; 
            $settings['woo_ur_who_can_review']          = $settings['ur_who_can_review'];
            $settings['woo_enable_pros_cons']           = $settings['enable-pros-cons'];
            $settings['woo_enable_voting']              = $settings['ur_enable_voting'];
            $settings['woo_show_form_title']            = $settings['ur_form_title'];
            $settings['woo_stat_singularity']           = $settings['stat-singularity'];
            $settings['woo_global_stats']               = $settings['global_stats'];
            $settings['woo_stats_source_type']          = $settings['stats-source-type'];
            $settings['woo_stats_show_rating_label']    = $settings['stats-show-rating-label'];
            $settings['woo_stats_icons']                = $settings['stats-icons'];
            $settings['woo_stats_icons_color']          = $settings['stats-icons-color'];
            $settings['woo_stats_icons_label_color']    = $settings['stats-icons-label-color'];
            $settings['woo_stats_images']               = $settings['stats-images'];
            $settings['woo_stats_steps']                = $settings['stats-steps'];
            $settings['woo_show_captcha']               = $settings['ur_show_captcha'];
            $settings['woo_recaptcha_site_key']         = $settings['recaptcha_site_key'];
            $settings['woo_recaptcha_secret_key']       = $settings['recaptcha_secret_key'];
            
            $result = update_option($option_name, $settings);
            $updated_option = get_option($option_name);
            if (isset($updated_option['last_version']) && $updated_option['last_version'] == '0.7') {
                $result = true;
            }

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
