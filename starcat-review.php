<?php

/**
 * @wordpress-plugin
 * Plugin Name: Starcat Review
 * Plugin URI: https://starcatwp.com/
 * Description: Adds Author and User Reviews to any post_type
 * Version: 0.7
 * Author: StarcatWP
 * Author URI: https://starcatwp.com/
 * Text Domain: starcat-review
 * Domain Path: /languages
 *
 * WC requires at least: 3.0
 * WC tested up to: 4.4
 *
 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (function_exists('scr_fs')) {
    scr_fs()->set_basename(false, __FILE__);
} else {

    if (!class_exists('SCR_Plugin')) {

        define('SCR_VERSION', '0.7');
        define('SCR_DOMAIN', 'starcat-review');
        define('SCR_COMMENT_TYPE', 'review');
        define('SCR__FILE__', __FILE__);
        define('SCR_PLUGIN_BASE', plugin_basename(SCR__FILE__));
        define('SCR_PATH', plugin_dir_path(SCR__FILE__));
        define('SCR_URL', plugins_url('/', SCR__FILE__));

        /** Storing Settings Options in Database tables feilds using CS_Framework **/
        define('SCR_OPTIONS', 'scr_options');
        define('SCR_POST_META', '_scr_post_options');
        define('SCR_COMMENT_META', 'scr_user_review_props');
        define('SCR_CUSTOMIZE_OPTIONS', 'scr_customize_options');

        require_once plugin_dir_path(__FILE__) . "/includes/lib/freemius-integrator.php";

        class SCR_Plugin
        {
            private static $instance;
            public static function get_instance()
            {
                if (!isset(self::$instance) && !self::$instance instanceof SCR_Plugin) {
                    self::$instance = new SCR_Plugin();
                }
                return self::$instance;
            }

            private function __construct()
            {
                $this->starcat_review_run();
            }

            /* Initialize the plugin and activation */
            public function starcat_review_run()
            {
                if (!version_compare(PHP_VERSION, '5.4', '>=')) {
                    add_action('admin_notices', [$this, 'starcat_review_fail_php_version']);
                } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
                    add_action('admin_notices', [$this, 'starcat_review_fail_wp_version']);
                } else {
                    require SCR_PATH . 'includes/plugin.php';
                }
            }

            /**
             * Show in WP Dashboard notice about the plugin is not activated (PHP version).
             * @since 1.0.0
             * @return void
             */
            public function starcat_review_fail_php_version()
            {
                /* translators: %s: PHP version */
                $message = sprintf(esc_html__('Starcat Review requires PHP version %s+, plugin is currently NOT ACTIVE.', 'starcat-review'), '5.4');
                $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
                echo wp_kses_post($html_message);
            }

            /**
             * Show in WP Dashboard notice about the plugin is not activated (WP version).
             * @since 1.5.0
             * @return void
             */
            public function starcat_review_fail_wp_version()
            {
                /* translators: %s: WP version */
                $message = sprintf(esc_html__('Starcat Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'starcat-review'), '4.5');
                $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
                echo wp_kses_post($html_message);
            }
        }
    }

    SCR_Plugin::get_instance();
}
