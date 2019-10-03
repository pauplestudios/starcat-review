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

            include_once HELPIE_REVIEWS_PATH . 'includes/settings/helper.php';
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

                $this->mainpage_settings($prefix);
                $this->category_page_settings($prefix);
                $this->single_page_settings($prefix);
                $this->user_review_settings($prefix);
                $this->comparison_table_settings($prefix);


                // $this->single_post_settings($prefix);

                $this->post_meta_fields();
            }
        }

        public function comparison_table_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'comparison_table_settings',
                    'title' => 'Comparison Table',
                    'icon' => 'fa fa-table',
                    'fields' => array(

                        array(
                            'id'          => 'ct_page', // ct: comparison_table
                            'type'        => 'select',
                            'title'       => 'Select with pages',
                            'placeholder' => 'Select a page',
                            'options'     => 'pages',
                            'desc' => '<strong>  [advanced_review_comparison_table] -> Add this shortcode to the selected page.</strong>',
                        ),




                    )
                )
            );
        }

        public function user_review_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'user_review_settings',
                    'title' => 'User Review',
                    'icon' => 'fa fa-commenting',
                    'fields' => array(

                        array(
                            'id'          => 'user-review-post-types',
                            'type'        => 'select',
                            'title'       => 'Enable Reviews for custom post types',
                            'placeholder' => 'Select a Post Type',
                            'multiple'    => true,
                            'chosen'      => true,
                            'options'     => 'post_types',
                            'query_args'  => array(
                                'post_type' => 'HELPIE_REVIEWS_POST_TYPE',
                            ),
                        ),

                        array(
                            'id' => 'ur_show_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', 'pauple-helpie'),
                            'default' => true,
                        ),
                        array(
                            'id' => 'ur_controls_subheading',
                            'type' => 'subheading',
                            'content' => 'Controls',
                            'dependency' => array('ur_show_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'ur_show_search',
                            'type' => 'switcher',
                            'title' => __('Show Search', 'pauple-helpie'),
                            'default' => true,
                            'dependency' => array('ur_show_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'ur_show_sortBy',
                            'type' => 'switcher',
                            'title' => __('Show SortBy', 'pauple-helpie'),
                            'default' => true,
                            'dependency' => array('ur_show_controls', '==', 'true'),
                        ),

                        array(
                            'id' => 'ur_features_subheading',
                            'type' => 'subheading',
                            'content' => 'Features',
                        ),
                        array(
                            'id' => 'ur_enable_replies',
                            'type' => 'switcher',
                            'title' => __('Enable Replies to Reviews', 'pauple-helpie'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_enable_approval',
                            'type' => 'switcher',
                            'title' => __('Require Admin Approval to publish reviews', 'pauple-helpie'),
                            'default' => true,
                        ),

                        array(
                            'id'     => 'ur_form',
                            'type'   => 'repeater',
                            'title'  => 'Form Fields',
                            'fields' => array(

                                array(
                                    'id'    => 'form-field',
                                    'type'  => 'text',
                                    'title' => 'Stat1'
                                ),

                            ),
                        ),

                    )
                )
            );
        }

        public function single_page_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'single_page_settings',
                    'title' => 'Single Page ',
                    'icon' => 'fa fa-file',
                    'fields' => array(

                        array(
                            'id' => 'sp_show_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', 'pauple-helpie'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'sp_rating_combination',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Default Sort By', 'pauple-helpie'),
                            'placeholder' => __('Select an option', 'pauple-helpie'),
                            'options' => array(
                                'author' => 'Author Only',
                                'user' => 'User Only',
                                'both' => 'Author and User both',
                                'combined' => 'Combined Rating',
                            ),
                            'default' => 'combined',
                        ),


                        array(
                            'id' => 'sp_stats_order',
                            'type' => 'sorter',
                            'title' => 'Stats Order',
                            'default' => [
                                'enabled' => [
                                    'feature1' => 'Feature1',
                                    'feature2' => 'Feature2',
                                    'feature3' => 'Feature3',
                                    'feature4' => 'Feature4',
                                ],
                                'disabled' => [
                                    'feature5' => 'Feature5',
                                    'feature6' => 'Feature6',
                                ]
                            ],
                        ),

                    )
                )
            );
        }


        public function category_page_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'category_page_settings',
                    'title' => 'Category Page ',
                    'icon' => 'fa fa-folder-open',
                    'fields' => array(

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
                        array(
                            'id' => 'cp_listing_num_of_cols',
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
                        ),
                    )
                )
            );
        }
        public function mainpage_settings($prefix)
        {
            $extras = new \HelpieReviews\Includes\Settings\Extras();
            $main_page_button = $extras->get_main_page_url();
            // $main_page_button = '';

            \CSF::createSection(
                $prefix,
                array(
                    // 'parent' => 'user_access',
                    'id' => 'mainpage_settings',
                    'title' => 'Main Page ',
                    'icon' => 'fa fa-home',
                    'fields' => array(

                        array(
                            'id' => 'mp_meta_title',
                            'type' => 'text',
                            'title' => __('Main Page Meta Title', 'pauple-helpie'),
                            // 'dependency' => array('helpie_mp_location', '==', 'archive'),
                            'desc' => '<strong> Note </strong>: Keep your meta title between 60 and 64 characters.',
                            'default' => 'Reviews',
                        ),
                        array(
                            'id' => 'mp_meta_description',
                            'type' => 'text',
                            'title' => __('Main Page Meta Description', 'pauple-helpie'),
                            // 'dependency' => array('helpie_mp_location', '==', 'archive'),
                            'desc' => '<strong> Note </strong>: Keep your meta descriptions between 150 and 154 characters.',
                            'default' => 'These are your reviews',
                        ),
                        array(
                            'id' => 'mp_slug',
                            'type' => 'text',
                            'title' => __('Main Page Slug', 'pauple-helpie'),
                            'default' => 'reviews',
                        ),
                        array(
                            'type'    => 'content',
                            'content' => '<div class="button-container">'
                                . '<span><b>Where is my main page?</b></span>'
                                . '<br>'
                                . $main_page_button . '<span>Save and Refresh Page if you changed it.</span></div>',
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
                            'id' => 'mp_template',
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
                            'id' => 'mp_boxed_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', 'pauple-helpie'),
                            'dependency' => array('mp_show_categories', '==', 'true'),
                            'default' => false,
                        ),
                        // array(
                        //     'id' => 'category_listing_graphic_type',
                        //     'type' => 'select',
                        //     'chosen' => true,
                        //     'title' => __('Image or Icon', 'pauple-helpie'),
                        //     'placeholder' => 'Select an option',
                        //     'options' => array(
                        //         'image' => __('Image', 'pauple-helpie'),
                        //         'icon' => __('Icon', 'pauple-helpie'),
                        //     ),
                        //     'default' => 'image',
                        //     'desc' => '<strong>Note </strong>: Default icon color is set from Styles -> Primary Brand Color',
                        //     'dependency' => array('mp_show_categories', '==', 'true'),
                        // ),
                        array(
                            'id' => 'mp_cl_cols',
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
                    'icon' => 'fa fa-cogs',
                    'fields' => array(

                        // array(
                        //     'id'    => 'settings-pro-1',
                        //     'type'  => 'text',
                        //     'title' => 'Affiliate Link'
                        // ),
                        // A Heading
                        // array(
                        //     'type'    => 'heading',
                        //     'content' => 'Review Post Type',
                        // ),
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
                            'type'    => 'submessage',
                            'style'   => 'info',
                            'content' => 'The post edit page of these posts will have the option to add ratings and reviews.',
                        ),


                        array(
                            'id'    => 'enable-pros-cons',
                            'type'  => 'switcher',
                            'title' => 'Enable Pros and Cons',
                        ),

                        array(
                            'id' => 'stats-subheading',
                            'type' => 'subheading',
                            'content' => 'Stats',
                        ),

                        array(
                            'id'     => 'stats',
                            'type'   => 'repeater',
                            'title'  => 'Stats',
                            'fields' => array(

                                array(
                                    'id'    => 'stat_name',
                                    'type'  => 'text',
                                    // 'title' => 'Stat Name',
                                    'placeholder' => 'Your Features Stat Name'
                                ),
                            ),
                        ),
                        array(
                            'type'    => 'submessage',
                            'style'   => 'info',
                            'content' => 'You can rate each of these stats in the edit post page(author rating). And if you have enabled "user_reviews", your users can rate them from the frontend',
                        ),


                        array(
                            'id'          => 'stat-singularity',
                            'type'        => 'select',
                            'title'       => 'Single or Multiple Stat',
                            'options'     => array(
                                'single'  => 'Single',
                                'multiple'  => 'Multiple',
                            ),
                            'default'     => 'single'
                        ),

                        array(
                            'id'        => 'stats-type',
                            'type'      => 'image_select',
                            'title'     => 'Stats Type',
                            'options'   => array(
                                'star' => HELPIE_REVIEWS_URL . 'includes/assets/img/stars-stat.png',
                                'bar' => HELPIE_REVIEWS_URL . 'includes/assets/img/bars-stat.png',
                            ),
                            'desc' => 'choose between star and bars stats types',
                            'default'   => 'star'
                        ),

                        array(
                            'id'      => 'stats-source-type',
                            'type'    => 'select',
                            'title'   => 'Source Type',
                            'options'   => array(
                                'icon' => 'Icon',
                                'image' => 'Image',
                            ),
                            'dependency' => array('stats-type', '==', 'star'),
                            'default' => 'icon'
                        ),

                        array(
                            'id'      => 'stats-icons',
                            'type'    => 'icon_dropdown',
                            'title'   => 'Icons',
                            'dependency' => array('stats-source-type|stats-type', '==|==', 'icon|star'),
                            'default' => 'star'
                        ),

                        array(
                            'id'      => 'stats-images',
                            'type'    => 'fieldset',
                            'title'   => 'Images',
                            'dependency' => array('stats-source-type|stats-type', '==|==', 'image|star'),
                            'fields' => array(
                                array(
                                    'id'    => 'image',
                                    'type'    => 'media',
                                    'title'   => 'Image',
                                    'library' => 'image',
                                    'placeholder'  => 'http://',
                                    'default' => [
                                        'url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png',
                                        'thumbnail' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato.png'
                                    ]
                                ),
                                array(
                                    'id'    => 'image-outline',
                                    'type'    => 'media',
                                    'title'   => 'Outline Image',
                                    'library' => 'image',
                                    'placeholder'  => 'http://',
                                    'default' => [
                                        'url' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png',
                                        'thumbnail' => HELPIE_REVIEWS_URL . 'includes/assets/img/tomato-outline.png'
                                    ],
                                ),

                                array(
                                    'type'    => 'submessage',
                                    'style'   => 'info',
                                    'content' => 'Image size below 50 * 50 is enough',
                                ),
                            ),
                        ),

                        array(
                            'id'      => 'stats-bars-limit',
                            'title'   => 'Limit',
                            'type'    => 'slider',
                            'min'     => 5,
                            'max'     => 100,
                            'step'    => 5,
                            'unit'    => '%',
                            'default' => 100,
                            'desc' => 'Bar stat Limit b/w <b> 5 to 100 </b>',
                            'dependency' => array('stats-type', '==', 'bar'),
                        ),

                        array(
                            'id'      => 'stats-stars-limit',
                            'title'   => 'Limit',
                            'type'    => 'slider',
                            'min'     => 5,
                            'max'     => 20,
                            'step'    => 5,
                            'unit'    => '#',
                            'default' => 5,
                            'desc' => 'Star stat scale b/w limit <b> 5 to 20 </b>',
                            'dependency' => array('stats-type', '==', 'star'),
                        ),

                        array(
                            'id'      => 'stats-steps',
                            'type'    => 'select',
                            'title'   => 'Steps',
                            'options'   => array(
                                'precise' => 'Precise',
                                'half' => 'Half',
                                'full' => 'Full',
                            ),
                            'default' => 'precise'
                        ),

                        array(
                            'id' => 'stats-animate',
                            'type' => 'switcher',
                            'title' => __('Stat Animate', 'pauple-helpie'),
                            'default' => false,
                        ),
                    )
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

            $fields = array_merge($details_field, $pro_fields, $con_fields, $rich_snippets_fields);
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

            $fields = $this->fields->single_post_prosandcons_fields('pros-list', 'Pros');

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Pros',
                'icon' => 'fa fa-thumbs-up',
                'fields' => $fields
            ));
        }



        public function single_post_cons($prefix, $parent = null)
        {

            $fields = $this->fields->single_post_prosandcons_fields('cons-list', 'Cons');

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Cons',
                'icon' => 'fa fa-thumbs-down',
                'fields' => $fields
            ));
        }

        // Features - Stat Fields Meta Data Options
        public function single_post_features($prefix)
        {
            $list_of_stat_fields = $this->get_stat_fields();

            \CSF::createSection($prefix, array(
                'id' => 'stat',
                'title' => 'Stats',
                'icon' => 'fa fa-eye',
                'fields' => $list_of_stat_fields
            ));
        }

        protected function get_stat_fields()
        {
            return array(

                array(
                    'id'     => 'stats-list',
                    'type'   => 'fieldset',
                    'fields'   => $this->get_statlist_from_global()
                ),

            );
        }

        protected function get_statlist_from_global()
        {
            $stats_list = [];

            $stats = HRP_Getter::get('stats');
            if (isset($stats) && !empty($stats)) {
                $stats_list[] = array(
                    'type'    => 'submessage',
                    'content' => 'Stats List',
                );

                for ($i = 0; $i < count($stats); $i++) {

                    $stats_list[] = array(
                        'id'     => $stats[$i]['stat_name'] . $i,
                        'type'   => 'fieldset',
                        'fields' => array(
                            array(
                                'id'    => 'stat_name',
                                'type'  => 'text',
                                'title' => 'Stat Name',
                                'attributes' => array(
                                    'readonly' => 'readonly',
                                ),
                                'default' => $stats[$i]['stat_name']
                            ),

                            array(
                                'id'    => 'rating',
                                'type'  => 'slider',
                                'title' => 'Rating',
                                'min'     => 0,
                                'max'     => 100,
                                'step'    => 1,
                                'unit'    => '%',
                                'default' => 0
                            ),

                            array(
                                'type'    => 'submessage',
                                'style'   => 'success',
                                'content' => 'Rating 0 - 100 ',
                            ),
                        ),
                    );
                }
            }

            return $stats_list;
        }
    } // END CLASS
}
