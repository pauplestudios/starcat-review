<?php

namespace HelpieReviews\App\Components\BreadCrumb;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\BreadCrumb\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Components\BreadCrumb\Model();
            $this->view = new \HelpieReviews\App\Components\BreadCrumb\View();
        }

        public function get_view()
        {
            $html = '';
            $html = '<p>Bread-crumb Initial Setup ..</p>';
            return $html;
        }
    }
}
