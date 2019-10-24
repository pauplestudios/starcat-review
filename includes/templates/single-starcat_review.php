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

            $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
            echo $breadcrumb->get_view();

            $single_template = new \StarcatReview\Includes\Templates\Controllers\Single_Template();
            echo $single_template->get_view(get_post());

        endwhile;
        ?>

    </main>
</div><!-- #primary -->

<?php get_footer();
