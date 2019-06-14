<?php

namespace HelpieReviews\Includes\Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Settings\Fields')) {

    // HRP - Helpie Review Plugin
    class Fields
    {

        public function single_details_fields()
        {
            return  [
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
                )
            ];
        }

        // Features - Main Settings Options
        public function stats_field()
        {
            return
                array(

                    array(
                        'id'     => 'stats-list',
                        'type'   => 'repeater',
                        'title'  => 'Stats',
                        'fields' => array(

                            array(
                                'id'    => 'stat_name',
                                'type'  => 'text',
                                'title' => 'Stat Name'
                            ),
                            array(
                                'id'          => 'stat_type',
                                'type'        => 'select',
                                'title'       => 'Select',
                                'placeholder' => 'Select an option',
                                'options'     => array(
                                    'icon'  => 'Icon',
                                    'image'  => 'Image'
                                ),
                                'default'     => 'image'
                            ),
                            array(
                                'id'    => 'stat_icon',
                                'type'  => 'icon',
                                'title' => 'Icon',
                                'dependency' => array('stat_type', '==', 'icon'),
                            ),
                            array(
                                'id'      => 'stat_image',
                                'type'    => 'media',
                                'title'   => 'Media',
                                'library' => 'image',
                                'dependency' => array('stat_type', '==', 'image'),
                            ),
                        ),
                    )
                );
        }

        public function rich_snippets_fields()
        {
            return array(
                array(
                    'id'          => 'opt-select-1',
                    'type'        => 'select',
                    'title'       => 'Rich Snippet Type',
                    'placeholder' => 'Select an option',
                    'options'     => array(
                        'option-1'  => 'Option 1',
                        'option-2'  => 'Option 2',
                        'option-3'  => 'Option 3',
                    ),
                    'default'     => 'option-2'
                ),


            );
        }

        public function single_post_pros_fields()
        {
            return array(


                array(
                    'id'     => 'pros-list',
                    'type'   => 'repeater',
                    'title'  => 'Pros',
                    'fields' => array(

                        array(
                            'id'    => 'pro_con',
                            'type'  => 'text',
                            'title' => 'Feature'
                        ),
                    ),
                ),

            );
        }


        public function single_post_cons_fields()
        {
            return array(
                array(
                    'id'     => 'cons-list',
                    'type'   => 'repeater',
                    'title'  => 'Cons',
                    'fields' => array(

                        array(
                            'id'    => 'pro_con',
                            'type'  => 'text',
                            'title' => 'Feature'
                        ),
                    ),
                ),
            );
        }
    } // END CLASS
}