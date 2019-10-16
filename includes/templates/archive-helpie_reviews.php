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
    $bread_crumb = new \HelpieReviews\App\Components\BreadCrumb\Controller();
    echo $bread_crumb->get_view();
    ?>
    <section class='hrp-archive-description'>
        <h1> Achive Reviews </h1>
    </section>

    <main id="main" class="site-main" role="main">

        <?php
        //  $terms = get_terms('helpie_reviews_category', array('parent' => 0, 'hide_empty' => false));
        // $cats_list = new \HelpieReviews\App\Views\Review_Categories();
        // echo $cats_list->get_view($terms);
        ?>
        <?php

        $archive_template_controller = new \HelpieReviews\Includes\Templates\Controllers\Archive_Template_Controller();
        echo $archive_template_controller->get_view();

        ?>



    </main>
</div><!-- #primary -->

<?php get_footer(); ?>