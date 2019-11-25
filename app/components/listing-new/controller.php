<?php

namespace StarcatReview\App\Components\Listing_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Listing_New\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\Listing_New\Model();
            $this->view = new \StarcatReview\App\Components\Listing_New\View();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            return $this->view->get_html($viewProps);
        }
    } // END CLASS

}