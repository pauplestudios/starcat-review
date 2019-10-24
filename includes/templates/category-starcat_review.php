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
?>

<!-- <div class='sidebar'>
    <?php // dynamic_sidebar('starcat_review_sidebar');
    $term = get_queried_object();

    ?>
</div> -->

<div id="primary">

    <?php
    $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
    echo $breadcrumb->get_view();
    ?>
    <section class='scr-archive-description'>
        <h1 class="term-name">Topic: <?= $term->name ?> </h1>
        <div class="term-description"><?= $term->description ?></div>
    </section>

    <main id="main" class="site-main" role="main">

        <?php
        $category_template = new \StarcatReview\Includes\Templates\Controllers\Category_Template();
        echo $category_template->get_view($term);
        ?>

    </main>
</div><!-- #primary -->

<?php get_footer(); ?>