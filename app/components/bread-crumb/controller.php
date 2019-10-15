<?php

namespace HelpieReviews\App\Components\BreadCrumb;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\BreadCrumb\Controller')) {
    class Controller
    {
        private $model;

        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Components\BreadCrumb\Model();
            $this->view = new \HelpieReviews\App\Components\BreadCrumb\View();
        }

        public function get_view()
        {
            $html = '';
            $html = '<p>Bread-crumb Initial Setup ..</p>';
            $post_id = get_the_ID();
            $page = is_archive() ? 'archive' : 'single';

            $html .= '<li>' . $post_id . '</li>';
            $html .= '<li>' . $page . '</li>';
            $bread_crumb_section_order = $this->model->get_hrp_info($post_id, $page);


            return $html;
        }
    }
}
