<?php
if (!defined('ABSPATH')) {
    exit;
}

// Exit if accessed directly
/*
 */

get_header();

while (have_posts()) : the_post();

    $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
    echo $breadcrumb->get_view();

    $single_template = new \StarcatReview\Includes\Templates\Controllers\Single_Template();
    $content = $single_template->get_view(get_post());

    $template_builder = new \StarcatReview\Includes\Utils\Template_Builder($content);
    echo $template_builder->get_html();

endwhile;
?>
</div><!-- #ast-container -->

<?php get_footer();