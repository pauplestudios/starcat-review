<?php

namespace HelpieReviews\App\Models;

use \HelpieReviews\App\Models\User_Review as User_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Models\Review_Post')) {
    class Review_Post extends \HelpieReviews\App\Abstracts\Review
    {
        public function __construct($wp_review = null)
        {
            $this->post_meta = get_post_meta($wp_review->ID);

            error_log('$this->post_meta : ' . print_r($this->post_meta, true));
            // TODO: Refactor the need for unserialize. Check if insert method is wrong in test
            foreach ($this->post_meta as $key => $value) {
                $this->post_meta[$key] = unserialize($value[0]);
            }

            $this->id = $wp_review->ID;
            $this->title = $wp_review->post_title;
            $this->content = $wp_review->post_content;
            $this->overall_rating = 4.5;
            $this->stats = $this->get_stats();
            $this->pros_and_cons = $this->post_meta['pros_and_cons'];
            $this->set_user_reviews();
        }

        public function get_stats($source = 'post_meta')
        {
            if ($source == 'pods') {

            } else if ($source == 'acf') {

            } else {
                return $this->post_meta['stats'];
            }

        }
        public function set_user_reviews()
        {
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