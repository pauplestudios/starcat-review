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

        <div id="hrp-controlled-list">
            <?php
            $list_controls = new \HelpieReviews\App\Views\Blocks\List_Controls_Listjs();
            echo $list_controls->get_view();
            ?>

            <ul class="filter">
                <?php

                $semantic_controls = new \HelpieReviews\App\Views\Blocks\List_Controls_Semantic();
                echo $semantic_controls->get_view();
                ?>
            </ul>

            <div id='hrp-cat-collection'
                 class="hrp-collection list row">


                <!-- $reviews = [2, 4, 7, 25, 50, 75, 100];
                $ii = 0; -->
                <?php while (have_posts()) : the_post();


                    if (!isset($ii)) $ii = 0;
                    $reviews = [2, 4, 7, 25, 50, 75, 100];
                    // error_log('$reviews : ' . print_r($reviews, true));
                    $word_count = 150;

                    $excerpt = get_the_content();
                    $excerpt = strip_tags($excerpt);
                    $excerpt = substr($excerpt, 0, $word_count);
                    $excerpt .= ' ...';

                    $item = ['title' => get_the_title(), 'content' => $excerpt, 'url' => '', 'reviews' => $reviews[$ii]];
                    $card = new \HelpieReviews\App\Views\Blocks\Card();
                    echo $card->get_view($item);
                    $ii++;
                endwhile; ?>
            </div>
        </div>
</div>
</main>
</div><!-- #primary -->

<?php get_footer(); ?>