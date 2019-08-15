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
            error_log('__construct : ');
            $this->utils = new \HelpieReviews\Includes\Utils();
            $this->reviews = new \HelpieReviews\App\Collections\User_Reviews();
            $this->view = new \HelpieReviews\App\Widgets\User_Reviews\View();
        }

        public function get_view()
        {
            error_log('get_view');
            $viewProps = [
                'collection' => [
                    'title' => 'User Review For ...'
                ]
            ];
            return $this->view->get_html($viewProps);
        }
    } // END CLASS

}