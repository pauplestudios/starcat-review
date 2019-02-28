<?php

namespace HelpieReviews\App;

use \HelpieReviews\App\User_Review as User_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Review_Post')) {
    class Review_Post
    {
        public function __construct($wp_review = null)
        {
            $post_meta = get_post_meta($wp_review->ID);

            $this->id = $wp_review->ID;
            $this->title = $wp_review->post_title;
            $this->content = $wp_review->post_content;
            $this->overall_rating = 4.5;
            $this->stats = unserialize($post_meta['stats'][0]);

            $this->pros_and_cons = unserialize($post_meta['pros_and_cons'][0]);

            $comments_args = array(
                'post_id' => $this->id,
                'post_type' => HELPIE_REVIEWS_POST_TYPE,
                'type' => 'helpie_user_review',
            );

            $wp_user_reviews = get_comments($comments_args);

            $this->user_reviews = array();
            foreach ($wp_user_reviews as $key => $wp_user_review) {
                $this->user_reviews[$key] = new User_Review($wp_user_review);
            }

        }

    } // END CLASS
}
