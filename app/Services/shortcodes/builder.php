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

            $fields = new \StarcatReview\App\Services\Shortcodes\Builder_Fields();
            $post_field = $fields->get_post_field();

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
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_overall_user_review',
                    'fields' => [
                        0 => $fields->get_show_stats_field(),
                        1 => $fields->get_show_form_field(),
                        2 => $fields->get_show_lists_field(),
                        3 => $fields->get_show_summary_field(),
                        4 => $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Form',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_user_review_form',
                    'fields' => [
                        0 => $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Lists',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_user_review_list',
                    'fields' => [
                        0 => $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Summary',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_summary',
                    'fields' => [
                        0 => $post_field,
                    ],
                ));
            }

        }
    }
}