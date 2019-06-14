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
        $cats_list = new \HelpieReviews\App\Views\Review_Categories();
        echo $cats_list->get_view($terms);
        ?>




    </main>
</div><!-- #primary -->

<?php get_footer(); ?>