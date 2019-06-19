<?php
if (!function_exists('hr_fs')) {
    // Create a helper function for easy SDK access.
    function hr_fs()
    {
        global $hr_fs;

        if (!isset($hr_fs)) {
            // Include Freemius SDK.
            require_once dirname(__FILE__) . '/freemius/start.php';

            $hr_fs = fs_dynamic_init(array(
                'id'                  => '3980',
                'slug'                => 'helpie-review',
                'premium_slug'        => 'helpie_faq-premium',
                'type'                => 'plugin',
                'public_key'          => 'pk_ad2b6650d9ef2e5df3c203ea9046f',
                'is_premium'          => true,
                'premium_suffix'      => 'Pro',
                // If your plugin is a serviceware, set this option to false.
                'has_premium_version' => true,
                'has_addons'          => false,
                'has_paid_plans'      => true,
                'menu'                => array(
                    'slug'           => 'edit.php?post_type=helpie-review',
                    'first-path'     => 'edit.php?post_type=helpie_reviews&page=helpie-review-settings',
                    'support'        => false,
                ),
                // Set the SDK to work in a sandbox mode (for development & testing).
                // IMPORTANT: MAKE SURE TO REMOVE SECRET KEY BEFORE DEPLOYMENT.
                'secret_key'          => 'sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;',
            ));
        }

        return $hr_fs;
    }

    // Init Freemius.
    hr_fs();
    // Signal that SDK was initiated.
    do_action('hr_fs_loaded');
}