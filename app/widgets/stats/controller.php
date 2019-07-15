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
            $this->model = new \HelpieReviews\App\Widgets\Stats\Model();

            $stats = $this->get_stats($post_id);
            $this->view = new \HelpieReviews\App\Widgets\Stats\View($stats);
        }

        public function get_view()
        {
            return $this->view->get_html();
        }

        private function get_stats($post_id)
        {

            $stats = $this->model->get($post_id);
            return $stats;

            return $stats;
        }
    } // END CLASS

}