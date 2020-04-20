<?php

/*
Plugin Name: Starcat Review - Photos Review Addon
Plugin URI: https://starcatwp.com
Description: Add photos to your review
Author: StarcatWP
Version: 0.1
Author URI: http://helpiewp.com
Network: True
Text Domain: starcat-review-pt
Domain Path: /languages

 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

// require_once plugin_dir_path(__FILE__) . "/includes/lib/freemius-integrator.php";

define('SCR_PT_VERSION', '0.1');
define('SCR_PT__FILE__', __FILE__);
define('SCR_PT_PLUGIN_BASE', plugin_basename(SCR_PT__FILE__));
define('SCR_PT_PATH', plugin_dir_path(SCR_PT__FILE__));
define('SCR_PT_URL', plugins_url('/', SCR_PT__FILE__));

register_activation_hook(__FILE__, 'starcat_review_pt_activation');

starcat_review_pt_run();

function starcat_review_pt_run()
{
    if (!version_compare(PHP_VERSION, '5.4', '>=')) {
        add_action('admin_notices', 'starcat_review_pt_fail_php_version');
    } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
        add_action('admin_notices', 'starcat_review_pt_fail_wp_version');
    } else if (
        !in_array('starcat-review/starcat-review.php', apply_filters('active_plugins', get_option('active_plugins')))
    ) {
        add_action('admin_notices', 'starcat_review_pt_fail_dependency');
    } else {
        // require SCR_PT_PATH . 'includes/plugin.php';
    }
}

function starcat_review_pt_activation()
{
    if (
        !in_array('starcat-review/starcat-review.php', apply_filters('active_plugins', get_option('active_plugins')))
    ) {
        // Deactivate the plugin
        deactivate_plugins(SCR_PT__FILE__);
        $error_message = get_starcat_review_pt_fail_dependency_message();
        die($error_message);
    }
}

function starcat_review_pt_fail_dependency()
{
    /* translators: %s: PHP version */
    $message = get_starcat_review_pt_fail_dependency_message();
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}

function get_starcat_review_pt_fail_dependency_message()
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
function starcat_review_pt_fail_php_version()
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
function starcat_review_pt_fail_wp_version()
{
    /* translators: %s: WP version */
    $message = sprintf(esc_html__('Starcat Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'starcat-review'), '4.5');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}
/**
 * Starcat Review Internalization
 */
