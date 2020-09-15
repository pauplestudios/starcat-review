<?php
if (!function_exists('scr_fs')) {
    // Create a helper function for easy SDK access.
    function scr_fs()
    {
        global $scr_fs;

        if (!isset($scr_fs)) {
            // Activate multisite network integration.
            if (!defined('WP_FS__PRODUCT_3980_MULTISITE')) {
                define('WP_FS__PRODUCT_3980_MULTISITE', true);
            }

            // Include Freemius SDK.
            require_once dirname(__FILE__) . '/freemius/start.php';

            $scr_fs = fs_dynamic_init(array(
                'id' => '3980',
                'slug' => 'starcat-review',
                'type' => 'plugin',
                'public_key' => 'pk_ad2b6650d9ef2e5df3c203ea9046f',
                'is_premium' => true,
                'premium_suffix' => '',
                // If your plugin is a serviceware, set this option to false.
                'has_premium_version' => true,
                'has_addons' => true,
                'has_paid_plans' => true,
                'is_org_compliant' => false,
                'trial' => array(
                    'days' => 7,
                    'is_require_payment' => false,
                ),
                'menu' => array(
                    'slug' => 'scr-settings',
                    'override_exact' => true,
                    'contact' => false,
                ),
                // Set the SDK to work in a sandbox mode (for development & testing).
                // IMPORTANT: MAKE SURE TO REMOVE SECRET KEY BEFORE DEPLOYMENT.
                'secret_key' => 'sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;',
            ));
        }

        return $scr_fs;
    }

    // Init Freemius.
    scr_fs();
    // Signal that SDK was initiated.
    do_action('scr_fs_loaded');

    scr_fs()->add_filter('support_forum_submenu', 'scr_fs_support_forum_submenu');
    scr_fs()->add_filter('support_forum_url', 'scr_fs_support_forum_url');

    // scr_fs()->add_filter('connect_url', 'scr_fs_settings_url');
    // scr_fs()->add_filter('after_skip_url', 'scr_fs_settings_url');
    // scr_fs()->add_filter('after_connect_url', 'scr_fs_settings_url');
    // scr_fs()->add_filter('after_pending_connect_url', 'scr_fs_settings_url');

    // function scr_fs_settings_url()
    // {
    //     return admin_url('edit.php?post_type=starcat_review&page=scr-settings');
    // }

    function scr_fs_support_forum_submenu($wp_org_support_forum_submenu)
    {
        return __('Support', SCR_DOMAIN);
    }

    function scr_fs_support_forum_url($wp_org_support_forum_url)
    {
        return 'https://pauple.freshdesk.com/';
    }
}
