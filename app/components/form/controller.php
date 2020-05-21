<?php

namespace StarcatReview\App\Components\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Form\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\Form\Model();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = new \StarcatReview\App\Components\Form\View($viewProps);
            return $view->get();
        }

        public function get_fields_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = new \StarcatReview\App\Components\Form\View($viewProps);
            return $view->get_fields();
        }
    } // END CLASS
}
