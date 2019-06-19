<?php

namespace HelpieReviews\Includes\Lib;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!class_exists('\HelpieReviews\Includes\Lib\Upgrader')) {
    class Upgrader
    {
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
        public static function init($db_version, $file_version)
        {
            $db_version = get_option('pauple_helpie_plugin_version');

            // Normal init.
            if ($db_version === $file_version) {
                return;
            }

            $upgrade_success = self::check_upgrades($db_version);

            // error_log('$upgrade_success : ' . $upgrade_success);
            if ($upgrade_success) {
                \update_option('pauple_helpie_plugin_version', HELPIE_PLUGIN_VERSION);
            }
        }
        /**
         * Check upgrades.
         *
         * Checks whether a given plugin version needs to be upgraded.
         *
         * If an upgrade required for a specific plugin version, it will update
         * the `pauple_helpie_plugin_version` option in the database.
         *
         * @static
         * @since 1.0.10
         * @access private
         *
         * @param string $db_version
         */
        public static function check_upgrades($db_version)
        {

            $upgrade_success = false;

            $upgrades = [
                '0.2' => 'upgrade_v02',
                '0.3' => 'upgrade_v03',
            ];

            // It's a new install.
            if (!$db_version) {
                self::fresh_install_action($upgrades);
                return;
            }

            $plugin_slug = 'helpie_kb';
            $plugin_upgrades = get_option($plugin_slug . '_upgrades', []);

            // Runs methods of each upgrade
            foreach ($upgrades as $version => $function) {
                if (version_compare($db_version, $version, '<') && !isset($plugin_upgrades[$version])) {

                    $result = self::$function(); // fire sequencial upgrade from given array value

                    if ($result == false) {
                        break;
                    } else {
                        $upgrade_success = true;
                    }

                    $plugin_upgrades[$version] = true;
                    \update_option($plugin_slug . '_upgrades', $plugin_upgrades);
                }
            }

            // $result = self::upgrade_v191();

            return $upgrade_success;
        }

        private static function upgrade_v02()
        {

            $update_191 = new \Helpie\Includes\Update\Update_191();
            $result = $update_191->update();
            return $result;
        }

        private static function upgrade_v03()
        {

            $update_191 = new \Helpie\Includes\Update\Update_191();
            $result = $update_191->update();
            return $result;
        }

        private static function fresh_install_action($upgrades)
        {
            $helpie_plugin_version = 0.0;
            foreach ($upgrades as $version => $method_name) {
                $helpie_kb_upgrades[$version] = true;
            }
            update_option('helpie_kb_upgrades', $helpie_kb_upgrades);
        }
    } // END CLASS
}