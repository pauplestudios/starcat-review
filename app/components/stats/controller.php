<?php

namespace HelpieReviews\App\Components\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Stats\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Components\Stats\Model($post_id);
            $viewProps = $this->model->get_viewProps();
            $this->view = new \HelpieReviews\App\Components\Stats\View($viewProps);
        }

        public function get_view()
        {
            return $this->view->get();
        }
    } // END CLASS

}
