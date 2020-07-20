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

            // These components will handle the hooks internally, no need to call this in a hook
            $this->load_components();

            // Load Hooks
            $this->load_hooks();
        }

        public function load_hooks()
        {
            $hooks = new \StarcatReview\Includes\Hooks();
        }

        public function load_components()
        {
            /* settings getter */
            require_once SCR_PATH . 'includes/settings/getter.php';

            $settings = new \StarcatReview\Includes\Settings();

            /* Upgrades */
            $Upgrades = new \StarcatReview\Includes\Upgrades();
            \StarcatReview\Includes\Upgrades::init();

            // Dashboard User review Table
            require_once SCR_PATH . '/app/components/user-reviews/table.php';

            /* New Features */
            $Non_Logged_In_User = new \StarcatReview\Features\Non_Logged_In_User();

            /* Recaptcha */
            $recaptcha = new \StarcatReview\Services\Recaptcha();

            // Developement Purpose Only to add add-ons without activate and install
            // require_once SCR_PATH . 'includes/lib/cpt-addon/starcat-review-cpt.php';
            // require_once SCR_PATH . 'includes/lib/photo-reviews-addon/starcat-review-photo-reviews.php';
            // require_once SCR_PATH . 'includes/lib/ct-addon/starcat-review-ct.php';
            // require_once SCR_PATH . 'includes/lib/starcat-review-woo-notify/starcat-review-woo-notify.php';

        }

        protected function setup_autoload()
        {
            require_once SCR_PATH . '/includes/autoloader.php';
            \StarcatReview\Autoloader::run();
        }

    } // END CLASS
}

new Starcat_Review();
