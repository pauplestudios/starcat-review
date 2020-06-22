<?php

namespace StarcatReview\App\Components\Form_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Form_New\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\Form_New\Model();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = new \StarcatReview\App\Components\Form_New\View($viewProps);
            return $view->get();
        }

        public function get_fields_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = new \StarcatReview\App\Components\Form_New\View($viewProps);
            return $view->get_fields();
        }
    } // END CLASS
}
