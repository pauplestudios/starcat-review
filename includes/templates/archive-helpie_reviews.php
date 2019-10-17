<?php

/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Helpie
 * @since 1.0.0
 */

get_header();

?>

<div id="primary">
    <?php
    $bread_crumb = new \StarcatReview\App\Components\BreadCrumb\Controller();
    echo $bread_crumb->get_view();
    ?>
    <section class='hrp-archive-description'>
        <h1> <?php the_archive_title() ?> </h1>
    </section>

    <main id="main" class="site-main" role="main">
        <?php
        $archive_template = new \StarcatReview\Includes\Templates\Controllers\Archive_Template();
        echo $archive_template->get_view();
        ?>
    </main>
</div><!-- #primary -->

<?php get_footer(); ?>