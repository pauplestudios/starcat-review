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

            $single_template = new \HelpieReviews\Includes\Templates\Controllers\Single_Template();
            echo $single_template->get_view(get_post());

        endwhile;
        ?>

    </main>
</div><!-- #primary -->

<?php get_footer();
