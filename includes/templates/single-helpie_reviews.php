<?php
if (!defined('ABSPATH')) {
    exit;
}

// Exit if accessed directly
/*
 */

get_header();
while (have_posts()) : the_post();

    $wp_post = get_post();

    // Render via Template Controller
    $singlePageController = new \HelpieReviews\App\Templates\Single\SinglePageController();
    $singlePageController->render($wp_post);

endwhile;

get_footer();