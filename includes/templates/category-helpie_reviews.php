<?php

/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Astra
 * @since 1.0.0
 */

get_header();
// get_sidebar('helpie_reviews_sidebar');
?>

<div class='sidebar'>
    <?php dynamic_sidebar('helpie_reviews_sidebar'); ?>
</div>

<div id="primary">
    <section class='hrp-archive-description'>
        <h1>Topic: <?php single_term_title() ?> </h1>
    </section>

    <main id="main"
          class="site-main"
          role="main">




        <?php
        $category_template_controller = new \HelpieReviews\Includes\Templates\Controllers\Category_Template_Controller();
        echo $category_template_controller->get_view();
        ?>

</div>
</main>
</div><!-- #primary -->

<?php get_footer(); ?>