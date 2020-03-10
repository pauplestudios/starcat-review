<?php

namespace StarcatReview\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\ProsAndCons\Controller')) {
    class Controller
    {
        public function __construct($args)
        {
            $model = new \StarcatReview\App\Components\ProsAndCons\Model();
            $view_props = $model->get_viewProps($args);

            // error_log('args : ' . print_r($args, true));
            error_log('view_props : ' . print_r($view_props, true));

            $this->view = new \StarcatReview\App\Components\ProsAndCons\View($view_props);
        }

        public function get_view()
        {
            return $this->view->get();
        }

        public function get_fields()
        {
            return $this->view->get_fields();

        }
    } // END CLASS

}

// options
// data
