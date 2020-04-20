<?php

/*
Plugin Name: Starcat Review - Photo Reviews Addon
Plugin URI: https://starcatwp.com
Description: Add photo to your review
Author: StarcatWP
Version: 0.1
Author URI: http://helpiewp.com
Network: True
Text Domain: starcat-review-photo-reviews
Domain Path: /languages

 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

// require_once plugin_dir_path(__FILE__) . "/includes/lib/freemius-integrator.php";

define('SCR_PR_VERSION', '0.1');
define('SCR_PR__FILE__', __FILE__);
define('SCR_PR_PLUGIN_BASE', plugin_basename(SCR_PR__FILE__));
define('SCR_PR_PATH', plugin_dir_path(SCR_PR__FILE__));
define('SCR_PR_URL', plugins_url('/', SCR_PR__FILE__));

add_action('admin_init', 'starcat_review_photo_reviews_register', 10);
add_action('plugins_loaded', 'starcat_review_photo_reviews_run', 10);

function starcat_review_photo_reviews_register()
{
    register_activation_hook(__FILE__, 'starcat_review_photo_reviews_deactivation');
}

function starcat_review_photo_reviews_run()
{
    $is_parent_active = is_parent_starcat_review_plugin_active();

    if (!version_compare(PHP_VERSION, '5.4', '>=')) {
        add_action('admin_notices', 'starcat_review_photo_reviews_fail_php_version');
    } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
        add_action('admin_notices', 'starcat_review_photo_reviews_fail_wp_version');
    } else if (
        !$is_parent_active
    ) {
        add_action('admin_notices', 'starcat_review_photo_reviews_fail_dependency');
    } else {
        require SCR_PR_PATH . 'includes/plugin.php';
    }
}

function is_parent_starcat_review_plugin_active()
{
    $active_plugins = get_option('active_plugins', array());

    if (is_multisite()) {
        $network_active_plugins = get_site_option('active_sitewide_plugins', array());
        $active_plugins = array_merge($active_plugins, array_keys($network_active_plugins));
    }

    foreach ($active_plugins as $basename) {
        if (
            0 === strpos($basename, 'starcat-review/') ||
            0 === strpos($basename, 'starcat-review-premium/')
        ) {
            return true;
        }
    }

    return false;
}

function starcat_review_photo_reviews_deactivation()
{
    $is_parent_active = is_parent_starcat_review_plugin_active();

    if (
        !$is_parent_active
    ) {
        // Deactivate the plugin
        deactivate_plugins(SCR_PR__FILE__);
        $error_message = get_starcat_review_photo_reviews_fail_dependency_message();
        die($error_message);
    }
}

function starcat_review_photo_reviews_fail_dependency()
{
    /* translators: %s: PHP version */
    $message = get_starcat_review_photo_reviews_fail_dependency_message();
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}

function get_starcat_review_photo_reviews_fail_dependency_message()
{
    return sprintf(esc_html__('This plugin (Starcat Review - Photo Reviews Addon) requires Starcat Review Pro plugin', 'starcat-review'));
}

/**
 * Show in WP Dashboard notice about the plugin is not activated (PHP version).
 *
 * @since 1.0.0
 *
 * @return void
 */
function starcat_review_photo_reviews_fail_php_version()
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
function starcat_review_photo_reviews_fail_wp_version()
{
    /* translators: %s: WP version */
    $message = sprintf(esc_html__('Starcat Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'starcat-review'), '4.5');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}
/**
 * Starcat Review Internalization
 */
