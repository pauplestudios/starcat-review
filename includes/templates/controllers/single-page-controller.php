<?php

namespace HelpieReviews\Includes\Templates\Controllers;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Templates\Controllers\SinglePageController')) {
    class SinglePageController
    {

        public function __construct()
        { }

        public function render($post)
        {
            echo $this->get_view($post);
        }

        public function get_view($post)
        {
            $this->model = new \HelpieReviews\App\Models\Review_Post($post);
            $view = new \HelpieReviews\App\Views\Single_Review($this->model);
            return $view->get_html();
        }
    } // END CLASS
}