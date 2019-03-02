<?php
if (!defined('ABSPATH')) {
    exit;
}

// Exit if accessed directly
/*
 */

get_header();
while (have_posts()): the_post();

    $wp_post = get_post();
    $review_post = new \HelpieReviews\App\Models\Review_Post($wp_post);

    $html = "<h1>" . $review_post->title . "</h1>";

    $html .= "<p>" . $review_post->content . "</p>";

    foreach ($review_post->stats as $key => $value) {
        $html .= "<p>" . $key . " - " . $value . "</p>";
    }
    // $title = get_the_title();
    // $content = get_the_content();

    // echo $title;
    // echo $content;
endwhile;

get_footer();
