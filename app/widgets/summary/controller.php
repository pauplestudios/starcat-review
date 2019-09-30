<?php

namespace HelpieReviews\App\Widgets\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Summary\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->view = new \HelpieReviews\App\Widgets\Summary\View($post_id);
        }

        public function get_view()
        {
            return $this->view->get();
        }
    }
}
