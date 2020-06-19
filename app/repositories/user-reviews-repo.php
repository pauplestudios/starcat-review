<?php

namespace StarcatReview\App\Repositories;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Repositories\User_Reviews_Repo')) {
    class User_Reviews_Repo
    {
        public function get($comment_id, $parent = 0)
        {
            if ($parent != 0) {
                return get_comment(intval($comment_id));
            }

            return get_comment_meta($comment_id, 'scr_user_review_props');
        }

        public function insert($props)
        {

            error_log('props : ' . print_r($props, true));
            $Current_User = new \StarcatReview\App\Services\User();

            $user_can_review = $Current_User->can_review();
            $user_review_needs_approval = $Current_User->can_user_directly_publish_reviews();

            // 1. Check if current_user can add review
            if ($user_can_review == false) {
                // return 'Failed: User cannot submit reviews';
                return 0;
            }

            // 2. Proceed only in $user_can_review == true . Store new comment.
            $user = get_user_by('id', get_current_user_id());
            $comment_data = $this->build_and_get_comment_data($user, $props);
            $comment_id = wp_new_comment($comment_data);

            // 3. Check if we need to manually approve this review
            if ($user_review_needs_approval) {
                $comment_modifier = [
                    'comment_ID' => $comment_id,
                    'comment_approved' => 0,
                ];

                wp_update_comment($comment_modifier);
            }

            // 4. Does this review have comment_meta to be updated
            $should_update_comment_meta = (isset($comment_id) && !empty($comment_id) && !isset($props['review_reply']) && $props['parent'] == 0);
            if ($should_update_comment_meta) {
                add_comment_meta($comment_id, 'scr_user_review_props', $props);
            }

            do_action('scr_photo_reviews/add_attachments', $comment_id);

            return $comment_id;

        }

        public function build_and_get_comment_data($user, $props)
        {
            $Current_User = new \StarcatReview\App\Services\User();
            $is_user_logged_in = $Current_User->is_loggedin();

            $comment_data = [];

            // General Properties
            $comment_data['comment_author_IP'] = $Current_User->get_user_IP();
            $comment_data['comment_post_ID'] = $props['post_id'];
            $comment_data['comment_content'] = $props['description'];
            $comment_data['comment_agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36';
            $comment_data['comment_type'] = SCR_COMMENT_TYPE;
            // $comment_data['comment_date'] = current_time('timestamp', true);
            $comment_data['comment_parent'] = !isset($props['parent']) ? 0 : $props['parent'];
            $comment_data['comment_approved'] = 1;

            // Properties which change for different user types (logged_in and non_logged_in)
            if ($is_user_logged_in) {
                $user = get_user_by('id', get_current_user_id());
                $comment_data['comment_author'] = $user->display_name;
                $comment_data['comment_author_email'] = $user->user_email;
                $comment_data['comment_author_url'] = $user->user_url;
                $comment_data['user_id'] = $user->ID;
            } else {
                $comment_data['comment_author'] = $props['first_name'] . ' ' . $props['last_name'];
                $comment_data['comment_author_email'] = $props['user_email'];
                $comment_data['comment_author_url'] = '';
                $comment_data['user_id'] = '';
            }

            return $comment_data;
        }

        public function insert_old($props)
        {
            if (is_user_logged_in()) {
                if (!empty($_SERVER['REMOTE_ADDR']) && rest_is_ip_address(wp_unslash($_SERVER['REMOTE_ADDR']))) { // WPCS: input var ok, sanitization ok.
                    $comment_author_IP = wp_unslash($_SERVER['REMOTE_ADDR']); // WPCS: input var ok.
                } else {
                    $comment_author_IP = '127.0.0.1';
                }

                $user = get_user_by('id', get_current_user_id());
                $comment_author = $user->display_name;
                $comment_author_email = $user->user_email;
                $comment_author_url = $user->user_url;

                $commentdata = array(
                    'comment_post_ID' => $props['post_id'],
                    'comment_author' => $comment_author,
                    'comment_author_email' => $comment_author_email,
                    'comment_author_url' => $comment_author_url,
                    'comment_content' => $props['description'],
                    'comment_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',
                    'comment_type' => SCR_COMMENT_TYPE,
                    // 'comment_date' => current_time('timestamp', true),
                    'comment_parent' => !isset($props['parent']) ? 0 : $props['parent'],
                    'user_id' => $user->ID,
                    'comment_author_IP' => $comment_author_IP,
                    'comment_approved' => 1,
                );

                $comment_id = wp_new_comment($commentdata);

                if (!current_user_can('manage_options')) {
                    $commentarr = [
                        'comment_ID' => $comment_id,
                        'comment_approved' => 0,
                    ];

                    wp_update_comment($commentarr);
                }

                if (isset($comment_id) && !empty($comment_id) && !isset($props['review_reply']) && $props['parent'] == 0) {
                    add_comment_meta($comment_id, 'scr_user_review_props', $props);
                }

                // do_action('scr_photos_review/add_attachments', $comment_id);

                return $comment_id;
            }
            // else{
            //     $comment_author        = 'StarcatReview';
            //     $comment_author_email  = 'starcatreview' . '@';
            //     $comment_author_email .= isset($_SERVER['HTTP_HOST']) ? str_replace('www.', '', sanitize_text_field(wp_unslash($_SERVER['HTTP_HOST']))) : 'noreply.com'; // WPCS: input var ok.
            //     $comment_author_email  = sanitize_email($comment_author_email);
            // }
            return 0;
        }

        public function update($props)
        {
            // error_log('props : ' . print_r($props, true));
            $comment_id = $props['comment_id'];
            $comment = array(
                'comment_ID' => $props['comment_id'],
                'comment_content' => $props['description'],
                'comment_parent' => $props['parent'],
                'comment_approved' => current_user_can('manage_options') ? 1 : 0,
            );

            wp_update_comment($comment);

            // review only not reply update
            if ($props['parent'] == 0) {

                $data = get_comment_meta($comment_id, 'scr_user_review_props', true);

                $votes = isset($data['votes']) && !empty($data['votes']) ? $data['votes'] : [];
                $props['votes'] = $votes;
                
                $attachments = isset($data['attachments']) && !empty($data['attachments']) ? $data['attachments'] : [];
                $props['attachments'] = $attachments;
                
                unset($props['parent']);
                unset($props['methodType']);                
                
                update_comment_meta($comment_id, 'scr_user_review_props', $props);

                do_action('scr_photo_reviews/add_attachments', $comment_id);
            }

            return $comment_id;
        }

        public function store_vote($props)
        {
            if (metadata_exists('comment', $props['comment_id'], 'scr_user_review_props')) {
                $meta_props = get_comment_meta($props['comment_id'], 'scr_user_review_props', true);

                if (isset($meta_props['votes']) && !empty($meta_props['votes'])) {
                    $is_current_user_voted = false;
                    foreach ($meta_props['votes'] as &$vote) {
                        if ($vote['user_id'] == $props['vote']['user_id']) {
                            $vote['vote'] = $props['vote']['vote'];
                            $is_current_user_voted = true;
                        }
                        // error_log('each vote : ' . print_r($vote, true));
                    }
                    if ($is_current_user_voted == false) {
                        array_push($meta_props['votes'], $props['vote']);
                    }
                } else {
                    $vote_props = ['votes' => [$props['vote']]];
                    $meta_props = array_merge($meta_props, $vote_props);
                }

                // error_log('$meta_props : ' . print_r($meta_props['votes'], true));

                update_comment_meta($props['comment_id'], 'scr_user_review_props', $meta_props);
            }
        }

        public function get_processed_data()
        {
            $props = ['parent' => 0];

            if (isset($_POST['post_id']) && !empty($_POST['post_id'])) {
                $props['post_id'] = $_POST['post_id'];
            }

            if (isset($_POST['title']) && !empty($_POST['title'])) {
                $props['title'] = $_POST['title'];
            }

            if (isset($_POST['description']) && !empty($_POST['description'])) {
                $props['description'] = $_POST['description'];
            }

            if (isset($_POST['pros']) && !empty($_POST['pros'])) {
                $props['pros'] = $this->get_prosandcons($_POST['pros']);
            }

            if (isset($_POST['cons']) && !empty($_POST['cons'])) {
                $props['cons'] = $this->get_prosandcons($_POST['cons']);
            }

            if (isset($_POST['scores']) && !empty($_POST['scores'])) {
                $props['rating'] = $this->get_rating($_POST['scores']);
                $props['stats'] = $this->get_stat($_POST['scores']);
            }

            if (isset($_POST['parent']) && !empty($_POST['parent'])) {
                $props['parent'] = $_POST['parent'];
            }

            if (isset($_POST['comment_id']) && !empty($_POST['comment_id'])) {
                $props['comment_id'] = $_POST['comment_id'];
            }

            if (isset($_POST['methodType']) && !empty($_POST['methodType'])) {
                $props['methodType'] = $_POST['methodType'];
            }

            if (isset($_POST['captcha']) && !empty($_POST['captcha'])) {
                $props['captcha'] = $_POST['captcha'];
            }

            if (isset($_POST['attachments']) && !empty($_POST['attachments'])) {
                $props['attachments'] = $_POST['attachments'];
            }

            $props = apply_filters('scr_form_process_data', $props);

            return $props;
        }

        public function get_processed_voting_data()
        {
            $data = [];
            if (isset($_POST['comment_id']) && !empty($_POST['comment_id'])) {
                $data['comment_id'] = $_POST['comment_id'];
            }

            if (isset($_POST['vote'])) {
                $data['vote'] = [
                    'user_id' => get_current_user_id(),
                    'vote' => $_POST['vote'],
                ];
            }

            return $data;
        }

        public function get_prosandcons($features)
        {
            $items = [];

            if (isset($features) && !empty($features)) {
                foreach ($features as $key => $value) {
                    $items[$key] = [
                        'item' => $value,
                    ];
                }
            }

            return $items;
        }

        public function get_rating($scores)
        {
            $count = 0;
            $rating = 0;
            $cumulative = 0;

            if (isset($scores)) {
                foreach ($scores as $key => $value) {
                    $cumulative += $value;
                    $count++;
                }

                return $rating = round($cumulative / $count);
            }
            return $rating;
        }

        public function get_stat($scores)
        {
            $stats = [];

            if (isset($scores) && !empty($scores)) {
                foreach ($scores as $key => $value) {
                    $stats[$key] = [
                        'stat_name' => $key,
                        'rating' => $value,
                    ];
                }
            }

            return $stats;
        }
    }
    // END CLASS
}
