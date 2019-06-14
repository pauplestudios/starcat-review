<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\Helpie_Reviews')) {
    class Helpie_Reviews
    {
        public $plugin_domain;
        public $views_dir;
        public $version;

        public function __construct()
        {
            $this->setup_autoload();
            $this->plugin_domain = HELPIE_REVIEWS_DOMAIN;
            $this->version = HELPIE_REVIEWS_VERSION;

            /*  Reviews Register Post types and its Taxonomies */
            $this->register_cpt_and_taxonomy();
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

            /* Notifications */
            // new \HelpieReviews\Includes\Notifications();

            // These components will handle the hooks internally, no need to call this in a hook
            $this->load_components();

            // $Upgrades = new \HelpieReviews\Includes\Upgrades();
            // \HelpieReviews\Includes\Upgrades::add_actions();
        }

        public function load_components()
        {
            $hooks = new \HelpieReviews\Includes\Hooks();
            $shortcodes = new \HelpieReviews\Includes\Shortcodes();
            $settings = new \HelpieReviews\Includes\Settings();
        }
        public function init_hook()
        {
            /*  Reviews Ajax Hooks */
            // require_once HELPIE_REVIEWS_PATH . 'includes/ajax-handler.php';

            /*  Reviews Widget */
            // $this->load_widgets();

            /* settings getter */
            require_once(HELPIE_REVIEWS_PATH . 'includes/settings/getter.php');


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

        public function plugins_loaded_action()
        {
            /*  Reviews Settings */
            //  new \HelpieReviews\Includes\Settings();

            /*  Helpie Reviews Plugin Translation  */
            // load_plugin_textdomain('helpie-reviews', false, basename(dirname(__FILE__)) . '/languages/');

        }
        public function load_admin_hooks()
        {
            // $admin = new \HelpieReviews\Includes\Admin($this->plugin_domain, $this->version);

            /* remove 'helpdesk_cateory' taxonomy submenu from Helpie Reviews Menu */
            // $admin->remove_kb_category_submenu();

        }

        public function load_widgets()
        { }

        public function register_cpt_and_taxonomy()
        {
            $cpt = new \HelpieReviews\Includes\Cpt();
            $cpt->register();
        }

        /**
         * @since 1.0.0
         * @access public
         * @deprecated
         *
         * @return string
         */
        public function get_version()
        {
            return helpie_REVIEWS_VERSION;
        }

        /**
         * Throw error on object clone
         *
         * The whole idea of the singleton design pattern is that there is a single
         * object therefore, we don't want the object to be cloned.
         *
         * @access public
         * @since 1.0.0
         * @return void
         */
        public function __clone()
        {
            // Cloning instances of the class is forbidden.
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', 'helpie-reviews'), '1.0.0');
        }

        /**
         * Disable unserializing of the class
         *
         * @access public
         * @since 1.0.0
         * @return void
         */
        public function __wakeup()
        {
            // Unserializing instances of the class is forbidden.
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', 'helpie-reviews'), '1.0.0');
        }

        /**
         * @static
         * @since 1.0.0
         * @access public
         * @return Plugin
         * Note: Check how this works
         */
        public static function instance()
        {
            if (is_null(self::$instance)) {
                self::$instance = new self();
                do_action('elementor/loaded');
            }

            return self::$instance;
        }

        protected function setup_constants()
        {
            if (!defined('HELPIE_REVIEWS_PATH')) {
                define('HELPIE_REVIEWS_PATH', __DIR__);
            }
        }

        protected function setup_autoload()
        {

            require_once HELPIE_REVIEWS_PATH . '/includes/autoloader.php';
            \HelpieReviews\Autoloader::run();
        }

        public function reviews_activate()
        {
            /* Register Post Type and its taxonomy only for setup demo content on activation */
            $cpt = new \HelpieReviews\Includes\Cpt();
            $cpt->register_helpie_reviews_cpt();

            // $this->setup_data();

        }

        public function setup_data()
        {
            $args = array('post_type' => 'helpie_reviews', 'post_status' => array('publish', 'pending', 'trash'));
            $the_query = new \WP_Query($args);

            // Create Post only if it does not already exists
            if ($the_query->post_count < 1) {
                /* Setup Demo Reviews Question And Answer */
                $utils_helper = new \HelpieReviews\Utils\Helpers();
                $utils_helper->insert_term_with_post("helpie_reviews", "Getting Started", "helpie_reviews_category", "Yours First Reviews Question", "Yours relevent questions answer.");
            }
            $this->create_page_on_activate();
            wp_reset_postdata();
        }

        public function create_page_on_activate()
        {
            $create_page = new \HelpieReviews\Utils\Create_Pages();
            $create_page::create('helpie_reviews_page', 'helpie_reviews_page_id', 'Helpie Reviews', '[helpie_reviews]');
        }

        /* Note: Nice Idea */
        public function load_view($view)
        {
            $path = trailingslashit($this->views_dir) . $view;

            if (file_exists($path)) {
                include $path;
            }
        }

        public function enqueue_scripts()
        {
            wp_enqueue_script('helpie-reviews-script', HELPIE_REVIEWS_URL . 'includes/assets/bundle/main.bundle.js', array('jquery'));
            wp_enqueue_style('style-name', HELPIE_REVIEWS_URL . "includes/assets/bundle/main.bundle.css");
            wp_enqueue_style('flexbox-grid', HELPIE_REVIEWS_URL . "includes/assets/vendors/flexboxgrid.min.css");
        }
    }
}

new Helpie_Reviews();