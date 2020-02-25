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
            add_filter('scr_photos_review/get_all_photos', [$this, 'get_all_photos']);
            add_filter('scr_photos_review/get_single_photos', [$this, 'get_single_photos']);
        }

        public function get_all_photos($args)
        {
            $props = $this->model->get_all_photos_viewProps($args);
            return $this->view->get_all_photos($props);
        }

        public function get_single_photos($args)
        {
            $props = $this->model->get_single_photos_viewProps($args);
            return $this->view->get_single_photos($props);
        }

    } // END CLASS

}
