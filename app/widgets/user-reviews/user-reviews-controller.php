<?php

namespace HelpieReviews\App\Widgets\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\User_Reviews\User_Reviews_Controller')) {
    class User_Reviews_Controller
    {
        public function __construct()
        {
            error_log('__construct : ' . __construct);
            $this->utils = new \HelpieReviews\Includes\Utils();
            $this->reviews = new \HelpieReviews\App\Collections\User_Reviews();
            $this->view = new \HelpieReviews\App\Views\Reviews_List();
        }

        public function get_view()
        {
            return $this->view->get();
        }
    } // END CLASS

}