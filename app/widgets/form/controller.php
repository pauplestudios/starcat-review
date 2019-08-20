<?php

namespace HelpieReviews\App\Widgets\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Form\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Widgets\Form\Model($post_id);
            $viewProps = $this->model->get_viewProps();
            $this->view = new \HelpieReviews\App\Widgets\Form\View($viewProps);
        }

        public function get_view()
        {                     
            return $this->view->get_html();
        }

    } // END CLASS
}