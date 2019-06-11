<?php
/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Astra
 * @since 1.0.0
 */

get_header(); ?>
<?php get_sidebar(); ?>

<div id="primary">
    <section class='hrp-archive-description'>
        <h1>Topic: <?php single_term_title() ?> </h1>
    </section>

    <main id="main"
          class="site-main"
          role="main">
        <?php while (have_posts()) : the_post(); ?>

        <div class="ast-row">

            <article itemtype="https://schema.org/CreativeWork"
                     itemscope="itemscope"
                     id="post-1"
                     class="post-1 post hrp-archive-post">
                <h2 class='hrp-entry-title'> <?php the_title() ?></h2>
                <?php the_content() ?>
            </article>
        </div>
        <?php endwhile; ?>
    </main>
</div><!-- #primary -->

<?php get_footer(); ?>