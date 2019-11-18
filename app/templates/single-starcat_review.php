<?php
if (!defined('ABSPATH')) {
    exit;
}

// Exit if accessed directly
/*
 */

get_header();

while (have_posts()) : the_post();

    $template_settings = [
        'template_sidebar_style' => 'right-sidebar'
    ];

    $single_template = new \StarcatReview\App\Templates\Controllers\Single_Template();
    $content = $single_template->get_view(get_post());

    $template_builder = new \StarcatReview\Includes\Utils\Template_Builder($content, 'single_page');
    echo $template_builder->get_html();

endwhile;
?>
</div><!-- #ast-container -->

<?php get_footer();
