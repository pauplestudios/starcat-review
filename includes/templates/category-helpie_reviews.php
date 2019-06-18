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

            $controls_builder = new \HelpieReviews\App\Builders\Controls_Builder();
            echo $controls_builder->get_controls();
            // $list_controls = new \HelpieReviews\App\Views\Blocks\List_Controls_Listjs();
            // echo $list_controls->get_view();
            ?>

            <ul class="filter">
                <?php

                // $semantic_controls = new \HelpieReviews\App\Views\Blocks\List_Controls_Semantic();
                // echo $semantic_controls->get_view();
                ?>
            </ul>

            <div id='hrp-cat-collection'
                 class="hrp-collection list row">


                <?php
                $term = get_queried_object();
                // the query to set the posts per page to 3
                $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
                $args = array(
                    'posts_per_page' => -1,
                    'post_type' => HELPIE_REVIEWS_POST_TYPE,
                    'paged' => $paged,
                    'tax_query' => array(
                        array(
                            'taxonomy' => 'helpie_reviews_category',
                            'field'    => 'id',
                            'terms'    => $term->term_id,
                        ),
                    )
                );
                query_posts($args); ?>

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
            <ul class="ui pagination menu"></ul>
        </div>
</div>
</main>
</div><!-- #primary -->

<?php get_footer(); ?>