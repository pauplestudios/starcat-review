<?php

namespace HelpieReviews\App\Repositories;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Repositories\User_Reviews_Repo')) {
    class User_Reviews_Repo
    {
        public function get()
        { }

        public function insert()
        {
            // error_log('User_Reviews_Repo->insert()');
            // $time = current_time('mysql');

            // $data = array(
            //     'comment_post_ID' => 1,
            //     'comment_author' => 'admin',
            //     'comment_author_email' => 'admin@admin.com',
            //     'comment_author_url' => 'http://',
            //     'comment_content' => 'content here',
            //     'comment_type' => '',
            //     'comment_parent' => 0,
            //     'user_id' => 1,
            //     'comment_author_IP' => '127.0.0.1',
            //     'comment_agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 3.5.30729)',
            //     'comment_date' => $time,
            //     'comment_approved' => 1,
            // );

            // wp_insert_comment($data);
        }

        public function add_review_to_comment($props)
        {
            if (!empty($_SERVER['REMOTE_ADDR']) && rest_is_ip_address(wp_unslash($_SERVER['REMOTE_ADDR']))) { // WPCS: input var ok, sanitization ok.
                $comment_author_IP = wc_clean(wp_unslash($_SERVER['REMOTE_ADDR'])); // WPCS: input var ok.
            } else {
                $comment_author_IP = '127.0.0.1';
            }

            $time = current_time('mysql', true);
            if (is_user_logged_in()) {
                $user                 = get_user_by('id', get_current_user_id());
                $comment_author       = $user->display_name;
                $comment_author_email = $user->user_email;
            } else {
                $comment_author        = __('HelpieReview', 'helpie-review');
                $comment_author_email  = 'helpiereview' . '@';
                $comment_author_email .= isset($_SERVER['HTTP_HOST']) ? str_replace('www.', '', sanitize_text_field(wp_unslash($_SERVER['HTTP_HOST']))) : 'noreply.com'; // WPCS: input var ok.
                $comment_author_email  = sanitize_email($comment_author_email);
            }
            $commentdata = array(
                'comment_post_ID'      => $props['post_id'],
                'comment_author'       => $comment_author,
                'comment_author_email' => $comment_author_email,
                'comment_author_url'   => '',
                'comment_content'      => $props['description'],
                'comment_agent'        => 'HelpieReview',
                'comment_type'         => 'helpie_review',
                'comment_date'         => $time,
                'comment_parent'       => 0,
                // 'user_id'              => $user->ID,
                'comment_author_IP'    => $comment_author_IP,
                'comment_approved'     => 1,
            );

            $comment_id = wp_insert_comment($commentdata);

            if (isset($comment_id) && !empty($comment_id)) {
                add_comment_meta($comment_id, 'hrp_user_review_props', $props);
            }

            return $comment_id;
        }

        public function update()
        { }
    }
    // END CLASS
}
