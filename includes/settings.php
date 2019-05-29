<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly



if (!class_exists('\HelpieReviews\Includes\Settings')) {
    class Settings
    {
        public function __construct()
        {
            add_action('init', [$this, 'setup_options_init']);
            add_action('init', [$this, 'init']);
            add_filter('csf_helpie-kb_sections', [$this, 'filter_args']);
            // $this->init();

        }

        public function filter_args($content)
        {
            return $content;
        }

        public function setup_options_init()
        {
            // require_once HELPIE_REVIEWS_PATH . 'includes/settings/settings-config.php';
        }

        public function init()
        {
            error_log('\HelpieReviews\Includes\Settings init');

            if (!function_exists('\CSF') && !class_exists('\CSF')) {
                require_once HELPIE_REVIEWS_PATH . 'includes/lib/codestar-framework/codestar-framework.php';
            }

            // require_once 'settings-config.php';

            if (class_exists('\CSF')) {

                // Set a unique slug-like ID
                $prefix = 'helpie-reviews';

                // Create options
                \CSF::createOptions($prefix, array(
                    'menu_title' => 'Settings',
                    'menu_parent' => 'edit.php?post_type=helpie_reviews',
                    'menu_type' => 'submenu', // menu, submenu, options, theme, etc.
                    'menu_slug' => 'helpie-review-settings',
                    'framework_title' => 'Settings',
                    'theme' => 'light',
                    'show_search' => false, // TODO: Enable once autofill password is fixed
                ));

                $this->frontend_editor($prefix);
                $this->frontend_editor($prefix);
            }
        }


        public function frontend_editor($prefix)
        {
            // Create a section
            \CSF::createSection($prefix, array(
                'title' => __('Frontend Editor', 'pauple-helpie'),
                'icon' => 'fa fa-font',
                'fields' => array(

                    0 => array(
                        'id' => 'kb_frontend_enable',
                        'type' => 'switcher',
                        'title' => __('Enable Frontend Editing', 'pauple-helpie'),
                        'default' => false,
                    ),
                    1 => array(
                        'id' => 'kb_num_of_revisions',
                        'type' => 'text',
                        'title' => __('Number of Revisions', 'pauple-helpie'),
                        'default' => 20,
                        'validate' => 'csf_validate_numeric',
                        'dependency' => array('kb_frontend_enable', '==', '1'),
                    ),
                    2 => array(
                        'id' => 'kb_editor_type',
                        'type' => 'select',
                        'chosen' => true,
                        'title' => __('Editor Type', 'pauple-helpie'),
                        'placeholder' => 'Select an option',
                        'options' => array(
                            'inline' => __('Inline Editor', 'pauple-helpie'),
                            'wpeditor' => __('WordPress Tinymce Editor', 'pauple-helpie'),
                        ),
                        'default' => 'inline',
                        'dependency' => array('kb_frontend_enable', '==', '1'),
                    ),

                ),

            ));
        }
    } // END CLASS
}