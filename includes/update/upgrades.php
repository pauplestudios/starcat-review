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

            self::clear_current_verion_cache();

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

        public static function clear_current_verion_cache(){
            error_log('*** init clear_current_verion_cache ***');
            $current_version = SCR_VERSION;
            error_log('[$current_version] : ' .$current_version );
            //check & update db version

            if($current_version == get_option('SCR_VERSION')){
                return;
            }
            
            $upgrades = get_option('slug_upgrades');
            error_log('upgrades1 : ' . print_r($upgrades, true));
            if(!isset($upgrades[$current_version]) || empty($upgrades)) {
                return;
            }

            $upgrades_versions = array_keys($upgrades);
            error_log('[$upgrades_versions] : ' . print_r($upgrades_versions, true));
            $last_version_index =  array_search($current_version,$upgrades_versions) - 1;
            $last_db_version  = isset($upgrades_versions[$last_version_index]) ? $upgrades_versions[$last_version_index]: '';
            error_log('[$last_db_version] : ' .$last_db_version );
            unset($upgrades[$current_version]);
            update_option('slug_upgrades',$upgrades);
            if(!empty($last_db_version)){
                update_option('SCR_VERSION',$last_db_version);
            }

            return true;

        }

    } // END CLASS
}
