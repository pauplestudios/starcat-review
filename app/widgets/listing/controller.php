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
            $this->fields_model = new \HelpieReviews\App\Widgets\Listing\Fields_Model();
            $this->model = new \HelpieReviews\App\Widgets\Listing\Model($this->fields_model);
            $this->view = new \HelpieReviews\App\Widgets\Listing\View();
        }

        public function get_view($posts)
        {
            $args = [];

            $viewProps = $this->model->get_viewProps($args);
            return $this->view->get_html($viewProps);
        }
    } // END CLASS

}