<?php

namespace HelpieReviews\App\Widgets\Listing;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Listing\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Widgets\Listing\Model();
            $this->view = new \HelpieReviews\App\Widgets\Listing\View();
        }

        public function get_view($args)
        {
            // error_log('get_view $args : ' . print_r($args, true));
            $viewProps = $this->model->get_viewProps($args);
            return $this->view->get_html($viewProps);
        }
    } // END CLASS

}