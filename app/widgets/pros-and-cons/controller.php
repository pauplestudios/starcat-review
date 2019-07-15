<?php

namespace HelpieReviews\App\Widgets\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\ProsAndCons\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Widgets\ProsAndCons\Model();

            $pros_and_cons = $this->get_pros_and_cons($post_id);
            $this->view = new \HelpieReviews\App\Widgets\ProsAndCons\View($pros_and_cons);
        }

        public function get_view()
        {
            return $this->view->get_html();
        }

        private function get_pros_and_cons($post_id)
        {
            $pros_and_cons = $this->model->get($post_id);
            return $pros_and_cons;
        }
    } // END CLASS

}