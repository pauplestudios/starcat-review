<?php

namespace HelpieReviews\App\Components\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Form\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Components\Form\Model();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            $view = new \HelpieReviews\App\Components\Form\View($viewProps);
            return $view->get();
        }
    } // END CLASS
}
