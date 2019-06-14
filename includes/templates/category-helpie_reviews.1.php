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
        <div class="hrp-categories-list hrp-container container">
            <?php $card = new \HelpieReviews\App\Views\Blocks\Card();

            while (have_posts()) : the_post();

                $itemProps = [
                    'title' => get_the_title(),
                    'content' => get_the_content()
                ];

                echo $card->get_view($itemProps);

            endwhile; ?>
        </div>
    </main>
</div><!-- #primary -->

<?php get_footer(); ?>