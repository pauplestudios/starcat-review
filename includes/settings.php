<?php

namespace HelpieReviews\Includes;

use \HelpieReviews\Includes\Settings\HRP_Getter;

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
            add_action('wp_loaded', [$this, 'wp_loaded']);
            add_filter('csf_helpie-kb_sections', [$this, 'filter_args']);
            // $this->init();

            $this->fields = new \HelpieReviews\Includes\Settings\Fields();
        }

        public function filter_args($content)
        {
            return $content;
        }

        public function setup_options_init()
        {
            // require_once HELPIE_REVIEWS_PATH . 'includes/settings/settings-config.php';
        }

        public function wp_loaded()
        { }
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

                $this->mainpage_settings($prefix);
                $this->category_page_settings($prefix);
                $this->general_settings($prefix);
                $this->single_post_settings($prefix);

                $this->post_meta_fields();
            }
        }

        public function category_page_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'category_page_settings',
                    'title' => 'Category Page ',
                    'icon' => 'fa fa-eye',
                    'fields' => array(
                        array(
                            'id' => 'mp_slug',
                            'type' => 'text',
                            'title' => __('Main Page Slug', 'pauple-helpie'),
                            'default' => 'helpdesk',
                        ),
                        array(
                            'id' => 'cp_show_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', 'pauple-helpie'),
                            'default' => true,
                        ),
                        array(
                            'id' => 'cp_controls_subheading',
                            'type' => 'subheading',
                            'content' => 'Controls',
                            'dependency' => array('cp_show_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_show_search',
                            'type' => 'switcher',
                            'title' => __('Show Search', 'pauple-helpie'),
                            'default' => true,
                            'dependency' => array('cp_show_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_show_sortBy',
                            'type' => 'switcher',
                            'title' => __('Show SortBy', 'pauple-helpie'),
                            'default' => true,
                            'dependency' => array('cp_show_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_show_num_of_reviews_filter',
                            'type' => 'switcher',
                            'title' => __('Show Number of Review Filter', 'pauple-helpie'),
                            'default' => true,
                            'dependency' => array('cp_show_controls', '==', 'true'),
                        ),

                        array(
                            'id' => 'cp_listing_options_subheading',
                            'type' => 'subheading',
                            'content' => 'Listing Options',

                        ),
                        array(
                            'id' => 'cp_default_sortBy',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Default Sort By', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => array(
                                'alphabetical' => 'Alphabetical',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                'popular' => 'Popular',
                            ),
                            'default' => 'recent',
                        ),
                    )
                )
            );
        }
        public function mainpage_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    // 'parent' => 'user_access',
                    'id' => 'mainpage_settings',
                    'title' => 'Main Page ',
                    'icon' => 'fa fa-eye',
                    'fields' => array(
                        array(
                            'id' => 'mp_slug',
                            'type' => 'text',
                            'title' => __('Main Page Slug', 'pauple-helpie'),
                            'default' => 'helpdesk',
                        ),
                        array(
                            'id' => 'helpie_mp_meta_title',
                            'type' => 'text',
                            'title' => __('Main Page Meta Title', 'pauple-helpie'),
                            'dependency' => array('helpie_mp_location', '==', 'archive'),
                            'desc' => '<strong> Note </strong>: Keep your meta title between 60 and 64 characters.',
                            'default' => 'helpdesk',
                        ),
                        array(
                            'id' => 'helpie_mp_meta_description',
                            'type' => 'text',
                            'title' => __('Main Page Meta Description', 'pauple-helpie'),
                            'dependency' => array('helpie_mp_location', '==', 'archive'),
                            'desc' => '<strong> Note </strong>: Keep your meta descriptions between 150 and 154 characters.',
                        ),
                        array(
                            'id'        => 'mp_components_order',
                            'type'      => 'sortable',
                            'title'     => 'Components Control',
                            'desc'      => 'Controls order and visibility of these components in Main Page',
                            'fields'    => array(
                                array(
                                    'id' => 'mp_show_search',
                                    'type' => 'switcher',
                                    'title' => __('Search', 'pauple-helpie'),
                                    'default' => false,
                                ),
                                array(
                                    'id' => 'mp_show_categories',
                                    'type' => 'switcher',
                                    'title' => __('Categories', 'pauple-helpie'),
                                    'default' => true,
                                ),
                                array(
                                    'id' => 'mp_show_review_listing',
                                    'type' => 'switcher',
                                    'title' => __('Review Listing', 'pauple-helpie'),
                                    'default' => false,
                                ),
                            ),
                            'default'      => array(
                                'mp_show_search' => false,
                                'mp_show_categories' => true,
                                'mp_show_review_listing' => false,
                            ),
                        ),

                        array(
                            'id' => 'helpie_mp_article_listing',
                            'type' => 'subheading',
                            'content' => 'Review Listing',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'helpie_mp_article_listing_title',
                            'type' => 'text',
                            'title' => __('Title', 'pauple-helpie'),
                            'default' => 'Review Listing',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),
                        array(
                            'id' => 'helpie_mp_article_listing_sortby',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Sort By', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => array(
                                'alphabetical' => 'Alphabetical',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                'popular' => 'Popular',
                            ),
                            'default' => 'recent',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),
                        array(
                            'id' => 'helpie_mp_article_listing_topics',
                            'type' => 'select',
                            'chosen' => true,
                            'multiple' => true,
                            'title' => __('Topics', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => 'csf_get_all_helpie_kb_topics',
                            'default' => 'all',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'helpie_mp_article_listing_style',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Style', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => array(
                                'list' => __('List', 'pauple-helpie'),
                                'card' => __('Card', 'pauple-helpie'),
                            ),
                            'default' => 'list',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'helpie_mp_article_listing_num_of_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => array(
                                'one' => 1,
                                'two' => 2,
                                'three' => 3,
                                'four' => 4,
                            ),
                            'default' => 'three',
                            'dependency' => array('mp_show_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_categories_settings',
                            'type' => 'subheading',
                            'content' => 'Category Listing',
                            'dependency' => array('mp_show_categories', '==', 'true'),
                        ),
                        array(
                            'id' => 'helpie_mp_template',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Main Page Categories Listing Style', 'pauple-helpie'),
                            'placeholder' => 'Select an option',
                            'options' => array(
                                'boxed' => __('Boxed', 'pauple-helpie'),
                                'boxed1' => __('Boxed1', 'pauple-helpie'),
                                'modern' => __('Modern', 'pauple-helpie'),
                            ),
                            'default' => 'boxed',
                            'dependency' => array('mp_show_categories', '==', 'true'),
                        ),
                        array(
                            'id' => 'helpie_mp_boxed_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', 'pauple-helpie'),
                            'dependency' => array('mp_show_categories', '==', 'true'),
                            'default' => false,
                        ),
                        array(
                            'id' => 'category_listing_graphic_type',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Image or Icon', 'pauple-helpie'),
                            'placeholder' => 'Select an option',
                            'options' => array(
                                'image' => __('Image', 'pauple-helpie'),
                                'icon' => __('Icon', 'pauple-helpie'),
                            ),
                            'default' => 'image',
                            'desc' => '<strong>Note </strong>: Default icon color is set from Styles -> Primary Brand Color',
                            'dependency' => array('mp_show_categories', '==', 'true'),
                        ),
                        array(
                            'id' => 'helpie_mp_cl_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', 'pauple-helpie'),
                            'placeholder' => 'Select an option',
                            'options' => array(
                                'one' => '1',
                                'two' => '2',
                                'three' => '3',
                                'four' => '4',
                            ),
                            'default' => 'three',
                            'dependency' => array('mp_show_categories', '==', 'true'),
                        ),

                    )
                )
            );
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
                            'title'       => 'Template Source',
                            'placeholder' => 'Select Template Source',
                            'options'     => array(
                                'plugin'  => 'Plugin',
                                'theme'  => 'Theme',
                            ),
                            'default'     => 'theme'
                        ),

                        // Select with CPT (custom post type) pages
                        array(
                            'id'          => 'review-location',
                            'type'        => 'select',
                            'title'       => 'Where to include reviews?',
                            'chosen' => true,
                            'placeholder' => 'Select post types',
                            'options'     => 'post_types',
                            'multiple' => true,
                        ),

                        array(
                            'id'    => 'enable-pros-cons',
                            'type'  => 'switcher',
                            'title' => 'Enable Pros and Cons',
                        ),

                    )

                    // 'fields' => $details_fields
                )
            );
        }


        public function single_post_settings($prefix)
        {
            $details_field = $this->fields->single_details_fields();
            $stats_fields = $this->fields->stats_field();
            $pro_fields = $this->fields->single_post_pros_fields();
            $con_fields = $this->fields->single_post_cons_fields();
            $rich_snippets_fields = $this->fields->rich_snippets_fields();

            $fields = array_merge($details_field, $stats_fields, $pro_fields, $con_fields, $rich_snippets_fields);
            \CSF::createSection(
                $prefix,
                array(
                    // 'parent' => 'user_access',
                    'id' => 'single_post',
                    'title' => 'Single Post',
                    'icon' => 'fa fa-eye',
                    'fields' =>  $fields
                )
            );
        }

        /* Single Post - Meta Data Options */
        public function post_meta_fields()
        {

            $locations = HRP_Getter::get('review-location');
            $enable_pros_cons =  HRP_Getter::get('enable-pros-cons');
            $prefix = '_helpie_reviews_post_options';

            \CSF::createMetabox($prefix, array(
                'title' => 'Helpie Reviews',
                // 'post_type' => 'helpie_reviews',
                'post_type' => $locations,
                'show_restore' => true,
                'theme' => 'light',
            ));

            $this->single_details($prefix);
            $this->single_post_features($prefix);

            if ($enable_pros_cons) {
                $this->single_post_pros($prefix);
                $this->single_post_cons($prefix);
            }

            $this->single_rich_snippets($prefix);
        }


        // Features - Main Settings Options
        public function single_post_settings_features($prefix,  $parent = null)
        {
            \CSF::createSection($prefix, array(
                'parent' => $parent,
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
                                ),
                            ),
                        ),
                    ),

                ),
            ));
        }

        public function single_details($prefix, $parent = null)
        {
            $details_fields = $this->fields->single_details_fields();
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
            $fields = $this->fields->rich_snippets_fields();

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

            $fields = $this->fields->single_post_pros_fields();

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Pros',
                'icon' => 'fa fa-eye',
                'fields' => $fields
            ));
        }



        public function single_post_cons($prefix, $parent = null)
        {

            $fields = $this->fields->single_post_cons_fields();

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Cons',
                'icon' => 'fa fa-eye',
                'fields' => array(

                    array(
                        'id' => 'cons',
                        'type' => 'fieldset',
                        'title' => 'Cons',
                        'fields' => $fields
                    ),

                ),
            ));
        }











        // Features - Meta Data Options
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