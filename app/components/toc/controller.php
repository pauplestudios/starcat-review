<?php

namespace StarcatReview\App\Components\Toc;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Toc\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\Toc\Model();
            $this->view  = new \StarcatReview\App\Components\Toc\View();
        }

        public function get_view()
        {
            return $this->view->get_html();
        }
    }
}
