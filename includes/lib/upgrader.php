<?php

namespace HelpieReviews\Includes\Lib;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\HelpieReviews\Includes\Lib\Upgrader')) {
    class Upgrader
    {

        static private $db_version;
        static private $file_version;
        static private $version_option;
        static private $plugin_slug;

        static private $upgrades_list;


        public  function __construct($args = [], $upgrades_list)
        {

            self::$db_version = $args['db_version'];
            self::$file_version = $args['file_version'];
            self::$version_option = $args['version_option'];
            self::$plugin_slug = $args['slug'];

            self::$upgrades_list = $upgrades_list;
        }
        /**
         * Add actions.
         *
         * Hook into WordPress actions and launch plugin upgrades.
         *
         * @static
         * @since 1.9
         * @access public
         */
        public static function add_actions()
        {
            error_log('upgrader->add_action() ');
            add_action('init', [__CLASS__, 'init'], 20);
        }
        /**
         * Init.
         *
         * Initialize plugin upgrades.
         *
         * Fired by `init` action.
         *
         * @static
         * @since 1.9
         * @access public
         */
        public static function init()
        {

            error_log('upgrader CLASS init');

            $db_version = self::$db_version;
            $file_version = self::$file_version;

            // Normal init.
            if ($db_version === $file_version) {
                return;
            }


            $upgrade_success = self::check_upgrades($db_version);

            // error_log('$upgrade_success : ' . $upgrade_success);
            if ($upgrade_success) {
                \update_option(self::$version_option, $file_version);
            }
        }
        /**
         * Check upgrades.
         *
         * Checks whether a given plugin version needs to be upgraded.
         *
         * If an upgrade required for a specific plugin version, it will update
         * the plugin_version option in the database.
         *
         * @static
         * @since 1.0.10
         * @access private
         *
         * @param string $db_version
         */
        public static function check_upgrades($db_version)
        {

            error_log('check_upgrades');

            $upgrades_optionName = self::$plugin_slug . '_upgrades';
            $upgrade_success = false;

            $upgrades = self::$upgrades_list->get_upgrades();

            // It's a new install.
            if (!$db_version) {
                self::fresh_install_action($upgrades, $upgrades_optionName);
                return true;
            }

            error_log('NOT NEW INSTALL');


            $plugin_upgrades = get_option($upgrades_optionName, []);

            // Runs methods of each upgrade
            foreach ($upgrades as $version => $function) {
                if (version_compare($db_version, $version, '<') && !isset($plugin_upgrades[$version])) {

                    $result = self::$upgrades_list->$function(); // fire sequencial upgrade from given array value

                    error_log('$version : ' . $version  . " , result: " . $result);

                    if ($result == false) {
                        break;
                    } else {
                        $upgrade_success = true;
                    }

                    $plugin_upgrades[$version] = true;
                    \update_option($upgrades_optionName, $plugin_upgrades);
                }
            }

            // $result = self::$upgrade_v191();

            return $upgrade_success;
        }


        private static function fresh_install_action($upgrades, $upgrades_optionName)
        {
            $helpie_plugin_version = 0.0;
            foreach ($upgrades as $version => $method_name) {
                $helpie_kb_upgrades[$version] = true;
            }
            update_option($upgrades_optionName, $helpie_kb_upgrades);
        }
    } // END CLASS
}