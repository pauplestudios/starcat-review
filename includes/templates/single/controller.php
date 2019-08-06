<?php

namespace HelpieReviews\Includes\Templates\Single;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Single\Controller')) {
    class Controller
    {

        public function __construct()
        { }

        public function render($post)
        {
            echo $this->get_view($post);
        }

        public function get_view($post)
        {
            // $this->model = new \HelpieReviews\App\Models\Review_Post($post);
            $view = new \HelpieReviews\Includes\Templates\Single\View($post);
            return $view->get_html();
        }
    } // END CLASS
}