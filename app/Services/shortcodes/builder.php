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
                    'gutenberg' => [
                        'title' => 'Starcat Reviews Shortcodes',
                        'icon' => 'screenoptions',
                        'category' => 'widgets',
                        'keywords' => array('starcat', 'shortcode'),
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Overall User Review',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_overall_user_review',
                    'fields' => [
                        $fields->get_show_stats_field(),
                        $fields->get_show_form_field(),
                        $fields->get_show_lists_field(),
                        $fields->get_show_summary_field(),
                        $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Form',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_user_review_form',
                    'fields' => [
                        $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Lists',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_user_review_list',
                    'fields' => [
                        $post_field,
                    ],
                ));

                \CSF::createSection($prefix, array(
                    'title' => 'Starcat Review Summary',
                    'view' => 'normal',
                    'shortcode' => 'starcat_review_summary',
                    'fields' => [
                        $post_field,
                        $fields->get_show_author_reviews_summary_field(),
                        $fields->get_show_user_reviews_summary_field(),
                    ],
                ));
            }

        }
    }
}