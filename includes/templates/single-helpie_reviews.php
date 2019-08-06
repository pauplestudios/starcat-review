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
    $singlePageController = new \HelpieReviews\Includes\Templates\Single\Controller();
    $singlePageController->render($wp_post);

endwhile;

get_footer();