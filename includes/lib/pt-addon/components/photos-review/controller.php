<?php

namespace StarcatReviewPt\Components\Photos_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPt\Components\Photos_Review\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReviewPt\Components\Photos_Review\Model();
            $this->view = new \StarcatReviewPt\Components\Photos_Review\View();
        }

        public function load()
        {
            // error_log("PHotos REview Controller");
            add_filter('scr_photos_review/get_all_photos', [$this->view, 'get_all_photos']);
            add_filter('scr_photos_review/get_single_slider_photos', [$this->view, 'get_html']);
        }

        public function get_view($args)
        {

            // $stats = $this->model->get($args);
            error_log('Pt controller : ' . print_r($stats, true));

            // return $this->view->get_html($stats);
        }

    } // END CLASS

}
