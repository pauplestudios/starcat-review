<?php

namespace StarcatReview\App\Services\Shortcodes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Shortcodes\Builder')) {
    class Builder
    {
        public function init()
        {
            if (!function_exists('\CSF') && !class_exists('\CSF')) {
                require_once SCR_PATH . 'includes/lib/codestar-framework/codestar-framework.php';
            }

            if (class_exists('\CSF')) {

                $prefix = 'starcat-review-shortcode';

                \CSF::createShortcoder($prefix, array(
                    'button_title' => 'Add Starcat Reviews Shortcodes',
                    'select_title' => 'Select a shortcode',
                    'insert_title' => 'Insert Shortcode',
                    'show_in_editor' => true,
                    'gutenberg' => []
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Overall User Review',
                    'view' => 'group',
                    'shortcode' => 'starcat_review_overall_user_review',
                    'fields' => [
                        [
                            'id' => 'title',
                            'type' => 'text',
                            'title' => 'Title',
                        ],
                        [
                            'id' => 'color',
                            'type' => 'color',
                            'title' => 'Color',
                        ],
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Form',
                    'view' => 'group',
                    'shortcode' => 'starcat_review_user_review_form',
                    'fields' => [
                        [
                            'id' => 'title',
                            'type' => 'text',
                            'title' => 'Title',
                        ],
                        [
                            'id' => 'color',
                            'type' => 'color',
                            'title' => 'Color',
                        ],
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Lists',
                    'view' => 'group',
                    'shortcode' => 'starcat_review_user_review_list',
                    'fields' => [
                        [
                            'id' => 'title',
                            'type' => 'text',
                            'title' => 'Title',
                        ],
                        [
                            'id' => 'color',
                            'type' => 'color',
                            'title' => 'Color',
                        ],
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Summary',
                    'view' => 'group',
                    'shortcode' => 'starcat_review_summary',
                    'fields' => [
                        [
                            'id' => 'title',
                            'type' => 'text',
                            'title' => 'Title',
                        ],
                        [
                            'id' => 'color',
                            'type' => 'color',
                            'title' => 'Color',
                        ],
                    ],
                ));
            }

        }
    }
}