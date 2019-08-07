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

            // Load Hooks
            $this->load_hooks();

            $this->load_ajax_handler();

            // These components will handle the hooks internally, no need to call this in a hook
            $this->load_components();
        }

        public function register_cpt_and_taxonomy()
        {
            $cpt = new \HelpieReviews\Includes\Cpt();
            $cpt->register();
        }

        public function load_hooks()
        {
            $hooks = new \HelpieReviews\Includes\Hooks();
        }


        public function load_ajax_handler()
        {
            $ajax_handler = new \HelpieReviews\Includes\Ajax_Handler();
            $ajax_handler->register_ajax_actions();
        }


        public function load_components()
        {
            $shortcodes = new \HelpieReviews\Includes\Shortcodes();
            $settings = new \HelpieReviews\Includes\Settings();

            /* Notifications */
            // new \HelpieReviews\Includes\Notifications();

            /* Upgrades */
            $Upgrades = new \HelpieReviews\Includes\Upgrades();
            \HelpieReviews\Includes\Upgrades::init();

            /* Load Widgets */
            $widgets = new \HelpieReviews\Includes\Widget_Controller();
            $widgets->load();
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
                do_action('helpie_reviews/loaded');
            }

            return self::$instance;
        }

        protected function setup_autoload()
        {
            require_once HELPIE_REVIEWS_PATH . '/includes/autoloader.php';
            \HelpieReviews\Autoloader::run();
        }


        /* Note: Nice Idea */
        public function load_view($view)
        {
            $path = trailingslashit($this->views_dir) . $view;

            if (file_exists($path)) {
                include $path;
            }
        }
    } // END CLASS
}

new Helpie_Reviews();