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
            error_log('Upgrades->init()');
            $args = [
                'db_version' => get_option('helpie_reviews_version'),
                'file_version' => HELPIE_REVIEWS_VERSION,
                'version_option' => 'helpie_reviews_version',
                'slug' => 'helpie_reviews'
            ];

            $upgrades_list = new \HelpieReviews\Includes\Upgrades_List();

            $upgrader = new \HelpieReviews\Includes\Lib\Upgrader\Upgrader($args, $upgrades_list);
            $upgrader::add_actions();
        }
    } // END CLASS
}