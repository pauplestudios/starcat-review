<?php

namespace StarcatReview\App\Components\BreadCrumb;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\BreadCrumb\Controller')) {
    class Controller
    {
        private $model;

        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\BreadCrumb\Model();
            $this->view = new \StarcatReview\App\Components\BreadCrumb\View();
        }

        public function get_view()
        {
            $html = '';
            // $html = '<p>Bread-crumb Initial Setup ..</p>';
            $post_id = get_the_ID();
            $page = is_archive() ? 'archive' : 'single';

            // $html .= '<li>' . $post_id . '</li>';
            // $html .= '<li>' . $page . '</li>';
            $bread_crumb_info = $this->model->get_hrp_info($post_id, $page);
            // echo '<pre>';
            // print_r($bread_crumb_info);
            // echo '</pre>';
            // exit;
            $order = ['post_type', 'parent_term', 'term', 'post'];
            $html .= "<div class='breadcrumbs hrp-breadcrumbs'>";
            for ($ii = 0; $ii < sizeof($bread_crumb_info); $ii++) {
                $key = $order[$ii];
                if (isset($bread_crumb_info[$key]) && !empty($bread_crumb_info[$key])) {

                    if ($ii != 0) {
                        $html .= $this->view->get_seperator();
                    }

                    $html .= $this->view->single_item($bread_crumb_info[$key]['permalink'], $bread_crumb_info[$key]['title']);
                }
            }
            $html .= '</div>';

            return $html;
        }
    }
}
