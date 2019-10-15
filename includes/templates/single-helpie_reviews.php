<?php
if (!defined('ABSPATH')) {
    exit;
}

// Exit if accessed directly
/*
 */

get_header();
?>


<div id="primary">

    <main id="main" class="site-main" role="main">

        <?php
        while (have_posts()) : the_post();

            $wp_post = get_post();

            // Render via Template Controller
            $singlePageController = new \HelpieReviews\Includes\Templates\Single\Controller();
            $singlePageController->render($wp_post);

        endwhile;
        ?>

    </main>
</div><!-- #primary -->

<?php get_footer();
