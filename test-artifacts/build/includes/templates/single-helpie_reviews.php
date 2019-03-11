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
    $view = new \HelpieReviews\App\Views\Single_Review($review_post);
    echo $view->get_html();
endwhile;

get_footer();