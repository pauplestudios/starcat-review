<?php

namespace HelpieReviews\App;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\User_Review')) {
    class User_Review
    {
        public function __construct($wp_comment = null)
        {
            $comment_meta = get_comment_meta($wp_comment->comment_ID);

            // TODO: Refactor the need for unserialize. Check if insert method is wrong in test
            foreach ($comment_meta as $key => $value) {
                $comment_meta[$key] = unserialize($value[0]);
            }
            $this->id = $wp_comment->comment_ID;
            $this->user = "user object";
            // $this->title = "Review Title";
            $this->content = $wp_comment->comment_content;
            $this->overall_rating = 4.5;
            $this->stats = $comment_meta['stats'];
            $this->pros_and_cons = $comment_meta['pros_and_cons'];

        }

        public function set_other_props()
        {
            // Add All Comments Props to Review Props
            // $this->review_author = "WordPress User";
            // $this->review_url = "www.pauple.com";
            // $this->review_content = "Content Here....";

            // $this->comments = array();
            // $this->found_helpful_count = 6;
            // $this->verified_purchase = false;
            // $this->permalink = 'http://';
            // $this->product = array(
            //     'variant' => 'COlor1',
            // );

            // $this->content_type = array(
            //     'pros-and-cons',
            //     'simple',
            // );
        }

    } // END CLASS

}
