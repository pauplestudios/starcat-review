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
        $results    = [];
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
        $query = new \WP_Query($args);

        if ($query->have_posts()) {
            while ($query->have_posts()) {
                // Optionally, pick parts of the post and create a custom collection.
                $query->the_post();
                $results[] = get_post();
            }
            wp_reset_postdata();

            $listing_controller = new \HelpieReviews\App\Widgets\Listing\Controller();
            echo $listing_controller->get_view($results);
        }

        $post_ids = [131, 123, 119];
        $comparison_controller = new \HelpieReviews\App\Widgets\Comparison\Controller();
        echo $comparison_controller->get_view($post_ids);
        ?>

</div>
</main>
</div><!-- #primary -->

<?php get_footer(); ?>