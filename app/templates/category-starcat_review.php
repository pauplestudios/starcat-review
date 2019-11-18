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

$term = get_queried_object();

$template_settings = [
    'template_sidebar_style' => 'left-sidebar'
];

$category_template = new \StarcatReview\App\Templates\Controllers\Category_Template();
$content = $category_template->get_view($term);

$template_builder = new \StarcatReview\Includes\Utils\Template_Builder($content, 'category_page');
echo $template_builder->get_html();
?>
</div><!-- #ast-container -->

<?php get_footer(); ?>