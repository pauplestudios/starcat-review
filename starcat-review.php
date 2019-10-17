<?php

/*
Plugin Name: Starcat Review
Plugin URI: http://helpiewp.com/helpie-reviews/
Description: Adds Author and User Reviews to any post_type
Author: HelpieWP
Version: 0.1
Author URI: http://helpiewp.com
Network: True
Text Domain: starcat-review
Domain Path: /languages

 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

require_once plugin_dir_path(__FILE__) . "/includes/lib/freemius-integrator.php";

define('SCR_VERSION', '0.2');
define('SCR_DOMAIN', 'starcat-review');
define('SCR_POST_TYPE', 'starcat_review');
define('SCR_CATEGORY', 'scr_category');
define('SCR__FILE__', __FILE__);
define('SCR_PLUGIN_BASE', plugin_basename(SCR__FILE__));
define('SCR_PATH', plugin_dir_path(SCR__FILE__));
define('SCR_URL', plugins_url('/', SCR__FILE__));

/**
 * Storing Settings Options in Database tables feilds using CS_Framework
 */

define('SCR_OPTIONS', 'scr_options');
define('SCR_CUSTOMIZE_OPTIONS', 'scr_customize_options');

starcat_review_activation();

function starcat_review_activation()
{
    if (!version_compare(PHP_VERSION, '5.4', '>=')) {
        add_action('admin_notices', 'starcat_review_fail_php_version');
    } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
        add_action('admin_notices', 'starcat_review_fail_wp_version');
    } else {
        require SCR_PATH . 'includes/plugin.php';
    }
}

/**
 * Show in WP Dashboard notice about the plugin is not activated (PHP version).
 *
 * @since 1.0.0
 *
 * @return void
 */
function starcat_review_fail_php_version()
{
    /* translators: %s: PHP version */
    $message = sprintf(esc_html__('Starcat Review requires PHP version %s+, plugin is currently NOT ACTIVE.', 'starcat-review'), '5.4');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}

/**
 * Show in WP Dashboard notice about the plugin is not activated (WP version).
 *
 * @since 1.5.0
 *
 * @return void
 */
function starcat_review_fail_wp_version()
{
    /* translators: %s: WP version */
    $message = sprintf(esc_html__('Starcat Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'starcat-review'), '4.5');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}
/**
 * Starcat Review Internalization
 */
