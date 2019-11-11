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
    // $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
    // echo $breadcrumb->get_view();
    ?>
    <section class='scr-archive-description'>
        <h1> <?php the_archive_title() ?> </h1>
    </section>

    <main id="main"
          class="site-main"
          role="main">
        <?php
        $archive_template = new \StarcatReview\Includes\Templates\Controllers\Archive_Template();
        $content = $archive_template->get_view();

        $template_builder = new \StarcatReview\Includes\Utils\Template_Builder($content);
        echo $template_builder->get_content();
        ?>
    </main>
</div><!-- #primary -->

<?php get_footer(); ?>