<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}
/**
 * Helpie upgrades.
 *
 * Helpie upgrades handler class is responsible for updating different
 * Helpie versions.
 *
 * @since 1.9
 */
if (!class_exists('\HelpieReviews\Includes\Upgrades')) {
    class Upgrades
    {

        public static function init()
        {
            // error_log('Upgrades->init()');
            $args = [
                'db_version' => get_option('STARCAT_REVIEW_VERSION'),
                'file_version' => STARCAT_REVIEW_VERSION,
                'version_option' => 'STARCAT_REVIEW_VERSION',
                'slug' => 'starcat_review'
            ];

            $upgrades_list = new \HelpieReviews\Includes\Upgrades_List();
            include_once STARCAT_REVIEW_PATH . 'includes/lib/upgrader/upgrader.php';
            $upgrader = new \Upgrader\Upgrader($args, $upgrades_list);
            $upgrader::add_actions();
        }
    } // END CLASS
}
