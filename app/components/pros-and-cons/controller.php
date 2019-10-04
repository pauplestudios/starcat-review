<?php

namespace HelpieReviews\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\ProsAndCons\Controller')) {
    class Controller
    {
        public function __construct($args)
        {
            $model = new \HelpieReviews\App\Components\ProsAndCons\Model();
            $view_props = $model->get_viewProps($args);

            $this->view = new \HelpieReviews\App\Components\ProsAndCons\View($view_props);
        }

        public function get_view()
        {
            return $this->view->get_html();
        }
    } // END CLASS

}
