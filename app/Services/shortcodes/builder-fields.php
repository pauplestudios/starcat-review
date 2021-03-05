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

        public function get_show_author_reviews_summary_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_author_reviews_summary',
                'type' => 'switcher',
                'title' => 'Show Author Reviews Summary',
                'default' => true,
            ];

            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_show_user_reviews_summary_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_user_reviews_summary',
                'type' => 'switcher',
                'title' => 'Show Users Reviews Summary',
                'default' => true,
            ];
            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_show_pros_and_cons_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_pros_and_cons_summary',
                'type' => 'switcher',
                'title' => 'Show Author Pros and Cons Summary',
                'default' => true,
            ];
            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_show_review_title_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_review_title',
                'type' => 'switcher',
                'title' => 'Show Title',
                'default' => true,
            ];

            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_show_review_search_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_review_search',
                'type' => 'switcher',
                'title' => 'Show Search',
                'default' => true,
            ];

            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_show_review_sort_field(array $dependencies = array())
        {
            $field = [
                'id' => 'show_review_sort',
                'type' => 'switcher',
                'title' => 'Show Sort',
                'default' => true,
            ];
            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function get_heading_content_field(string $content, array $dependencies = array())
        {
            $field = [
                'type' => 'subheading',
                'content' => $content,
            ];
            $field = $this->set_dependencies($field, $dependencies);
            return $field;
        }

        public function set_dependencies(array $field, array $dependencies = array())
        {

            if (empty($dependencies)) {
                return $field;
            }

            foreach ($dependencies as $dependency) {
                $field['dependency'] = [
                    $dependency['field_id'],
                    $dependency['operand'],
                    $dependency['value'],
                ];
            }

            return $field;
        }

    }
}