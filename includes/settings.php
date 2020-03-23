<?php

namespace StarcatReview\Includes;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Settings')) {
    class Settings
    {
        public function __construct()
        {
            add_action('init', [$this, 'setup_options_init']);
            add_action('init', [$this, 'init']);
            add_action('wp_loaded', [$this, 'wp_loaded']);
            add_filter('csf_helpie-kb_sections', [$this, 'filter_args']);
            // $this->init();

            $this->fields = new \StarcatReview\Includes\Settings\Fields();
        }

        public function filter_args($content)
        {
            return $content;
        }

        public function setup_options_init()
        {
            // require_once SCR_PATH . 'includes/settings/settings-config.php';
        }

        public function wp_loaded()
        {
        }

        public function init()
        {

            if (!function_exists('\CSF') && !class_exists('\CSF')) {
                require_once SCR_PATH . 'includes/lib/codestar-framework/codestar-framework.php';
            }

            include_once SCR_PATH . 'includes/settings/helper.php';
            // require_once 'settings-config.php';

            if (class_exists('\CSF')) {

                // Set a unique slug-like ID
                $prefix = SCR_OPTIONS; // scr_options

                $options = array(
                    'menu_title' => 'Starcat Settings',
                    'menu_parent' => 'edit.php?post_type=starcat_review',
                    'menu_type' => 'menu', // menu, submenu, options, theme, etc.
                    'menu_slug' => 'scr-settings',
                    'framework_title' => 'Starcat Settings',
                    'theme' => 'light',
                    'show_search' => false, // TODO: Enable once autofill password is fixed
                );

                // Create options
                \CSF::createOptions($prefix, $options);

                $this->general_settings($prefix);
                // if (is_plugin_active('starcat-review-cpt/starcat-review-cpt.php')) {
                    // $options['menu_parent'] = null;
                    // $options['menu_type'] = 'menu';
                    $this->mainpage_settings($prefix);
                    $this->category_page_settings($prefix);
                    $this->single_page_settings($prefix);
                    $this->category_meta_fields();
              //  }

                $this->user_review_settings($prefix);
                // $this->comparison_table_settings($prefix);
                $this->notification_settings($prefix);

                $this->single_post_meta_fields();
            }
        }


        public function notification_settings($prefix){
            $admin_email = get_option('admin_email');
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'notification_settings',
                    'title' => 'Notification',
                    'icon' => 'fa fa-bell',
                    'fields' => array(
                       
                        array(
                            'id' => 'ns_from_address', // ns: notification_settings
                            'type' => 'text',
                            'title' => 'Enter From Address',
                            'placeholder' => $admin_email,
                            'default' => $admin_email,
                            'desc' => 'Make sure this is a valid email address. Invalid emails maybe marked as spam',
                        ),
                        array(
                            'id' => 'ns_subject', // ns: notification_settings
                            'type' => 'text',
                            'title' => 'Subject',
                            'placeholder' => 'Subject of the Email',
                            'default' => 'Thank you for Purchasing from {{Sitename}}',
                            'desc' => 'Use {{sitename}} to use the name of your website dynamically. This improves your anti-spam score.',
                        ),
                        array(
                            'id' => 'ns_content', // ns: notification_settings
                            'type' => 'textarea',
                            'title' => 'Body of the Email',
                            'placeholder' => 'Body of the email',
                            'default' => 'Thank you for purchasing from Starcat Dev. If you liked your product, please leave a review: {{product_review_link}}',
                            'desc' => 'Use {{product_review_link}} to add links to purchased product pages.',
                        ),
                        array(
                            'id' => 'ns_disclaimer', // ns: notification_settings
                            'type' => 'textarea',
                            'title' => 'Disclaimer',
                            'placeholder' => 'Disclaimers',
                            'desc' => '<strong>Shown at the footer of the email</strong>',
                        ),
                        array(
                            'id'     => 'ns_time_schedule', // ns: notification_settings
                            'type'   => 'repeater',
                            'title'  => 'Time Schedule',
                            'fields' => array(
                          
                              array(
                                'id'    => 'value',
                                'type'  => 'text',
                                'title' => 'Time Value'
                              ),
                              array(
                                'id'          => 'unit',
                                'type'        => 'select',
                                'title'       => 'Time Unit',
                                'placeholder' => 'Select an option',
                                'options'     => array(
                                  'hours'  => 'Hours',
                                  'days'  => 'Days',
                                ),
                                'default'     => 'days'
                              ),
                          
                            ),
                            'default'   => array(
                                array(
                                  'value' => '12',
                                  'unit' => 'hours',
                                ),
                                array(
                                  'value' => '1',
                                  'unit' => 'days' 
                                ),
                                array(
                                    'value' => '3',
                                    'unit' => 'days' 
                                )
                            )
                        ),

                     )
                )
            );
        }
        public function category_meta_fields()
        {
            // taxonomy-prefix
            $prefix = '_scr_category_options';
            // Create taxonomy options
            \CSF::createTaxonomyOptions($prefix, array(
                'taxonomy' => SCR_CATEGORY,
                'data_type' => 'serialize', // The type of the database save options. `serialize` or `unserialize`
            ));

            // Create a section
            \CSF::createSection($prefix, array(
                'fields' => array(
                    array(
                        'id' => 'featured_image',
                        'type' => 'media',
                        'title' => 'Media',
                        'library' => 'image',
                    ),

                ),
            ));
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
                            'id' => 'ct_page', // ct: comparison_table
                            'type' => 'select',
                            'title' => 'Select with pages',
                            'placeholder' => 'Select a page',
                            'options' => 'pages',
                            'desc' => '<strong>  [advanced_review_comparison_table] -> Add this shortcode to the selected page.</strong>',
                        ),

                    ),
                )
            );
        }

        public function user_review_settings($prefix)
        {
            \CSF::createSection(
                $prefix,
                array(
                    'id' => 'user_review_settings',
                    'title' => __('User Review', SCR_DOMAIN),
                    'icon' => 'fa fa-commenting',
                    'fields' => array(

                        // array(
                        //     'id' => 'ur_enable_post-types',
                        //     'type' => 'select',
                        //     'title' => 'Enable Reviews for custom post types',
                        //     'placeholder' => 'Select a Post Type',
                        //     'multiple' => true,
                        //     'chosen' => true,
                        //     'options' => 'post_types',
                        //     'query_args' => array(
                        //         'post_type' => 'post',
                        //     ),
                        //     'default' => 'post',
                        // ),

                        // array(
                        //     'id' => 'ur_show_controls',
                        //     'type' => 'switcher',
                        //     'title' => __('Show Reviews Controls', SCR_DOMAIN),
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
                        //             'title' => __('Show Search', SCR_DOMAIN),
                        //             'default' => true,
                        //         ),
                        //         array(
                        //             'id' => 'ur_show_sortBy',
                        //             'type' => 'switcher',
                        //             'title' => __('Show SortBy', SCR_DOMAIN),
                        //             'default' => true,
                        //         )
                        //     )
                        // ),

                        // array(
                        //     'id' => 'ur_enable_replies',
                        //     'type' => 'switcher',
                        //     'title' => __('Enable Replies to Reviews', SCR_DOMAIN),
                        //     'default' => true,
                        // ),

                        // array(
                        //     'id' => 'ur_enable_approval',
                        //     'type' => 'switcher',
                        //     'title' => __('Require Admin Approval to publish reviews', SCR_DOMAIN),
                        //     'default' => true,
                        // ),

                        array(
                            'id' => 'ur_show_list_title',
                            'type' => 'switcher',
                            'title' => __('Show User Reviews List Title', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_list_title',
                            'type' => 'text',
                            'title' => __('User Reviews List Title', SCR_DOMAIN),
                            'dependency' => array('ur_show_list_title', '==', 'true'),
                            'default' => 'User Reviews',
                        ),

                        array(
                            'id' => 'ur_enable_voting',
                            'type' => 'switcher',
                            'title' => __('Voting', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'type' => 'subheading',
                            'content' => 'User Review Form',
                        ),

                        array(
                            'id' => 'ur_show_form_title',
                            'type' => 'switcher',
                            'title' => __('Show Form Title', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_form_title',
                            'type' => 'text',
                            'title' => 'Form Title',
                            'dependency' => array('ur_show_form_title', '==', 'true'),
                            'default' => 'Leave a Review',
                        ),

                        array(
                            'id' => 'ur_show_title',
                            'type' => 'switcher',
                            'title' => __('Show Title', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_show_stats',
                            'type' => 'switcher',
                            'title' => __('Show Stat', SCR_DOMAIN),
                            'default' => true,
                            'desc' => '<b>User Review Rating</b> options are based on stats option from general settings section',
                        ),

                        array(
                            'id' => 'ur_show_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'id' => 'ur_show_captcha',
                            'type' => 'switcher',
                            'title' => __('Show reCAPTCHA (v2 checkbox)', SCR_DOMAIN),
                            'default' => false,
                            'desc' => 'Register for reCAPTCHA v2 at <a href="https://www.google.com/recaptcha">https://www.google.com/recaptcha</a> to get your site key and secret key.' .
                                ' Make sure to add your domain name in the settings at the reCAPTCHA website. ' .
                                'Read More at <a href="https://paupledocs.gitbook.io/starcat-documentation/">Starcat Reviews - Docs</a>.' .
                                ' Note: reCAPTCHA v3 will not work, just v2. v3 will be added soon.',
                        ),

                        array(
                            'id' => 'recaptcha_site_key',
                            'type' => 'text',
                            'title' => __('reCAPTCHA Site Key', SCR_DOMAIN),
                            'dependency' => array('ur_show_captcha', '==', 'true'),
                        ),


                        array(
                            'id' => 'recaptcha_secret_key',
                            'type' => 'text',
                            'title' => __('reCAPTCHA Secret Key', SCR_DOMAIN),
                            'default' => '',
                            'dependency' => array('ur_show_captcha', '==', 'true'),
                        ),

                        // array(
                        //     'id' => 'ur_show_prosandcons',
                        //     'type' => 'switcher',
                        //     'title' => __('Show Pros and Cons', SCR_DOMAIN),
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

                    ),
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
                            'type' => 'submessage',
                            // 'style'   => 'info',
                            'content' => 'These settings are only for starcat-review post type.',
                        ),
                        array(
                            'type' => 'subheading',
                            'content' => __('Template', SCR_DOMAIN),
                        ),
                        array(
                            'id' => 'sp_template_layout',
                            'type' => 'image_select',
                            'title' => __('Template', SCR_DOMAIN),
                            'options' => array(
                                'left-sidebar' => SCR_URL . '/includes/assets/img/templates/left-sidebar.png',
                                'right-sidebar' => SCR_URL . '/includes/assets/img/templates/right-sidebar.png',
                                'full-width' => SCR_URL . '/includes/assets/img/templates/full-width.png',
                            ),
                            'default' => 'full-width',
                            'desc' => "Layout Types for your Single Review Page. Left / Right Sidebar, No-sidebar.",
                        ),
                        // A Submessage
                        array(
                            'type' => 'submessage',
                            'style' => 'success',
                            'content' => 'You can add widgets to your sidebar from Appearance -> Widgets',
                        ),

                        array(
                            'id' => 'sp_show_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', SCR_DOMAIN),
                            'default' => true,
                        ),

                        array(
                            'id' => 'sp_rating_combination',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Show Review', SCR_DOMAIN),
                            'placeholder' => __('Select an option', SCR_DOMAIN),
                            'options' => array(
                                'author' => 'Author Only',
                                'user' => 'User Only',
                                'both' => 'Author and User both',
                                'combined' => 'Combined Rating',
                            ),
                            'default' => 'combined',
                        ),
                    ),
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
                            'type' => 'subheading',
                            'content' => __('Template', SCR_DOMAIN),
                        ),
                        array(
                            'id' => 'cp_template_layout',
                            'type' => 'image_select',
                            'title' => __('Template', SCR_DOMAIN),
                            'options' => array(
                                'left-sidebar' => SCR_URL . '/includes/assets/img/templates/left-sidebar.png',
                                'right-sidebar' => SCR_URL . '/includes/assets/img/templates/right-sidebar.png',
                                'full-width' => SCR_URL . '/includes/assets/img/templates/full-width.png',
                            ),
                            'default' => 'full-width',
                            'desc' => "Layout Types for your Review Categories Page. Left / Right Sidebar, No-sidebar",
                        ),
                        // A Submessage
                        array(
                            'type' => 'submessage',
                            'style' => 'success',
                            'content' => 'You can add widgets to your sidebar from Appearance -> Widgets',
                        ),
                        array(
                            'id' => 'cp_controls',
                            'type' => 'switcher',
                            'title' => __('Show Controls', SCR_DOMAIN),
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
                            'title' => __('Show Search', SCR_DOMAIN),
                            'default' => true,
                            'dependency' => array('cp_controls', '==', 'true'),
                        ),
                        array(
                            'id' => 'cp_sortBy',
                            'type' => 'switcher',
                            'title' => __('Show SortBy', SCR_DOMAIN),
                            'default' => true,
                            'dependency' => array('cp_controls', '==', 'true'),
                        ),
                        // array(
                        //     'id' => 'cp_num_of_reviews_filter',
                        //     'type' => 'switcher',
                        //     'title' => __('Show Number of Review Filter', SCR_DOMAIN),
                        //     'default' => true,
                        //     'dependency' => array('cp_controls', '==', 'true'),
                        // ),

                        array(
                            'id' => 'cp_listing_options_subheading',
                            'type' => 'subheading',
                            'content' => 'Listing Options',

                        ),

                        array(
                            'id' => 'cp_posts_per_page',
                            'type' => 'text',
                            'title' => __('Posts Per Page', SCR_DOMAIN),
                            'default' => '9',
                        ),
                        array(
                            'id' => 'cp_default_sortBy',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Default Sort By', SCR_DOMAIN),
                            'placeholder' => __('Select a sortby option', SCR_DOMAIN),
                            'options' => array(
                                'alphabetical_asc' => 'Alphabetical Ascending',
                                'alphabetical_desc' => 'Alphabetical Descending',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                // 'num_of_reviews' => 'Number of Reviews',
                            ),
                            'default' => 'recent',
                        ),
                        array(
                            'id' => 'cp_num_of_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', SCR_DOMAIN),
                            'placeholder' => __('Select an option', SCR_DOMAIN),
                            'options' => array(
                                '1' => 1,
                                '2' => 2,
                                '3' => 3,
                                '4' => 4,
                            ),
                            'default' => '3',
                        ),
                    ),
                )
            );
        }
        public function mainpage_settings($prefix)
        {
            $extras = new \StarcatReview\Includes\Settings\Extras();
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
                            'title' => __('Main Page Meta Title', SCR_DOMAIN),
                            'desc' => '<strong> Note </strong>: Keep your meta title between 60 and 64 characters.',
                            'default' => 'Reviews',
                        ),
                        array(
                            'id' => 'mp_meta_description',
                            'type' => 'text',
                            'title' => __('Main Page Meta Description', SCR_DOMAIN),
                            'desc' => '<strong> Note </strong>: Keep your meta descriptions between 150 and 154 characters.',
                            'default' => 'These are your reviews',
                        ),
                        array(
                            'id' => 'mp_slug',
                            'type' => 'text',
                            'title' => __('Main Page Slug', SCR_DOMAIN),
                            'default' => 'reviews',
                        ),
                        array(
                            'type' => 'content',
                            'content' => '<div class="button-container">'
                                . '<span><b>Where is my main page?</b></span>'
                                . '<br>'
                                . $main_page_button . '<span>Save and Refresh Page if you changed it.</span></div>',
                        ),
                        array(
                            'type' => 'subheading',
                            'content' => __('Template', SCR_DOMAIN),
                        ),
                        array(
                            'id' => 'mp_template_layout',
                            'type' => 'image_select',
                            'title' => __('Template', SCR_DOMAIN),
                            'options' => array(
                                'left-sidebar' => SCR_URL . '/includes/assets/img/templates/left-sidebar.png',
                                'right-sidebar' => SCR_URL . '/includes/assets/img/templates/right-sidebar.png',
                                'full-width' => SCR_URL . '/includes/assets/img/templates/full-width.png',
                            ),
                            'default' => 'full-width',
                            'desc' => "Layout Types for your Reviews Main Page. Left / Right Sidebar, No-sidebar",
                        ),
                        // A Submessage
                        array(
                            'type' => 'submessage',
                            'style' => 'success',
                            'content' => 'You can add widgets to your sidebar from Appearance -> Widgets',
                        ),
                        array(
                            'id' => 'mp_components_order',
                            'type' => 'sortable',
                            'title' => 'Components Control',
                            'desc' => 'Controls order and visibility of these components in Main Page',
                            'fields' => array(
                                array(
                                    'id' => 'mp_category_listing',
                                    'type' => 'switcher',
                                    'title' => __('Category  Listing', SCR_DOMAIN),
                                    'default' => true,
                                ),
                                array(
                                    'id' => 'mp_review_listing',
                                    'type' => 'switcher',
                                    'title' => __('Review Listing', SCR_DOMAIN),
                                    'default' => true,
                                ),
                            ),
                            'default' => array(
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
                            'title' => __('Title', SCR_DOMAIN),
                            'default' => 'Review Categories',
                            'dependency' => array('mp_category_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_cl_description',
                            'type' => 'switcher',
                            'title' => __('Show Description', SCR_DOMAIN),
                            'dependency' => array('mp_category_listing', '==', 'true'),
                            'default' => true,
                        ),

                        array(
                            'id' => 'mp_cl_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', SCR_DOMAIN),
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
                            'title' => __('Title', SCR_DOMAIN),
                            'default' => 'Review Listing',
                            'default' => 'Review Posts',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),
                        array(
                            'id' => 'mp_rl_sortby',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Default Sort By', SCR_DOMAIN),
                            'placeholder' => __('Select a sortby option', SCR_DOMAIN),
                            'options' => array(
                                'alphabetical_asc' => 'Alphabetical Ascending',
                                'alphabetical_desc' => 'Alphabetical Descending',
                                'recent' => 'Recent',
                                'updated' => 'Recently Updated',
                                // 'num_of_reviews' => 'Number of Reviews',
                            ),
                            'default' => 'recent',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),

                        array(
                            'id' => 'mp_rl_cols',
                            'type' => 'select',
                            'chosen' => true,
                            'title' => __('Num Of Columns', SCR_DOMAIN),
                            'placeholder' => __('Select an option', SCR_DOMAIN),
                            'options' => array(
                                '1' => 1,
                                '2' => 2,
                                '3' => 3,
                                '4' => 4,
                            ),
                            'default' => '3',
                            'dependency' => array('mp_review_listing', '==', 'true'),
                        ),
                    ),
                )
            );
        }
        public function general_settings($prefix)
        {

            \CSF::createSection(
                $prefix,
                array(

                    'id' => 'general_settings',
                    'title' => __('General Settings', SCR_DOMAIN),
                    'icon' => 'fa fa-cogs',
                    'fields' => array(

                        // array(
                        //     'id'          => 'template_source',
                        //     'type'        => 'select',
                        //     'title'       => 'Template Source',
                        //     'desc' => 'Select a Template Source',
                        //     'options'     => array(
                        //         'plugin'  => 'Plugin',
                        //         'theme'  => 'Theme',
                        //     ),
                        //     'default'     => 'theme'
                        // ),

                        // Select with CPT (custom post type) pages
                        array(
                            'id' => 'review_enable_post-types',
                            'type' => 'select',
                            'title' => 'Where to include reviews?',
                            'chosen' => true,
                            'placeholder' => 'Select post types',
                            'options' => 'post_types',
                            'multiple' => true,
                            'query_args' => array(
                                'post_type' => 'post',
                            ),
                            'default' => 'post',
                        ),

                        array(
                            'id' => 'enable-author-review',
                            'type' => 'switcher',
                            'title' => 'Enable author review',
                            'default' => true,
                        ),

                        array(
                            'id' => 'enable-pros-cons',
                            'type' => 'switcher',
                            'title' => 'Enable Pros and Cons',
                            'default' => true,
                        ),

                        array(
                            'id' => 'stats-subheading',
                            'type' => 'subheading',
                            'content' => 'Stats',
                        ),

                        array(
                            'type' => 'submessage',
                            // 'style'   => 'info',
                            'content' => 'You can rate each of these stats in the edit post page(author rating). And if you have enabled "user_reviews", your users can rate them from the frontend',
                        ),

                        array(
                            'id' => 'stat-singularity',
                            'type' => 'select',
                            'title' => 'Single or Multiple Stat',
                            'options' => array(
                                'single' => 'Single',
                                'multiple' => 'Multiple',
                            ),
                            'default' => 'single',
                        ),

                        array(
                            'type' => 'submessage',
                            'style' => 'info',
                            'content' => 'The first stat is always considered as the primary stat ( highlighted by blue color ), When you change from multiple stat to single stat values from the primary stat are used.',
                            'dependency' => array('stat-singularity', '==', 'multiple'),
                        ),

                        array(
                            'id' => 'global_stats',
                            'type' => 'repeater',
                            'title' => 'Stats',
                            'fields' => array(
                                array(
                                    'id' => 'stat_name',
                                    'type' => 'text',
                                    'placeholder' => 'Feature',
                                ),
                            ),
                            'min' => 1,
                            'default' => array(
                                array(
                                    'stat_name' => 'Feature',
                                ),
                            ),
                            'dependency' => array('stat-singularity', '==', 'multiple'),
                        ),

                        array(
                            'id' => 'stats-type',
                            'type' => 'image_select',
                            'title' => 'Stats Type',
                            'options' => array(
                                'star' => SCR_URL . 'includes/assets/img/stars-stat.png',
                                // 'bar' => SCR_URL . 'includes/assets/img/bars-stat.png',
                            ),
                            // 'desc' => 'choose between star and bars stats types',
                            'default' => 'star',
                        ),

                        array(
                            'id' => 'stats-source-type',
                            'type' => 'select',
                            'title' => 'Source Type',
                            'options' => array(
                                'icon' => 'Icon',
                                'image' => 'Image',
                            ),
                            // 'dependency' => array('stats-type', '==', 'star'),
                            'default' => 'icon',
                        ),

                        array(
                            'id' => 'stats-show-rating-label',
                            'type' => 'switcher',
                            'title' => 'Show Rating Label',
                            'default' => true,
                        ),

                        array(
                            'id' => 'stats-icons',
                            'type' => 'icon_dropdown',
                            'title' => 'Icons',
                            // 'dependency' => array('stats-source-type|stats-type', '==|==', 'icon|star'),
                            'dependency' => array('stats-source-type', '==', 'icon'),
                            'default' => 'star',
                        ),
                        array(
                            'id' => 'stats-icons-color',
                            'type' => 'color',
                            'title' => 'Icons Color',
                            'dependency' => array('stats-source-type', '==', 'icon'),
                            'output' => array('.review-list .review-item-stars i', '.review-list .reviewed-item-stars i', '.reviewed-list .review-item-stars i', '.reviewed-list .reviewed-item-stars i'),
                            'output_mode' => 'color',
                            'default' => '#e7711b',
                        ),
                        array(
                            'id' => 'stats-icons-label-color',
                            'type' => 'color',
                            'title' => 'Icons Label Color',
                            'dependency' => array('stats-source-type', '==', 'icon'),
                            'output' => array('.review-list .reviewed-item .reviewed-item-label__score', '.review-list .reviewed-item .reviewed-item-label__score', '.reviewed-list .reviewed-item .reviewed-item-label__score', '.reviewed-list .reviewed-item .reviewed-item-label__score'),
                            'output_mode' => 'color',
                            'default' => '#0274be',
                        ),

                        array(
                            'id' => 'stats-images',
                            'type' => 'fieldset',
                            'title' => 'Images',
                            // 'dependency' => array('stats-source-type|stats-type', '==|==', 'image|star'),
                            'dependency' => array('stats-source-type', '==', 'image'),
                            'fields' => array(
                                array(
                                    'id' => 'image',
                                    'type' => 'media',
                                    'title' => 'Image',
                                    'library' => 'image',
                                    'placeholder' => 'http://',
                                    'default' => [
                                        'url' => SCR_URL . 'includes/assets/img/tomato.png',
                                        'thumbnail' => SCR_URL . 'includes/assets/img/tomato.png',
                                    ],
                                ),
                                array(
                                    'id' => 'image-outline',
                                    'type' => 'media',
                                    'title' => 'Outline Image',
                                    'library' => 'image',
                                    'placeholder' => 'http://',
                                    'default' => [
                                        'url' => SCR_URL . 'includes/assets/img/tomato-outline.png',
                                        'thumbnail' => SCR_URL . 'includes/assets/img/tomato-outline.png',
                                    ],
                                ),

                                array(
                                    'type' => 'submessage',
                                    'style' => 'info',
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
                            'id' => 'stats-stars-limit',
                            'title' => 'Limit',
                            'type' => 'slider',
                            'min' => 5,
                            'max' => 10,
                            'step' => 5,
                            'unit' => '#',
                            'default' => 5,
                            'desc' => 'Star stat scale b/w limit <b> 5 to 10 </b>',
                            // 'dependency' => array('stats-type', '==', 'star'),
                        ),

                        array(
                            'id' => 'stats-steps',
                            'type' => 'select',
                            'title' => 'Steps',
                            'options' => array(
                                // 'precise' => 'Precise',
                                'half' => 'Half',
                                'full' => 'Full',
                            ),
                            'default' => 'half',
                        ),

                        array(
                            'id' => 'stats-animate',
                            'type' => 'switcher',
                            'title' => __('Stat Animate', SCR_DOMAIN),
                            'default' => false,
                        ),

                        array(
                            'id' => 'stats-no-rated-message',
                            'type' => 'text',
                            'title' => 'No rated message',
                            'default' => 'Not Rated Yet !!!',
                        ),
                    ),
                )
            );
        }

        /* Single Post - Meta Data Options */
        public function single_post_meta_fields()
        {
            $locations = SCR_Getter::get('review_enable_post-types');
            $prefix = '_scr_post_options';

            \CSF::createMetabox($prefix, array(
                'title' => 'Starcat Review',
                'post_type' => $locations,
                'show_restore' => true,
                'theme' => 'light',
            ));

            if (SCR_Getter::get('enable-author-review')) {
                $this->single_post_features($prefix);
                $this->single_post_pros($prefix);
                $this->single_post_cons($prefix);
            }

            // $this->single_details($prefix);
            // $this->single_rich_snippets($prefix);
        }

        // Features - Main Settings Options
        public function single_post_settings_features($prefix, $parent = null)
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
                                'id' => 'stats-list',
                                'type' => 'repeater',
                                'title' => 'Repeater',
                                'fields' => array(

                                    array(
                                        'id' => 'stat_name',
                                        'type' => 'text',
                                        'title' => 'Stat Name',
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
                    'fields' => $details_fields,
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
                    'fields' => $fields,
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
                'fields' => $fields,
            ));
        }

        public function single_post_cons($prefix, $parent = null)
        {

            $fields = $this->fields->single_post_prosandcons_fields('cons-list', 'Cons');

            \CSF::createSection($prefix, array(
                'parent' => $parent,
                'title' => 'Cons',
                'icon' => 'fa fa-thumbs-down',
                'fields' => $fields,
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
                'fields' => $list_of_stat_fields,
            ));
        }

        protected function get_stat_fields()
        {
            return array(

                array(
                    'id' => 'stats-list',
                    'type' => 'fieldset',
                    'fields' => $this->get_statlist_from_global(),
                ),

            );
        }

        protected function get_statlist_from_global()
        {
            $stats_list = [];

            $stats = SCR_Getter::get('global_stats');
            $singularity = SCR_Getter::get('stat-singularity');

            if (isset($stats) && !empty($stats)) {
                $stats_list[] = array(
                    'type' => 'submessage',
                    'content' => 'Author Review Stats List',
                );
                $count = 0;
                foreach ($stats as $stat) {
                    if ($singularity == 'single' && $count >= 1) {
                        break;
                    }
                    if (is_string($stat)) {
                        $stat = ['stat_name' => $stat]; // Fix : On first installation undefined property
                    }
                    $stats_list[] = array(
                        'id' => strtolower($stat['stat_name']),
                        'type' => 'fieldset',
                        'fields' => array(
                            array(
                                'id' => 'stat_name',
                                'type' => 'text',
                                'title' => 'Stat Name',
                                'attributes' => array(
                                    'readonly' => 'readonly',
                                ),
                                'default' => $stat['stat_name'],
                            ),

                            array(
                                'id' => 'rating',
                                'type' => 'slider',
                                'title' => 'Rating',
                                'min' => 0,
                                'max' => 100,
                                'step' => 1,
                                'unit' => '%',
                                'default' => 0,
                            ),

                            array(
                                'type' => 'submessage',
                                'style' => 'success',
                                'content' => 'Rating 0 - 100 ',
                            ),
                        ),
                    );

                    $count++;
                }
            }

            return $stats_list;
        }
    } // END CLASS
}