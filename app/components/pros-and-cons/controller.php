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

            $this->view = new \StarcatReview\App\Components\ProsAndCons\View($view_props);
        }

        public function get_view()
        {
            return $this->view->get_html();
        }
    } // END CLASS

}
