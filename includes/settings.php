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

                $this->general_settings($prefix);
                $this->single_post($prefix);

                $this->post_meta_fields();
            }
        }

        public function general_settings($prefix)
        {

            \CSF::createSection(
                $prefix,
                array(
                    // 'parent' => 'user_access',
                    'id' => 'general_settings',
                    'title' => 'General Settings',
                    'icon' => 'fa fa-eye',
                    'fields' => array(

                        array(
                            'id'    => 'settings-pro-1',
                            'type'  => 'text',
                            'title' => 'Affiliate Link'
                        ),
                        // A Heading
                        array(
                            'type'    => 'heading',
                            'content' => 'Review Post Type',
                        ),
                        array(
                            'id'          => 'template_source',
                            'type'        => 'select',
                            'title'       => 'Current',
                            'placeholder' => 'Template Source',
                            'options'     => array(
                                'plugin'  => 'Plugin',
                                'theme'  => 'Theme',
                            ),
                            'default'     => 'theme'
                        ),

                    )

                    // 'fields' => $details_fields
                )
            );
        }


        public function post_meta_fields()
        {

            $prefix = '_helpie_reviews_post_options';

            \CSF::createMetabox($prefix, array(
                'title' => 'Helpie Reviews',
                'post_type' => 'helpie_reviews',
                'show_restore' => true,
            ));

            $this->single_details($prefix);
            $this->single_post_features($prefix);
            $this->single_post_pros($prefix);
            $this->single_post_cons($prefix);
            $this->single_rich_snippets($prefix);
        }

        public function single_post($prefix)
        {

            \CSF::createSection(
                $prefix,
                array(
                    // 'parent' => 'user_access',
                    'id' => 'single_post',
                    'title' => 'Single Post',
                    'icon' => 'fa fa-eye',
                    'fields' => array(
                        'id' => 'can_view',
                        'type' => 'fieldset',
                        'title' => 'Item Details',
                        'fields' => [array(
                            'id'    => 'pro-1',
                            'type'  => 'text',
                            'title' => 'Affiliate Link'
                        ),]

                    )

                    // 'fields' => $details_fields
                )
            );

            $this->single_details($prefix, 'single_post');
            $this->single_rich_snippets($prefix, 'single_post');
            $this->single_post_pros($prefix, 'single_post');
            $this->single_post_cons($prefix, 'single_post');
        }


        public function single_details($prefix, $parent = null)
        {
            $details_fields = $this->single_details_fields();
            \CSF::createSection(
                $prefix,
                array(
                    'parent' => $parent,
                    'title' => 'Item Details',
                    'icon' => 'fa fa-eye',
                    'fields' => $details_fields
                )
            );
        }

        public function single_rich_snippets($prefix, $parent = null)
        {
            $fields = $this->rich_snippets_fields();

            \CSF::createSection(
                $prefix,
                array(
                    'parent' => $parent,
                    'title' => 'Rich Snippets',
                    'icon' => 'fa fa-eye',
                    'fields' => $fields
                )
            );
        }

        public function single_post_pros($prefix, $parent = null)
        {

            $fields = $this->single_post_pros_fields();

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Pros',
                'icon' => 'fa fa-eye',
                'fields' => $fields
            ));
        }


        public function single_post_cons($prefix, $parent = null)
        {

            $fields = $this->single_post_cons_fields();

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Cons',
                'icon' => 'fa fa-eye',
                'fields' => array(

                    array(
                        'id' => 'can_view',
                        'type' => 'fieldset',
                        'title' => 'Cons',
                        'fields' => $fields
                    ),

                ),
            ));
        }

        public function single_post_cons_fields()
        {
            return array(
                array(
                    'id'     => 'opt-repeater-1',
                    'type'   => 'repeater',
                    'title'  => 'Repeater',
                    'fields' => array(

                        array(
                            'id'    => 'con-1',
                            'type'  => 'text',
                            'title' => 'Feature'
                        ),
                    ),
                ),
            );
        }
        public function single_post_pros_fields()
        {
            return array(

                array(
                    'id' => 'can_view',
                    'type' => 'fieldset',
                    'title' => 'Pros',
                    'fields' => array(
                        array(
                            'id'     => 'opt-repeater-1',
                            'type'   => 'repeater',
                            'title'  => 'Repeater',
                            'fields' => array(

                                array(
                                    'id'    => 'pro-1',
                                    'type'  => 'text',
                                    'title' => 'Feature'
                                ),
                            ),
                        ),
                    ),
                ),

            );
        }


        public function single_details_fields()
        {
            return  array(
                array(
                    'id' => 'can_view',
                    'type' => 'fieldset',
                    'title' => 'Item Details',
                    'fields' => array(
                        array(
                            'id'    => 'pro-1',
                            'type'  => 'text',
                            'title' => 'Affiliate Button Text'
                        ),
                        array(
                            'id'    => 'pro-1',
                            'type'  => 'text',
                            'title' => 'Affiliate Link'
                        ),

                        array(
                            'id'          => 'opt-select-1',
                            'type'        => 'select',
                            'title'       => 'Current',
                            'placeholder' => 'Select an option',
                            'options'     => array(
                                'option-1'  => '$',
                                'option-2'  => 'Rs',
                                'option-3'  => 'Option 3',
                            ),
                            'default'     => 'option-1'
                        ),

                        array(
                            'id'    => 'pro-1',
                            'type'  => 'text',
                            'title' => 'Product Price'
                        ),
                    )
                )

            );
        }

        public function rich_snippets_fields()
        {
            return array(

                array(
                    'id' => 'can_view',
                    'type' => 'fieldset',
                    'title' => 'Rich Snippets',
                    'fields' => array(
                        array(
                            'id'          => 'opt-select-1',
                            'type'        => 'select',
                            'title'       => 'Select',
                            'placeholder' => 'Select an option',
                            'options'     => array(
                                'option-1'  => 'Option 1',
                                'option-2'  => 'Option 2',
                                'option-3'  => 'Option 3',
                            ),
                            'default'     => 'option-2'
                        ),
                    ),
                )
            );
        }







        public function single_post_features($prefix)
        {
            \CSF::createSection($prefix, array(
                // 'parent' => 'user_access',
                'title' => 'Stats',
                'icon' => 'fa fa-eye',
                'fields' => array(

                    array(
                        'id' => 'stats',
                        'type' => 'fieldset',
                        'title' => 'Features',
                        'fields' => array(
                            array(
                                'id'     => 'stats-list',
                                'type'   => 'repeater',
                                'title'  => 'Repeater',
                                'fields' => array(

                                    array(
                                        'id'    => 'stat_name',
                                        'type'  => 'text',
                                        'title' => 'Stat Name'
                                    ),
                                    array(
                                        'id'    => 'rating',
                                        'type'  => 'text',
                                        'title' => 'Rating'
                                    ),
                                    array(
                                        'type'    => 'submessage',
                                        'style'   => 'success',
                                        'content' => 'Rating 0 - 100 ',
                                    ),
                                ),
                            ),
                        ),
                    ),


                ),
            ));
        }
    } // END CLASS
}