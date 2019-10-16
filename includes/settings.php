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
                // $this->single_page_settings($prefix);
                $this->user_review_settings($prefix);
                // $this->comparison_table_settings($prefix);


                // $this->single_post_settings($prefix);

                $this->post_meta_fields();
            }
        }

        // Note : Not used in MVP but it will be after MVP release
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
                            'id'          => 'ur_enable_post-types',
                            'type'        => 'select',
                            'title'       => 'Enable Reviews for custom post types',
                            'placeholder' => 'Select a Post Type',
                            'multiple'    => true,
                            'chosen'      => true,
                            'options'     => 'post_types',
                            'query_args'  => array(
                                'post_type' => 'HELPIE_REVIEWS_POST_TYPE',
                            ),
                            'default' => 'helpie_reviews'
                        ),

                        // array(
                        //     'id' => 'ur_show_controls',
                        //     'type' => 'switcher',
                        //     'title' => __('Show Reviews Controls', 'helpie-reviews'),
                        //     'default' => true,
                        // ),

                        // array(
                        //     'id'      => 'ur_list_controls',
                        //     'type'    => 'fieldset',
                        //     'title'   => 'Reviews Controls',
                        //     'dependency' => array('ur_show_controls', '==', 'true'),
                        //     'fields' => array(

                        //         array(
                        //             'id' => 'ur_show_search',
                        //             'type' => 'switcher',
                        //             'title' => __('Show Search', 'helpie-reviews'),
                        //             'default' => true,
                        //         ),
                        //         array(
                        //             'id' => 'ur_show_sortBy',
                        //             'type' => 'switcher',
                        //             'title' => __('Show SortBy', 'helpie-reviews'),
                        //             'default' => true,
                        //         )
                        //     )
                        // ),

                        // array(
                        //     'id' => 'ur_enable_replies',
                        //     'type' => 'switcher',
                        //     'title' => __('Enable Replies to Reviews', 'helpie-reviews'),
                        //     'default' => true,
                        // ),

                        // array(
                        //     'id' => 'ur_enable_approval',
                        //     'type' => 'switcher',
                        //     'title' => __('Require Admin Approval to publish reviews', 'helpie-reviews'),
                        //     'default' => true,
                        // ),

                        // array(
                        //     'type'    => 'subheading',
                        //     'content' => 'User Review Form',
                        // ),

                        array(
                            'id' => 'ur_show_form_title',
                            'type' => 'switcher',
                            'title' => __('Show Form Title', 'helpie-reviews'),
                            'default' => true,
                        ),

                        array(
                            'id'    => 'ur_form_title',
                            'type'  => 'text',
                            'title' => 'Form Title',
                            'dependency' => array('ur_show_form_title', '==', 'true'),
                            'default' => 'Leave a Review',
                        ),

                        array(
                            'id' => 'ur_show_title',
                            'type' => 'switcher',
                            'title' => __('Show Title', 'helpie-reviews'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_show_stats',
                            'type' => 'switcher',
                            'title' => __('Show Stat', 'helpie-reviews'),
                            'default' => true,
                            'desc' => '<b>User Review Rating</b> options are based on stats option from general settings section'
                        ),

                        array(
                            'id' => 'ur_show_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', 'helpie-reviews'),
                            'default' => true,
                        ),

                        // array(
                        //     'id' => 'ur_show_prosandcons',
                        //     'type' => 'switcher',
                        //     'title' => __('Show Pros and Cons', 'helpie-reviews'),
                        //     'default' => true,
                        // ),

                        // array(
                        //     'id'     => 'ur_form_custom_fields',
                        //     'type'   => 'repeater',
                        //     'title'  => 'Custom Form Fields',
                        //     'fields' => array(

                        //         array(
                        //             'id'    => 'field_name',
                        //             'type'  => 'text',
                        //             'placeholder' => 'Field Name',
                        //             'title' => 'Name'
                        //         ),

                        //         array(
                        //             'id'    => 'field_type',
                        //             'type'  => 'select',
                        //             'desc' => 'Field Type',
                        //             'title' => 'Type',
                        //             'options' => array(
                        //                 'text' => 'Text',
                        //                 'textarea' => 'Text Area'
                        //             )
                        //         ),

                        //     ),
                        // ),

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
                            'title' => __('Show Controls', 'helpie-reviews'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'sp_rating_combination',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Show Review', 'helpie-review'),
                            'placeholder' => __('Select an option', 'helpie-review'),
                            'options' => array(
                                'author' => 'Author Only',
                                'user' => 'User Only',
                                'both' => 'Author and User both',
                                'combined' => 'Combined Rating',
                            ),
                            'default' => 'combined',
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
                            'id' => 'cp_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', 'helpie-reviews'),
                            'default' => true,
                        ),
                        array(
                            'id' => 'cp_controls_subheading',
                            'type' => 'subheading',
                            'content' => 'Controls',
                            'dependency' => array('cp_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_search',
                            'type' => 'switcher',
                            'title' => __('Show Search', 'helpie-reviews'),
                            'default' => true,
                            'dependency' => array('cp_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_sortBy',
                            'type' => 'switcher',
                            'title' => __('Show SortBy', 'helpie-reviews'),
                            'default' => true,
                            'dependency' => array('cp_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_num_of_reviews_filter',
                            'type' => 'switcher',
                            'title' => __('Show Number of Review Filter', 'helpie-reviews'),
                            'default' => true,
                            'dependency' => array('cp_controls', '==', 'true'),
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
                            'title' => __('Default Sort By', 'helpie-reviews'),
                            'placeholder' => __('Select a sortby option', 'helpie-reviews'),
                            'options' => array(
                                'alphabetical_asc' => 'Alphabetical Ascending',
                                'alphabetical_desc' => 'Alphabetical Descending',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                'num_of_reviews' => 'Number of Reviews',
                            ),
                            'default' => 'recent',
                        ),
                        array(
                            'id' => 'cp_num_of_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', 'helpie-reviews'),
                            'placeholder' => __('Select an option', 'helpie-reviews'),
                            'options' => array(
                                '1' => 1,
                                '2' => 2,
                                '3' => 3,
                                '4' => 4,
                            ),
                            'default' => '3',
                        ),
                    )
                )
            );
        }
        public function mainpage_settings($prefix)
        {
            $extras = new \HelpieReviews\Includes\Settings\Extras();
            $main_page_button = $extras->get_main_page_url();

            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'mainpage_settings',
                    'title' => 'Main Page ',
                    'icon' => 'fa fa-home',
                    'fields' => array(

                        array(
                            'id' => 'mp_meta_title',
                            'type' => 'text',
                            'title' => __('Main Page Meta Title', 'helpie-reviews'),
                            'desc' => '<strong> Note </strong>: Keep your meta title between 60 and 64 characters.',
                            'default' => 'Reviews',
                        ),
                        array(
                            'id' => 'mp_meta_description',
                            'type' => 'text',
                            'title' => __('Main Page Meta Description', 'helpie-reviews'),
                            'desc' => '<strong> Note </strong>: Keep your meta descriptions between 150 and 154 characters.',
                            'default' => 'These are your reviews',
                        ),
                        array(
                            'id' => 'mp_slug',
                            'type' => 'text',
                            'title' => __('Main Page Slug', 'helpie-reviews'),
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
                                    'id' => 'mp_category_listing',
                                    'type' => 'switcher',
                                    'title' => __('Category  Listing', 'helpie-reviews'),
                                    'default' => true,
                                ),
                                array(
                                    'id' => 'mp_review_listing',
                                    'type' => 'switcher',
                                    'title' => __('Review Listing', 'helpie-reviews'),
                                    'default' => true,
                                ),
                            ),
                            'default'      => array(
                                'mp_category_listing' => true,
                                'mp_review_listing' => true,
                            ),
                        ),

                        // cl ( Category Lising ) -- Main Page
                        array(
                            'id' => 'mp_cl_heading',
                            'type' => 'subheading',
                            'content' => 'Category Listing',
                            'dependency' => array('mp_category_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_cl_title',
                            'type' => 'text',
                            'title' => __('Title', 'helpie-reviews'),
                            'default' => 'Review Categories',
                            'dependency' => array('mp_category_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_cl_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', 'helpie-reviews'),
                            'dependency' => array('mp_category_listing', '==', 'true'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'mp_cl_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', 'helpie-reviews'),
                            'placeholder' => 'Select an option',
                            'options' => array(
                                '1' => 1,
                                '2' => 2,
                                '3' => 3,
                                '4' => 4,
                            ),
                            'default' => '2',
                            'dependency' => array('mp_category_listing', '==', 'true'),
                        ),

                        // rl ( Reviews Lising ) -- Main Page
                        array(
                            'id' => 'mp_rl_heading',
                            'type' => 'subheading',
                            'content' => 'Review Listing',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_rl_title',
                            'type' => 'text',
                            'title' => __('Title', 'helpie-reviews'),
                            'default' => 'Review Listing',
                            'default' => 'Review Posts',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),
                        array(
                            'id' => 'mp_rl_sortby',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Default Sort By', 'helpie-reviews'),
                            'placeholder' => __('Select a sortby option', 'helpie-reviews'),
                            'options' => array(
                                'alphabetical_asc' => 'Alphabetical Ascending',
                                'alphabetical_desc' => 'Alphabetical Descending',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                'num_of_reviews' => 'Number of Reviews',
                            ),
                            'default' => 'recent',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_rl_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', 'helpie-reviews'),
                            'placeholder' => __('Select an option', 'helpie-reviews'),
                            'options' => array(
                                '1' => 1,
                                '2' => 2,
                                '3' => 3,
                                '4' => 4,
                            ),
                            'default' => '3',
                            'dependency' => array('mp_review_listing', '==', 'true'),
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

                    'id' => 'general_settings',
                    'title' => 'General Settings',
                    'icon' => 'fa fa-cogs',
                    'fields' => array(

                        array(
                            'id'          => 'template_source',
                            'type'        => 'select',
                            'title'       => 'Template Source',
                            'desc' => 'Select a Template Source',
                            'options'     => array(
                                'plugin'  => 'Plugin',
                                'theme'  => 'Theme',
                            ),
                            'default'     => 'theme'
                        ),

                        // Select with CPT (custom post type) pages
                        array(
                            'id'          => 'review_enable_post-types',
                            'type'        => 'select',
                            'title'       => 'Where to include reviews?',
                            'chosen' => true,
                            'placeholder' => 'Select post types',
                            'options'     => 'post_types',
                            'multiple' => true,
                            'query_args'  => array(
                                'post_type' => 'HELPIE_REVIEWS_POST_TYPE',
                            ),
                            'default' => 'helpie_reviews'
                        ),

                        array(
                            'id'    => 'enable-pros-cons',
                            'type'  => 'switcher',
                            'title' => 'Enable Pros and Cons',
                            'default' => true,
                        ),

                        array(
                            'id' => 'stats-subheading',
                            'type' => 'subheading',
                            'content' => 'Stats',
                        ),

                        array(
                            'type'    => 'submessage',
                            // 'style'   => 'info',
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
                            'type'    => 'submessage',
                            'style'   => 'info',
                            'content' => 'The first stat is always considered as the primary stat ( highlighted by blue color ), When you change from multiple stat to single stat values from the primary stat are used.',
                            'dependency' => array('stat-singularity', '==', 'multiple'),
                        ),

                        array(
                            'id'     => 'global_stats',
                            'type'   => 'repeater',
                            'title'  => 'Stats',
                            'fields' => array(
                                array(
                                    'id'    => 'stat_name',
                                    'type'  => 'text',
                                    'placeholder' => 'Feature'
                                ),
                            ),
                            'min' => 1,
                            'default'   => array(
                                array(
                                    'stat_name' => 'Feature',
                                ),
                            ),
                            'dependency' => array('stat-singularity', '==', 'multiple'),
                        ),

                        array(
                            'id'        => 'stats-type',
                            'type'      => 'image_select',
                            'title'     => 'Stats Type',
                            'options'   => array(
                                'star' => HELPIE_REVIEWS_URL . 'includes/assets/img/stars-stat.png',
                                // 'bar' => HELPIE_REVIEWS_URL . 'includes/assets/img/bars-stat.png',
                            ),
                            // 'desc' => 'choose between star and bars stats types',
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
                            // 'dependency' => array('stats-type', '==', 'star'),
                            'default' => 'icon'
                        ),

                        array(
                            'id'      => 'stats-show-rating-label',
                            'type'    => 'switcher',
                            'title'   => 'Show Rating Label',
                            'default' => true
                        ),

                        array(
                            'id'      => 'stats-icons',
                            'type'    => 'icon_dropdown',
                            'title'   => 'Icons',
                            // 'dependency' => array('stats-source-type|stats-type', '==|==', 'icon|star'),
                            'dependency' => array('stats-source-type', '==', 'icon'),
                            'default' => 'star'
                        ),

                        array(
                            'id'      => 'stats-images',
                            'type'    => 'fieldset',
                            'title'   => 'Images',
                            // 'dependency' => array('stats-source-type|stats-type', '==|==', 'image|star'),
                            'dependency' => array('stats-source-type', '==', 'image'),
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

                        // array(
                        //     'id'      => 'stats-bars-limit',
                        //     'title'   => 'Limit',
                        //     'type'    => 'slider',
                        //     'min'     => 5,
                        //     'max'     => 100,
                        //     'step'    => 5,
                        //     'unit'    => '%',
                        //     'default' => 100,
                        //     'desc' => 'Bar stat Limit b/w <b> 5 to 100 </b>',
                        //     'dependency' => array('stats-type', '==', 'bar'),
                        // ),

                        array(
                            'id'      => 'stats-stars-limit',
                            'title'   => 'Limit',
                            'type'    => 'slider',
                            'min'     => 5,
                            'max'     => 20,
                            'step'    => 5,
                            'unit'    => '#',
                            'default' => 5,
                            'desc' => 'Star stat scale b/w limit <b> 5 to 10 </b>',
                            // 'dependency' => array('stats-type', '==', 'star'),
                        ),

                        array(
                            'id'      => 'stats-steps',
                            'type'    => 'select',
                            'title'   => 'Steps',
                            'options'   => array(
                                // 'precise' => 'Precise',
                                'half' => 'Half',
                                'full' => 'Full',
                            ),
                            'default' => 'half'
                        ),

                        array(
                            'id' => 'stats-animate',
                            'type' => 'switcher',
                            'title' => __('Stat Animate', 'helpie-reviews'),
                            'default' => false,
                        ),

                        array(
                            'id'    => 'stats-no-rated-message',
                            'type'  => 'text',
                            'title' => 'No rated message',
                            'default' => 'Not Rated Yet !!!'
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
            $locations = HRP_Getter::get('review_enable_post-types');
            $prefix = '_helpie_reviews_post_options';

            \CSF::createMetabox($prefix, array(
                'title' => 'Helpie Reviews',
                'post_type' => $locations,
                'show_restore' => true,
                'theme' => 'light',
            ));

            $this->single_post_features($prefix);
            $this->single_post_pros($prefix);
            $this->single_post_cons($prefix);

            // $this->single_details($prefix);
            // $this->single_rich_snippets($prefix);
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
                'dependency' => array('enable-pros-cons', '==', 'true', 'true'),
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
                'icon' => 'fa fa-th-list',
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

            $stats = HRP_Getter::get('global_stats');
            if (isset($stats) && !empty($stats)) {
                $stats_list[] = array(
                    'type'    => 'submessage',
                    'content' => 'Stats List',
                );
                $iteration = 0;
                foreach ($stats as $stat) {

                    $stats_list[] = array(
                        'id'     => strtolower($stat['stat_name']),
                        'type'   => 'fieldset',
                        'fields' => array(
                            array(
                                'id'    => 'stat_name',
                                'type'  => 'text',
                                'title' => 'Stat Name',
                                'attributes' => array(
                                    'readonly' => 'readonly',
                                ),
                                'default' => $stat['stat_name']
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

                    $iteration++;
                }
            }

            return $stats_list;
        }
    } // END CLASS
}
