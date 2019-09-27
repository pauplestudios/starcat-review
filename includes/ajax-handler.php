<?php

namespace HelpieReviews\Includes;

use HelpieReviews\Includes\Utils\Post;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function __construct()
        { }

        public function register_ajax_actions()
        {
            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_listing_action', array($this, 'hrp_listing_action'));
            add_action('wp_ajax_hrp_listing_action', array($this, 'hrp_listing_action'));

            // add 'ajax' action when not logged in
            add_action('wp_ajax_nopriv_hrp_user_review_submission', [$this, 'user_review_submission']);
            add_action('wp_ajax_hrp_user_review_submission', [$this, 'user_review_submission']);
        }

        public function hrp_listing_action()
        {
            error_log('wp_ajax_hrp_listing_action');
        }

        public function user_review_submission()
        {
            $user_review_repo = new \HelpieReviews\App\Repositories\User_Reviews_Repo();

            $props['post_id']  = $_POST['post_id'];
            $props['title'] = $_POST['title'];
            $props['description'] = $_POST['description'];
            $props['pros'] = $_POST['pros'];
            $props['cons'] = $_POST['cons'];
            $props['stats'] = $_POST['scores'];
            $props['rating'] = $this->get_rating($props);

            $comment_id = $user_review_repo->add_review_to_comment($props);
            $comments = get_comment($comment_id);

            echo json_encode($comments);

            wp_die();
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
    } // END CLASS
}
