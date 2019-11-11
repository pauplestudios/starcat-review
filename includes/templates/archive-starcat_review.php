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

<?php
$archive_template = new \StarcatReview\Includes\Templates\Controllers\Archive_Template();
$content = $archive_template->get_view();

$template_builder = new \StarcatReview\Includes\Utils\Template_Builder($content);
echo $template_builder->get_html();
?>

</div><!-- #ast-container -->

<?php get_footer(); ?>