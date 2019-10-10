<?php

namespace HelpieReviews\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Summary\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \HelpieReviews\App\Components\Summary\Model();
            $this->view = new \HelpieReviews\App\Components\Summary\View();
        }

        public function get_view($args)
        {
            $props = $this->model->get_Props($args);
            return $this->view->get($props);
        }
    }
}
