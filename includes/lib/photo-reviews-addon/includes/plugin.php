<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\Starcat_Review_Photo_Reviews')) {
    class Starcat_Review_Photo_Reviews
    {
        public $plugin_domain;
        public $views_dir;
        public $version;

        public function __construct()
        {
            $this->setup_autoload();
            $this->plugin_domain = SCR_PR_PLUGIN_BASE;
            $this->version = SCR_PR_VERSION;
            $this->load_photo_reviews();
        }

        public function load_photo_reviews()
        {
            $phtoto_reviews = new \StarcatReviewPhotoReviews\Components\Controller();
            $phtoto_reviews->load();
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
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', SCR_DOMAIN), '1.0.0');
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
            _doing_it_wrong(__FUNCTION__, esc_html__('Cheatin&#8217; huh?', SCR_DOMAIN), '1.0.0');
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
                do_action('starcat_pt_review/loaded');
            }

            return self::$instance;
        }

        protected function setup_autoload()
        {
            $scr_pr_autoloader_path = SCR_PR_PATH . 'includes/autoloader.php';
            require_once $scr_pr_autoloader_path;
            \StarcatReviewPhotoReviews\Autoloader::run();

            // error_log('$scr_pr_autoloader_path : ' . $scr_pr_autoloader_path);
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

new Starcat_Review_Photo_Reviews();
