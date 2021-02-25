<?php

namespace StarcatReview\Includes;

use \StarcatReview\Includes\Settings\SCR_Getter;
use \StarcatReview\Includes\Translations as Translations;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Hooks')) {
    class Hooks
    {
        public function __construct()
        {
            /*  Reviews Init Hook */
            add_action('init', array($this, 'init_hook'));

            add_action('widgets_init', [$this, 'register_sidebar']);

            /*  Reviews Admin Section Initialization Hook */
            add_action('admin_init', array($this, 'load_admin_hooks'));

            /*  Reviews Enqueing Script Action hook */
            add_action('wp_enqueue_scripts', array($this, 'enqueue_scripts'));

            /*  Reviews Shortcode */
            // require_once SCR_PATH . 'includes/shortcodes.php';

            /* All Plugins Loaded Hook */
            add_action('plugins_loaded', array($this, 'plugins_loaded_action'));
            add_filter('the_content', array($this, 'content_filter'));

            add_action('wp_head', array($this, 'scr_schema_reviews'));

            $service_controller = new \StarcatReview\App\Services\Services();
            $service_controller->register_services();
        }

        public function init_hook()
        {
            /*  Reviews Ajax Hooks */
            $this->load_ajax_handler();

            /* Core WooCommerce Review Integration */
            new \StarcatReview\Features\Woocommerce_Integration();
        }

        public function register_sidebar()
        {

            register_sidebar(
                array(
                    'id' => 'starcat_review_sidebar',
                    'name' => __('Reviews Sidebar'),
                    'description' => __('Sidebar of Starcat Review plugin'),
                    'before_widget' => '<div id="%1$s" class="widget %2$s">',
                    'after_widget' => '</div>',
                    'before_title' => '<h3 class="widget-title">',
                    'after_title' => '</h3>',
                )
            );
        }

        public function scr_schema_reviews()
        {
            global $post;

            /* Checks for single template by post type */

            if (isset($post) && !empty($post)) {
                $review_enabled_post_types = SCR_Getter::get_review_enabled_post_types();

                foreach ($review_enabled_post_types as $post_type) {

                    if ($post->post_type == $post_type && is_single()) {

                        $schema_controller = new \StarcatReview\App\Components\Schema_Reviews\Controller();
                        $get_schema = $schema_controller->generate_schema();
                        $html = '';
                        if ($get_schema) {
                            $check_schema = $get_schema;
                            //error_log("schema check:" . $check_schema);
                            $html .= '<!-- This site is optimized -->';
                            // $html .= '<script type="application/ld+json">' . json_encode($get_schema) . '</script>';
                            $html .= '<script type="application/ld+json">' . $get_schema . '</script>';
                        }
                        echo $html;
                    }
                }
            }
        }

        public function plugins_loaded_action()
        {
            /*  Starcat Review Internalization Translation  */
            load_plugin_textdomain(SCR_DOMAIN, false, basename(dirname(SCR__FILE__)) . '/languages');

            if (class_exists('\StarcatReviewCpt\Widgets\Review_Listing\Controller')) {
                /*  Reviews Widget */
                $this->load_widgets();
                $shortcodes = new \StarcatReview\Includes\Shortcodes();
            }

            // Plugins Actions
            new \StarcatReview\Includes\Actions();
        }

        public function load_admin_hooks()
        {
            /* Vendors */
            wp_register_style('semantic', SCR_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css", [], SCR_VERSION);
            wp_enqueue_style('semantic');

            wp_register_script('semantic', SCR_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'), SCR_VERSION, true);
            wp_enqueue_script('semantic');

            /* Application */
            wp_register_style('starcat-review', SCR_URL . 'includes/assets/bundle/admin.bundle.css', [], SCR_VERSION);
            wp_enqueue_style('starcat-review');

            wp_register_script('starcat-review', SCR_URL . 'includes/assets/bundle/admin.bundle.js', array('jquery'), SCR_VERSION, true);
            wp_enqueue_script('starcat-review');

            // You Can Access these object from javascript
            wp_localize_script('starcat-review', 'SCROptions', ['enable_prosandcons' => SCR_Getter::get('enable-pros-cons')]);

            // Additional Dashboard Column fields
            $review_enabled_post_types = SCR_Getter::get_review_enabled_post_types();
            foreach ($review_enabled_post_types as $post_type) {
                add_filter("manage_{$post_type}_posts_columns", array($this, 'manage_cpt_custom_columns'), 10);
                add_action("manage_{$post_type}_posts_custom_column", array($this, 'manage_cpt_custom_column'), 10, 2);
                add_action("manage_edit-{$post_type}_sortable_columns", array($this, 'sort_posts_custom_column'), 10, 1);
            }

            // add_action('pre_get_posts', array($this, 'sort_cpt_custom_column_order'));

        }

        public function manage_cpt_custom_columns($columns)
        {
            $items = array(
                'scr_rating' => __('Rating', SCR_DOMAIN),
                // Todo: 'scr_product_price'
            );

            // add before the category column.
            return array_slice($columns, 0, -3, true) + $items + array_slice($columns, -3, null, true);
        }

        public function manage_cpt_custom_column($column, $id)
        {

            switch ($column) {
                    // Todo: 'scr_product_price'
                case 'scr_rating':
                    // Todo: save the rating as a temporary post meta which can be used in pre_get_posts
                    $rating = scr_get_overall_rating($id);
                    echo ($rating['overall']['rating'] == 0) ? '---' : $rating['dom'];
                    break;
            }
        }
        public function sort_posts_custom_column($columns)
        {
            $columns['scr_rating'] = 'scr_rating';
            return $columns;
        }

        public function sort_cpt_custom_column_order($query)
        {
            error_log('query : ' . print_r($query, true));

            if (!is_admin()) {
                return;
            }

            $orderby = $query->get('orderby');

            switch ($orderby) {
                case 'scr_rating':
                    $query->set('meta_key', '_scr_review_props');
                    $query->set('orderby', 'meta_value_num');
                    break;
            }
        }

        public function load_ajax_handler()
        {
            $ajax_handler = new \StarcatReview\Includes\Ajax_Handler();
            $ajax_handler->register_ajax_actions();
        }

        public function load_widgets()
        {

            $widgets = new \StarcatReview\Includes\Widgets\Register_Widgets();
            $widgets->load();

            $elementor_widgets = new \StarcatReview\Includes\Widgets\Register_Elementor_Widgets();
            $elementor_widgets->load();
        }

        public function content_filter($content)
        {
            $post_type = get_post_type(get_the_ID());

            if (is_singular() && $post_type !== 'product') {
                $review_content = $this->get_review_content();
                $content = $content . $review_content;
            }

            return $content;
        }

        /* Non-Hooked */

        public function get_review_content()
        {
            $reviews_builder = new \StarcatReview\App\Builders\Review_Builder();
            return $reviews_builder->get_reviews();
        }

        public function enqueue_scripts()
        {
            /* Vendors */
            wp_register_style('semantic', SCR_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css", [], SCR_VERSION);
            wp_enqueue_style('semantic');

            wp_register_style('flexbox-grid', SCR_URL . "includes/assets/vendors/flexboxgrid.min.css", [], SCR_VERSION);
            wp_enqueue_style('flexbox-grid');

            wp_register_script('semantic', SCR_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'), SCR_VERSION, true);
            wp_enqueue_script('semantic');

            /* Application */
            wp_register_style('starcat-review', SCR_URL . "includes/assets/bundle/main.bundle.css", [], SCR_VERSION);
            wp_enqueue_style('starcat-review');

            wp_register_script('starcat-review', SCR_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'), SCR_VERSION, true);
            wp_enqueue_script('starcat-review');

            wp_enqueue_style('load-fa', 'https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css');

            // You Can Access these object from javascript
            wp_localize_script('starcat-review', 'SCROptions', [
                'global_stats' => SCR_Getter::get_global_stats(),
                'required_options' => $this->get_scr_required_options(),
                'addons' => SCR_Getter::addons_available_condition(),
            ]);
            wp_localize_script('starcat-review', 'Translations', Translations::getFormSrings());
            wp_localize_script('starcat-review', 'scr_ajax', array(
                'ajax_url' => admin_url('admin-ajax.php'),
                'ajax_nonce' => wp_create_nonce('starcat-review-ajax-nonce'),
            ));
        }

        public function get_scr_required_options()
        {
            $required_options = array(
                'pr_enable' => SCR_Getter::get('pr_enable'),
                'pr_require_photo' => SCR_Getter::get('pr_require_photo'),
                'pr_photo_size' => SCR_Getter::get('pr_photo_size'),
                'pr_photo_quantity' => SCR_Getter::get('pr_photo_quantity'),
            );
            return $required_options;
        }
    } // END CLASS

}
