<?php

/*
Plugin Name: Helpie Reviews
Plugin URI: http://helpiewp.com/helpie-reviews/
Description: Adds Author and User Reviews to any post_type
Author: HelpieWP
Version: 0.1
Author URI: http://helpiewp.com
Network: True
Text Domain: helpie-reviews
Domain Path: /languages

 */

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

require_once plugin_dir_path(__FILE__) . "/includes/lib/freemius-integrator.php";

define('HELPIE_REVIEWS_VERSION', '0.2');
define('HELPIE_REVIEWS_DOMAIN', 'helpie-reviews');
define('HELPIE_REVIEWS_POST_TYPE', 'helpie_reviews');
define('HELPIE_REVIEWS_CATEGORY', 'helpie_reviews_category');
define('HELPIE_REVIEWS__FILE__', __FILE__);
define('HELPIE_REVIEWS_PLUGIN_BASE', plugin_basename(HELPIE_REVIEWS__FILE__));
define('HELPIE_REVIEWS_PATH', plugin_dir_path(HELPIE_REVIEWS__FILE__));
define('HELPIE_REVIEWS_URL', plugins_url('/', HELPIE_REVIEWS__FILE__));

/**
 * Storing Settings Options in Database tables feilds using CS_Framework
 */

define('HELPIE_REVIEWS_OPTIONS', 'helpie_reviews_options');
define('HELPIE_REVIEWS_CUSTOMIZE_OPTIONS', 'helpie_reviews_customize_options');

helpie_reviews_activation();

function helpie_reviews_activation()
{
    if (!version_compare(PHP_VERSION, '5.4', '>=')) {
        add_action('admin_notices', 'helpie_reviews_fail_php_version');
    } elseif (!version_compare(get_bloginfo('version'), '4.5', '>=')) {
        add_action('admin_notices', 'helpie_reviews_fail_wp_version');
    } else {
        require HELPIE_REVIEWS_PATH . 'includes/plugin.php';
    }
}

/**
 * Show in WP Dashboard notice about the plugin is not activated (PHP version).
 *
 * @since 1.0.0
 *
 * @return void
 */
function helpie_reviews_fail_php_version()
{
    /* translators: %s: PHP version */
    $message = sprintf(esc_html__('Helpie Reviews requires PHP version %s+, plugin is currently NOT ACTIVE.', 'helpie-reviews'), '5.4');
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
function helpie_reviews_fail_wp_version()
{
    /* translators: %s: WP version */
    $message = sprintf(esc_html__('Helpie Review requires WordPress version %s+. Because you are using an earlier version, the plugin is currently NOT ACTIVE.', 'helpie-reviews'), '4.5');
    $html_message = sprintf('<div class="error">%s</div>', wpautop($message));
    echo wp_kses_post($html_message);
}
/**
 * Helpie Reviews Internalization
 */
