<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\Starcat_Review')) {
    class Starcat_Review
    {
        public $plugin_domain;
        public $views_dir;
        public $version;

        public function __construct()
        {
            $this->setup_autoload();
            $this->plugin_domain = SCR_DOMAIN;
            $this->version = SCR_VERSION;

            /* Require functions.php */
            require_once SCR_PATH . 'includes/functions.php';

            /*  Reviews Register Post types and its Taxonomies */
            // $this->register_cpt_and_taxonomy();

            // Load Hooks
            $this->load_hooks();

            $this->load_ajax_handler();

            // These components will handle the hooks internally, no need to call this in a hook
            $this->load_components();
        }

        // public function register_cpt_and_taxonomy()
        // {
        //     $cpt = new \StarcatReview\Includes\Cpt();
        //     $cpt->register();
        // }

        public function load_hooks()
        {
            $hooks = new \StarcatReview\Includes\Hooks();
        }


        public function load_ajax_handler()
        {
            $ajax_handler = new \StarcatReview\Includes\Ajax_Handler();
            $ajax_handler->register_ajax_actions();
        }


        public function load_components()
        {


            $settings = new \StarcatReview\Includes\Settings();

            /* Notifications */
            // new \StarcatReview\Includes\Notifications();

            /* Upgrades */
            $Upgrades = new \StarcatReview\Includes\Upgrades();
            \StarcatReview\Includes\Upgrades::init();
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
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', 'starcat-review'), '1.0.0');
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
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', 'starcat-review'), '1.0.0');
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
                do_action('starcat_review/loaded');
            }

            return self::$instance;
        }

        protected function setup_autoload()
        {
            require_once SCR_PATH . '/includes/autoloader.php';
            \StarcatReview\Autoloader::run();
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

new Starcat_Review();