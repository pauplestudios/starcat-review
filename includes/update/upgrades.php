<?php

namespace StarcatReview\Includes\Update;

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
if (!class_exists('\StarcatReview\Includes\Update\Upgrades')) {
    class Upgrades
    {

        public static function init()
        {
            // error_log('Upgrades->init()');
            $args = [
                'db_version' => get_option('SCR_VERSION'), //starcat_review_option
                'file_version' => SCR_VERSION,
                'version_option' => 'SCR_VERSION', //starcat_review_option
                'slug' => 'slug',
            ];

            $upgrades_list = new \StarcatReview\Includes\Update\Upgrades_List();
            include_once SCR_PATH . 'includes/lib/upgrader/upgrader.php';
            if (class_exists('\Upgrader\Upgrader')) {
                $upgrader = new \Upgrader\Upgrader($args, $upgrades_list);
                $upgrader::add_actions();
            } else {
                error_log('Upgrader Does not Exist');
            }

        }

        
    } // END CLASS
}
