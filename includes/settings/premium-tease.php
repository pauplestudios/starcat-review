<?php

namespace StarcatReview\Includes\Settings;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Includes\Settings\Premium_Tease')) {

    class Premium_Tease
    {
        public function __construct()
        {
            $prefix = SCR_OPTIONS;
            add_filter("csf_{$prefix}_args", [$this, 'csf_framework_override']);
            add_filter("csf_{$prefix}_sections", [$this, 'add_premium_tease_into_sections']);

            $prefix = '_scr_category_options';
            // add_filter("csf_{$prefix}_sections", [$this, 'add_premium_tease_into_sections']);
        }

        public function csf_framework_override($args)
        {
            if (isset($args) && !empty($args)) {
                $args['class'] = 'scr-csf';
            }

            return $args;
        }

        public function add_premium_tease_into_sections($sections)
        {

            foreach ($sections as $section_key => $section) {
                // error_log('some : ' . print_r($section, true));
                $sections[$section_key]['class'] = 'scr-csf__section';
                if ($section['id'] == 'notification_settings' && !SCR_Getter::addons_available_condition()['wn']) {
                    $sections[$section_key] = $this->add_premium_tease_into_section($section);
                }

                if (in_array($section['id'], array("single_page_settings", "mainpage_settings", 'category_page_settings'))
                    && !SCR_Getter::addons_available_condition()['cpt']) {
                    $sections[$section_key] = $this->add_premium_tease_into_section($section);
                }

                if ($section['id'] == 'photo_reviews_settings' && !SCR_Getter::addons_available_condition()['pr']) {
                    $sections[$section_key] = $this->add_premium_tease_into_section($section);
                }

                if ($section['id'] == 'comparison_table_settings' && !SCR_Getter::addons_available_condition()['ct']) {
                    $sections[$section_key] = $this->add_premium_tease_into_section($section);
                }

            }
            return $sections;
        }

        protected function add_premium_tease_into_section($section)
        {
            $section['class'] = 'scr-csf__section--disable';
            $section['fields'] = $this->add_premium_tease_into_fields($section['fields']);
            return $section;
        }

        public function add_premium_tease_into_fields($fields = [])
        {
            // if (!empty($fields)) {
            foreach ($fields as $field_key => $field) {
                if (isset($field['id']) && !empty($field['id'])) {
                    $fields[$field_key]['subtitle'] = $this->premium_feature_sub_title();
                    $fields[$field_key]['class'] = 'scr-csf__field--disable';
                    $fields[$field_key]['attributes'] = [
                        'readonly' => 'readonly',
                        'disabled' => true,
                    ];

                }
            }
            // }

            return $fields;
        }

        protected function premium_feature_sub_title()
        {
            return '<span style="color: #5cb85c; font-weight: 600;">* ' . __('Premium Feature', SCR_DOMAIN) . '</span>';
        }
    }
}
