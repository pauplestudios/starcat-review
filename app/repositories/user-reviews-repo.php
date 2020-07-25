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

            return get_comment_meta($comment_id, SCR_COMMENT_META);
        }

        public function insert($props)
        {
            // error_log('props : ' . print_r($props, true));
            $Current_User = new \StarcatReview\App\Services\User();

            $can_approve = $Current_User->can_user_directly_publish_reviews();

            // 1. Proceed only in $user_can_review == true . Store new comment.
            $user = get_user_by('id', get_current_user_id());
            $comment_data = $this->build_and_get_comment_data($user, $props);
            $comment_id = wp_new_comment($comment_data);

            // 2. Store wp_comment, wp_consent in Cookies for non-logged-in users
            if (!$Current_User->is_loggedin() && isset($props['wp-comment-cookies-consent'])) {
                $wp_comment = get_comment($comment_id);
                $wp_user = wp_get_current_user();
                $wp_consent = $props['wp-comment-cookies-consent'];

                do_action('set_comment_cookies', $wp_comment, $wp_user, $wp_consent);
            }

            // 3. Check if we need to manually approve this review
            if ($can_approve) {
                $comment_modifier = [
                    'comment_ID' => $comment_id,
                    'comment_approved' => 1,
                ];

                wp_update_comment($comment_modifier);
            }

            // 4. Does this review have comment_meta to be updated
            $should_update_comment_meta = (isset($comment_id) && !empty($comment_id) && !isset($props['review_reply']) && $props['parent'] == 0);
            if ($should_update_comment_meta) {
                add_comment_meta($comment_id, SCR_COMMENT_META, $props);

                // WooCommerce product review
                if (get_post_type(get_comment($comment_id)->comment_post_ID) == 'product' && isset($props['rating']) && !empty($props['rating'])) {
                    add_comment_meta($comment_id, 'rating', round($props['rating'] / 20));
                }

                do_action('scr_photo_reviews/add_attachments', $comment_id);
            }

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
            $comment_data['comment_approved'] = 0;

            // Properties which change for different user types (logged_in and non_logged_in)
            if ($is_user_logged_in) {
                $user = get_user_by('id', get_current_user_id());
                $comment_data['comment_author'] = $user->display_name;
                $comment_data['comment_author_email'] = $user->user_email;
                $comment_data['comment_author_url'] = $user->user_url;
                $comment_data['user_id'] = $user->ID;
            } else {
                $commenter = wp_get_current_commenter();
                $name = (isset($commenter['comment_author'])) ? $commenter['comment_author'] : '';
                $email = (isset($commenter['comment_author_email'])) ? $commenter['comment_author_email'] : '';
                $website = (isset($commenter['comment_author_url'])) ? $commenter['comment_author_url'] : '';

                $comment_data['comment_author'] = (isset($props['name']) && !empty($props['name'])) ? $props['name'] : $name;
                $comment_data['comment_author_email'] = (isset($props['email']) && !empty($props['email'])) ? $props['email'] : $email;
                $comment_data['comment_author_url'] = (isset($props['website']) && !empty($props['website'])) ? $props['website'] : $website;
                $comment_data['user_id'] = '';
            }

            return $comment_data;
        }

        public function update($props)
        {
            $Current_User = new \StarcatReview\App\Services\User();
            $can_approve = $Current_User->can_user_directly_publish_reviews();

            $commenter = wp_get_current_commenter();

            $name = (isset($commenter['comment_author'])) ? $commenter['comment_author'] : '';
            $email = (isset($commenter['comment_author_email'])) ? $commenter['comment_author_email'] : '';
            $website = (isset($commenter['comment_author_url'])) ? $commenter['comment_author_url'] : '';

            $comment_id = $props['comment_id'];
            $comment = array(
                'comment_ID' => $props['comment_id'],
                'comment_author' => $name,
                'comment_author_email' => $email,
                'comment_author_url' => $website,
                'comment_content' => $props['description'],
                'comment_parent' => $props['parent'],
                'comment_approved' => $can_approve ? 1 : 0,
            );

            wp_update_comment($comment);

            // review only not reply update
            if ($props['parent'] == 0) {

                $data = get_comment_meta($comment_id, SCR_COMMENT_META, true);

                $votes = isset($data['votes']) && !empty($data['votes']) ? $data['votes'] : [];
                $props['votes'] = $votes;

                $attachments = isset($data['attachments']) && !empty($data['attachments']) ? $data['attachments'] : [];
                $props['attachments'] = $attachments;

                unset($props['parent']);
                unset($props['methodType']);

                update_comment_meta($comment_id, SCR_COMMENT_META, $props);

                // WooCommerce product review
                if (get_post_type(get_comment($comment_id)->comment_post_ID) == 'product' && isset($props['rating']) && !empty($props['rating'])) {
                    update_comment_meta($comment_id, 'rating', round($props['rating'] / 20));
                }

                do_action('scr_photo_reviews/add_attachments', $comment_id);
            }

            return $comment_id;
        }

        public function store_vote($props)
        {
            $meta_props = get_comment_meta($props['comment_id'], SCR_COMMENT_META, true);

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
                $meta_props = isset($meta_props) && !empty($meta_props) ? array_merge($meta_props, $vote_props) : $vote_props;
            }
            update_comment_meta($props['comment_id'], SCR_COMMENT_META, $meta_props);
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
