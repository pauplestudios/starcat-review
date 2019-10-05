<?php

namespace HelpieReviews\App\Components\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Stats\Controller')) {
    class Controller
    {
        public function __construct($args)
        {
            $this->model = new \HelpieReviews\App\Components\Stats\Model();
            $viewProps = $this->model->get_viewProps($args);
            $this->view = new \HelpieReviews\App\Components\Stats\View($viewProps);
        }

        public function get_view()
        {
            return $this->view->get();
        }
    } // END CLASS

}
