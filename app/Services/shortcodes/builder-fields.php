<?php

namespace StarcatReview\App\Services\Shortcodes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Services\Shortcodes\Builder_Fields')) {
    class Builder_Fields
    {

        public function get_post_field()
        {
            return [
                'id' => 'post_id',
                'type' => 'text',
                'title' => 'Enter the Post ID (or) Page ID',
            ];
        }

        public function get_show_stats_field()
        {
            return [
                'id' => 'show_stats',
                'type' => 'switcher',
                'title' => 'Show User Review Stats',
                'default' => true,
            ];
        }

        public function get_show_form_field()
        {
            return [
                'id' => 'show_form',
                'type' => 'switcher',
                'title' => 'Show User Review Form',
                'default' => true,
            ];
        }

        public function get_show_lists_field()
        {
            return [
                'id' => 'show_lists',
                'type' => 'switcher',
                'title' => 'Show User Review Lists',
                'default' => true,
            ];
        }

        public function get_show_summary_field()
        {
            return [
                'id' => 'show_summary',
                'type' => 'switcher',
                'title' => 'Show User Review Summary',
                'default' => true,
            ];
        }

    }
}