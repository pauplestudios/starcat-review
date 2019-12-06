<?php

namespace StarcatReview\Includes;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Hooks')) {
    class Hooks
    {
        public function __construct()
        {

            /* settings getter */
            require_once SCR_PATH . 'includes/settings/getter.php';

            /*  Reviews Init Hook */
            add_action('init', array($this, 'init_hook'));



            /* */
            // add_action('widgets_init', [$this, 'register_sidebar']);

            /*  Reviews Admin Section Initialization Hook */
            add_action('admin_init', array($this, 'load_admin_hooks'));
            /*  Reviews Enqueing Script Action hook */
            add_action('wp_enqueue_scripts', array($this, 'enqueue_scripts'));
            /*  Reviews Shortcode */
            // require_once SCR_PATH . 'includes/shortcodes.php';
            /* All Plugins Loaded Hook */
            add_action('plugins_loaded', array($this, 'plugins_loaded_action'));

            add_filter('the_content', array($this, 'content_filter'));
            // add_filter('the_excerpt', array($this, 'content_filter'));            

            add_action('wp_head', array($this, 'scr_schema_reviews'));
            // add_filter('the_excerpt', array($this, 'content_filter'));
        }

        public function init_hook()
        {
            /*  Reviews Ajax Hooks */
            $this->load_ajax_handler();



            // $register_templates = new \StarcatReview\Includes\Register_Templates();
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

            if ($post->post_type == SCR_POST_TYPE && is_single()) {

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

        public function plugins_loaded_action()
        {
            /*  Reviews Settings */
            //  new \StarcatReview\Includes\Settings();

            /*  Starcat Review Plugin Translation  */
            // load_plugin_textdomain('starcat-review', false, basename(dirname(__FILE__)) . '/languages/');
            if (class_exists('\StarcatReviewCpt\Widgets\Review_Listing\Controller')) {
                /*  Reviews Widget */
                error_log('StarcatReview CPT Exists!');
                $this->load_widgets();
                $shortcodes = new \StarcatReview\Includes\Shortcodes();
            }

            // Plugins Actions
            new \StarcatReview\Includes\Actions();
        }
        public function load_admin_hooks()
        {
            // $admin = new \StarcatReview\Includes\Admin($this->plugin_domain, $this->version);

            /* remove 'helpdesk_cateory' taxonomy submenu from Starcat Review Menu */
            // $admin->remove_kb_category_submenu();

            /* Vendors */
            wp_enqueue_style('semantic-css', SCR_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css");
            wp_enqueue_script('semantic-js', SCR_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'));

            wp_enqueue_script('starcat-review-script', SCR_URL . 'includes/assets/bundle/admin.bundle.js', array('jquery'));
            wp_enqueue_style('style-name', SCR_URL . "includes/assets/bundle/admin.bundle.css");

            // You Can Access these object from javascript
            wp_localize_script('starcat-review-script', 'SCROptions', ['enable_prosandcons' => SCR_Getter::get('enable-pros-cons')]);
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
            // Add breadcrumbs for starcat post type only
            if (get_post_type(get_the_ID()) == SCR_POST_TYPE) {
                $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
                $content = $breadcrumb->get_view() . $content;
            }

            if (is_singular()) {
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
            wp_enqueue_style('semantic-css', SCR_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css");
            wp_enqueue_script('semantic-js', SCR_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'));

            wp_enqueue_style('flexbox-grid', SCR_URL . "includes/assets/vendors/flexboxgrid.min.css");

            /* Application */
            wp_register_script('starcat-review-script', SCR_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'));
            wp_localize_script('starcat-review-script', 'scr_ajax', array(
                'ajax_url' => admin_url('admin-ajax.php'),
                'ajax_nonce' => wp_create_nonce('starcat-review-ajax-nonce'),
            ));
            wp_enqueue_script('starcat-review-script', SCR_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'));
            wp_localize_script('starcat-review-script', 'scr_ajax', array(
                'ajax_url' => admin_url('admin-ajax.php'),
                'ajax_nonce' => wp_create_nonce('starcat-review-ajax-nonce'),
            ));
            // You Can Access these object from javascript
            wp_localize_script('starcat-review-script', 'SCROptions', [
                'global_stats' => SCR_Getter::get('global_stats'),
            ]);
            wp_enqueue_style('style-name', SCR_URL . "includes/assets/bundle/main.bundle.css");
        }
    } // END CLASS

}