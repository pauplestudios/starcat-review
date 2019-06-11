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

<div id="primary">
    <section class='hrp-archive-description'>
        <h1> Reviews </h1>
    </section>

    <main id="main"
          class="site-main"
          role="main">

        <?php $terms = get_terms('helpie_reviews_category', array('parent' => 0, 'hide_empty' => false));

        ?>
        <?php foreach ($terms as $key => $term) {
            error_log('$term : ' . $term->name);
            ?>


        <div class="ast-row">
            <article itemtype="https://schema.org/CreativeWork"
                     itemscope="itemscope"
                     id="post-1"
                     class="post-1 post hrp-archive-post">
                <h2 class='hrp-entry-title'> <?php echo $term->name ?></h2>
                <?php echo $term->description ?>
            </article>
        </div>

        <?php  } ?>


    </main>
</div><!-- #primary -->

<?php get_footer(); ?>