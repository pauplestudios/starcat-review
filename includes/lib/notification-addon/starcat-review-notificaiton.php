<?php

/*
Plugin Name: Starcat Review - Notfication Addon
Plugin URI: https://starcatwp.com
Description: Send Notification for Purchasing Orders and Product Ratings 
Author: StarcatWP
Version: 0.1
Author URI: http://helpiewp.com
Network: True
Text Domain: starcat-review-notification
Domain Path: /languages

 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

define('SCR_NOTIFICATION_VERSION', '0.1');
define('SCR_NOTIFICATION__FILE__', __FILE__);
define('SCR_NOTIFICATION_PLUGIN_BASE', plugin_basename(SCR_NOTIFICATION__FILE__));
define('SCR_NOTIFICATION_PATH', plugin_dir_path(SCR_NOTIFICATION__FILE__));
define('SCR_NOTIFICATION_URL', plugins_url('/', SCR_NOTIFICATION__FILE__));


register_activation_hook(__FILE__, 'starcat_review_notification_activation');

starcat_review_notification_start();

function starcat_review_notification_start(){
    if (!version_compare(PHP_VERSION, '5.4', '>=')) {
        add_action('admin_notices', 'starcat_review_notification_fail_php_version');
    } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
        add_action('admin_notices', 'starcat_review_notification_fail_wp_version');
    } else if (
        !in_array('starcat-review/starcat-review.php', apply_filters('active_plugins', get_option('active_plugins')))
    ) {
        add_action('admin_notices', 'starcat_review_notification_fail_dependency');
    } else {
        require SCR_NOTIFICATION_PATH . 'includes/plugin.php';
    }
}

function starcat_review_notification_activation()
{
    if (
        !in_array('starcat-review/starcat-review.php', apply_filters('active_plugins', get_option('active_plugins')))
    ) {
        // Deactivate the plugin
        deactivate_plugins(SCR_NOTIFICATION__FILE__);
        $error_message = get_starcat_review_notification_fail_dependency_message();
        die($error_message);
    }
}

function starcat_review_notification_fail_dependency()
{
    /* translators: %s: PHP version */
    $message = get_starcat_review_pt_fail_dependency_message();
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}

function get_starcat_review_notification_fail_dependency_message()
{
    return sprintf(esc_html__('This plugin (Starcat Review - CPT Addon) requires Starcat Reviews Pro plugin', 'starcat-review'));
}

/**
 * Show in WP Dashboard notice about the plugin is not activated (PHP version).
 *
 * @since 1.0.0
 *
 * @return void
 */
function starcat_review_notification_fail_php_version()
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
function starcat_review_notification_fail_wp_version()
{
    /* translators: %s: WP version */
    $message = sprintf(esc_html__('Starcat Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'starcat-review'), '4.5');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}
/**
 * Starcat Review Internalization
 */

