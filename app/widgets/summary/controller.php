<?php

namespace HelpieReviews\App\Widgets\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Summary\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->view = new \HelpieReviews\App\Widgets\Summary\View();
        }

        public function get_view($post_id)
        {
            return $this->view->get($post_id);
        }
    }
}
