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
<!-- <?php get_sidebar('helpie_reviews_sidebar'); ?> -->

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

        <div class="hrp-collection row">
            <?php while (have_posts()) : the_post();
                $count = 150;

                $excerpt = get_the_content();
                $excerpt = strip_tags($excerpt);
                $excerpt = substr($excerpt, 0, $count);
                $excerpt .= ' ...';

                $item = ['title' => get_the_title(), 'content' => $excerpt, 'url' => ''];
                $card = new \HelpieReviews\App\Views\Blocks\Card();
                echo $card->get_view($item);

            endwhile; ?>
        </div>
</div>
</main>
</div><!-- #primary -->

<?php get_footer(); ?>