<?php

namespace HelpieReviews\Includes;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Hooks')) {
    class Hooks
    {
        public function __construct()
        {
            // error_log('hooks __construct');

            /* settings getter */
            require_once(HELPIE_REVIEWS_PATH . 'includes/settings/getter.php');

            /*  Reviews Init Hook */
            add_action('init', array($this, 'init_hook'));

            /* */
            add_action('widgets_init', [$this, 'register_sidebar']);

            /*  Reviews Activation Hook */
            register_activation_hook(HELPIE_REVIEWS__FILE__, array($this, 'reviews_activate'));
            /*  Reviews Admin Section Initialization Hook */
            add_action('admin_init', array($this, 'load_admin_hooks'));
            /*  Reviews Enqueing Script Action hook */
            add_action('wp_enqueue_scripts', array($this, 'enqueue_scripts'));
            /*  Reviews Shortcode */
            // require_once HELPIE_REVIEWS_PATH . 'includes/shortcodes.php';
            /* All Plugins Loaded Hook */
            add_action('plugins_loaded', array($this, 'plugins_loaded_action'));

            add_filter('the_content', array($this, 'content_filter'));
            // add_filter('the_excerpt', array($this, 'content_filter'));

            // Ajax Hooks In compare table
            add_action('wp_ajax_get_hrp_results', array($this, 'get_hrp_results'));
        }

        public function init_hook()
        {
            /*  Reviews Ajax Hooks */
            include_once HELPIE_REVIEWS_PATH . 'includes/ajax-handler.php';

            /*  Reviews Widget */
            // $this->load_widgets();




            $register_templates = new \HelpieReviews\Includes\Register_Templates();
        }

        public function register_sidebar()
        {

            register_sidebar(
                array(
                    'id' => 'helpie_reviews_sidebar',
                    'name' => __('Reviews Sidebar'),
                    'description' => __('Sidebar of Helpie Reviews plugin'),
                    'before_widget' => '<div id="%1$s" class="widget %2$s">',
                    'after_widget' => '</div>',
                    'before_title' => '<h3 class="widget-title">',
                    'after_title' => '</h3>',
                )
            );
        }


        public function reviews_activate()
        {
            /* Register Post Type and its taxonomy only for setup demo content on activation */
            $cpt = new \HelpieReviews\Includes\Cpt();
            $cpt->register_helpie_reviews_cpt();

            $this->setup_data();
        }

        public function setup_data()
        {
            $post_data = [
                'post_type' => "helpie_reviews",
                'taxonomy' => [
                    'helpie_reviews_category' => "Getting Started",
                ],
                'title' => "Yours First Reviews Question",
                'content' => "Yours relevent questions answer."
            ];

            $create_pages = new \HelpieReviews\Includes\Utils\Create_Pages();
            $create_pages->setup_data($post_data);
        }







        public function plugins_loaded_action()
        {
            /*  Reviews Settings */
            //  new \HelpieReviews\Includes\Settings();

            /*  Helpie Reviews Plugin Translation  */
            // load_plugin_textdomain('helpie-reviews', false, basename(dirname(__FILE__)) . '/languages/');

            // Plugins Actions 
            new \HelpieReviews\Includes\Actions();
        }
        public function load_admin_hooks()
        {
            // $admin = new \HelpieReviews\Includes\Admin($this->plugin_domain, $this->version);

            /* remove 'helpdesk_cateory' taxonomy submenu from Helpie Reviews Menu */
            // $admin->remove_kb_category_submenu();

            /* Vendors */
            wp_enqueue_style('semantic-css', HELPIE_REVIEWS_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css");
            wp_enqueue_script('semantic-js', HELPIE_REVIEWS_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'));

            wp_enqueue_script('helpie-reviews-script', HELPIE_REVIEWS_URL . 'includes/assets/bundle/admin.bundle.js', array('jquery'));
            wp_enqueue_style('style-name', HELPIE_REVIEWS_URL . "includes/assets/bundle/admin.bundle.css");

            // You Can Access these object from javascript
            wp_localize_script('helpie-reviews-script', 'HRPOptins', ['enable_prosandcons' => HRP_Getter::get('enable-pros-cons')]);
        }

        public function load_widgets()
        {
            $widgets = new \HelpieReviews\Includes\Widgets\Register_Widgets();
            $widgets->load();

            $elementor_widgets = new \HelpieReviews\Includes\Widgets\Register_Elementor_Widgets();
            $elementor_widgets->load();
        }


        public function content_filter($content)
        {
            $review_content = $this->get_review_content();
            $fullcontent = $content . $review_content;

            return $fullcontent;
        }

        /* Non-Hooked */

        public function get_review_content()
        {
            $reviews_builder = new \HelpieReviews\App\Builders\Review_Builder();
            return $reviews_builder->get_reviews();
        }

        public function enqueue_scripts()
        {
            /* Vendors */
            wp_enqueue_style('semantic-css', HELPIE_REVIEWS_URL . "includes/assets/vendors/semantic/bundle/semantic.min.css");
            wp_enqueue_script('semantic-js', HELPIE_REVIEWS_URL . 'includes/assets/vendors/semantic/bundle/semantic.min.js', array('jquery'));

            wp_enqueue_style('flexbox-grid', HELPIE_REVIEWS_URL . "includes/assets/vendors/flexboxgrid.min.css");

            /* Application */
            wp_register_script('helpie-reviews-script', HELPIE_REVIEWS_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'));
            wp_localize_script('helpie-reviews-script', 'hrp_ajax', array(
                'ajax_url'  => admin_url('admin-ajax.php')
            ));
            wp_enqueue_script('helpie-reviews-script', HELPIE_REVIEWS_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'));
            wp_localize_script('helpie-reviews-script', 'hrp_ajax', array(
                'ajax_url'  => admin_url('admin-ajax.php'),
                'ajax_nonce' => wp_create_nonce('helpie-reviews-ajax-nonce')
            ));
            wp_enqueue_style('style-name', HELPIE_REVIEWS_URL . "includes/assets/bundle/main.bundle.css");
        }

        public function get_hrp_results()
        {
            //get hrp resultSets 
            //echo "get hrp resultSets";
            $search_key = $_REQUEST['search_key'];
            $comparison_controller = new \HelpieReviews\App\Components\Comparison\Controller();
            $hrp_search_result_sets = $comparison_controller->get_hrp_details($search_key);
            wp_die();
        }
    } // END CLASS

}
