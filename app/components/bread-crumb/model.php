<?php

namespace HelpieReviews\App\Components\BreadCrumb;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\BreadCrumb\Model')) {
    class Model
    {
        public function __construct()
        {
            $this->extras = new \HelpieReviews\Includes\Settings\Extras();
        }

        public function get_hrp_info($post_id, $page)
        {
            $bread_crumbs_info = array();

            $mp_hrp_section = $this->main_page_section();

            $bread_crumbs_info['post_type'] = array(
                'permalink' => $this->extras->get_mainpage_permalink(),
                'title' => $mp_hrp_section['hrp_main_title']
            );

            $taxonomy = 'helpie_reviews_category';
            if ($page == 'archive') {
                $queried_object = get_queried_object();

                $term_id = $queried_object->term_id;
                $term = get_term($term_id);
                $breadcrumbs_info['term'] = $this->get_term_info($term);
                $breadcrumbs_info['parent_term'] = $this->get_parent_of_term($term);
                echo '<pre>';
                print_r($term);
                print_r($breadcrumbs_info);
                echo '</pre>';
            } else { }
            echo '<pre>';
            print_r($bread_crumbs_info);
            echo '</pre>';

            return $mp_hrp_section;
        }

        private function get_term_info($term)
        {
            return array(
                'permalink' => get_term_link($term),
                'title' => $term->name,
            );
        }

        private function get_parent_of_term($term)
        {
            $parent_term_info = [];
            if (isset($term) && isset($term->parent) && !empty($term->parent) && $term->parent != 0) {
                $parent_term_id = $term->parent;
                $parent_term = get_term($parent_term_id, 'helpie_reviews_category');
                $parent_term_info = $this->get_term_info($parent_term);
            }

            return $parent_term_info;
        }

        public function main_page_section()
        {
            $mp_section_order =   array(
                'hrp_main_title' =>  'Helpie Review',
                'hrp_main_subtitle' => 'We’re here to help.',
                'hrp_main_page_search_display' => 1,
            );

            //Need Some Clarifications

            return $mp_section_order;
        }
    }
}
