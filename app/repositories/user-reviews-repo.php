<?php

namespace HelpieReviews\App\Repositories;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Repositories\User_Reviews_Repo')) {
    class User_Reviews_Repo
    {
        public function get($comment_id)
        {
            // $comments = get_comment($comment_id);
            $comments = get_comment_meta($comment_id, 'hrp_user_review_props');
            return $comments;
        }

        public function insert($props)
        {
            if (is_user_logged_in()) {
                if (!empty($_SERVER['REMOTE_ADDR']) && rest_is_ip_address(wp_unslash($_SERVER['REMOTE_ADDR']))) { // WPCS: input var ok, sanitization ok.
                    $comment_author_IP = wp_unslash($_SERVER['REMOTE_ADDR']); // WPCS: input var ok.
                } else {
                    $comment_author_IP = '127.0.0.1';
                }

                $time = current_time('mysql', true);

                $user                 = get_user_by('id', get_current_user_id());
                $comment_author       = $user->display_name;
                $comment_author_email = $user->user_email;
                $comment_author_url   = $user->user_url;

                $commentdata = array(
                    'comment_post_ID'      => $props['post_id'],
                    'comment_author'       => $comment_author,
                    'comment_author_email' => $comment_author_email,
                    'comment_author_url'   => $comment_author_url,
                    'comment_content'      => $props['description'],
                    'comment_agent'        => 'HelpieReviews',
                    'comment_type'         => 'helpie_reviews',
                    'comment_date'         => $time,
                    'comment_parent'       => 0,
                    'user_id'              => $user->ID,
                    'comment_author_IP'    => $comment_author_IP,
                    'comment_approved'     => 1,
                );

                $comment_id = wp_new_comment($commentdata);

                if (isset($comment_id) && !empty($comment_id)) {
                    add_comment_meta($comment_id, 'hrp_user_review_props', $props);
                }

                return $comment_id;
            }
            // else{
            //     $comment_author        = __('HelpieReview', 'helpie-review');
            //     $comment_author_email  = 'helpiereview' . '@';
            //     $comment_author_email .= isset($_SERVER['HTTP_HOST']) ? str_replace('www.', '', sanitize_text_field(wp_unslash($_SERVER['HTTP_HOST']))) : 'noreply.com'; // WPCS: input var ok.
            //     $comment_author_email  = sanitize_email($comment_author_email);
            // }
            return 0;
        }

        public function update($comment_id, $props)
        {
            $comment = array();
            $comment['comment_ID'] = $comment_id;
            $comment['comment_approved'] = 1;
            $is_updated = wp_update_comment($comment);
            if ($is_updated) {
                update_comment_meta($comment_id, 'hrp_user_review_props', $props);
            }
            return $comment_id;
        }

        public function get_processed_data()
        {
            $props['post_id']  = $_POST['post_id'];
            $props['title'] = $_POST['title'];
            $props['description'] = $_POST['description'];
            $props['pros'] = $_POST['pros'];
            $props['cons'] = $_POST['cons'];
            $props['stats'] = $_POST['scores'];
            $props['rating'] = $this->get_rating($props);

            return $props;
        }

        protected function get_rating($props)
        {
            $count = 0;
            $rating = 0;
            $cumulative = 0;

            if (isset($props['stats'])) {
                foreach ($props['stats'] as $key => $value) {
                    $cumulative += $value;
                    $count++;
                }

                return $rating = round($cumulative / $count);
            }
            return $rating;
        }
    }
    // END CLASS
}
