<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\Starcat_Review_Notification')) {
    class Starcat_Review_Notification
    {
        public $plugin_domain;
        public $views_dir;
        public $version;

        public function __construct()
        {
            $this->setup_autoload();
            $this->plugin_domain = SCR_NOTIFICATION_PLUGIN_BASE;
            $this->version = SCR_NOTIFICATION_VERSION;
            $this->init_notifications();
        }
    
        public function init_notifications(){
            $service = new \StarcatReviewNotifications\Services\Notification();
            $service->load();
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
            require_once SCR_CPT_PATH . '/includes/autoloader.php';
            \StarcatReviewCpt\Autoloader::run();
        }


        /* Note: Nice Idea */
        public function load_view($view)
        {
            $path = trailingslashit($this->views_dir) . $view;

            if (file_exists($path)) {
                include $path;
            }
        }
    }
}

new Starcat_Review_Notification();