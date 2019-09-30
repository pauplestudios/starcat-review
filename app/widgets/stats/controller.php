<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Widgets\Stats\Model($post_id);
            $viewProps = $this->model->get_viewProps();
            $this->view = new \HelpieReviews\App\Widgets\Stats\View($viewProps);
        }

        public function get_view()
        {
            return $this->view->get();
        }
    } // END CLASS

}
