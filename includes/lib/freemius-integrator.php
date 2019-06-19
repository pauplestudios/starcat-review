<?php
if (!function_exists('hrp_fs')) {
    // Create a helper function for easy SDK access.
    function hrp_fs()
    {
        global $hrp_fs;

        if (!isset($hrp_fs)) {
            // Include Freemius SDK.
            require_once dirname(__FILE__) . '/freemius/start.php';

            $hrp_fs = fs_dynamic_init(array(
                'id'                  => '3980',
                'slug'                => 'helpie-review',
                'type'                => 'plugin',
                'public_key'          => 'pk_ad2b6650d9ef2e5df3c203ea9046f',
                'is_premium'          => true,
                'premium_suffix'      => 'Pro',
                // If your plugin is a serviceware, set this option to false.
                'has_premium_version' => true,
                'has_addons'          => false,
                'has_paid_plans'      => true,
                'menu'                => array(
                    'slug'           => 'edit.php?post_type=helpie_reviews',
                    'override_exact' => true,
                    'support'        => false,
                ),
                // Set the SDK to work in a sandbox mode (for development & testing).
                // IMPORTANT: MAKE SURE TO REMOVE SECRET KEY BEFORE DEPLOYMENT.
                'secret_key'          => 'sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;',
            ));
        }

        return $hrp_fs;
    }

    // Init Freemius.
    hrp_fs();
    // Signal that SDK was initiated.
    do_action('hrp_fs_loaded');

    function hrp_fs_settings_url()
    {
        return admin_url('edit.php?post_type=helpie_reviews&page=helpie-review-settings');
    }

    // hrp_fs()->add_filter('connect_url', 'hrp_fs_settings_url');
    // hrp_fs()->add_filter('after_skip_url', 'hrp_fs_settings_url');
    // hrp_fs()->add_filter('after_connect_url', 'hrp_fs_settings_url');
    // hrp_fs()->add_filter('after_pending_connect_url', 'hrp_fs_settings_url');
}