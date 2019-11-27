<?php

namespace StarcatReview\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\User_Reviews\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\User_Reviews\Model();
            // $this->view = new \StarcatReview\App\Components\User_Reviews\View();

            $this->view = new \StarcatReview\App\Components\User_Reviews\View_new();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = $this->view->get($viewProps);

            return $view;
        }
    } // END CLASS

}
