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
            $this->repo = new \StarcatReviewPhotoReviews\Includes\Repository();

        }

        public function load()
        {
            add_filter('scr_photo_reviews/get_all_photos', [$this, 'get_all_photos']);
            add_filter('scr_photo_reviews/get_single_review_photos', [$this, 'get_single_review_photos']);
            add_filter('scr_photo_reviews/get_single_review_photos_field', [$this, 'get_single_review_photos_field']);

            add_filter('scr_photo_reviews/ajax', [$this, 'get_ajax_response']);

            add_action('scr_photos_review/add_attachments', [$this->repo, 'check_review_image']);
        }

        public function get_all_photos($args)
        {
            $props = $this->model->get_all_photos_viewProps($args);
            return $this->view->get_all_photos($props);
        }

        public function get_single_review_photos($args)
        {
            $props = $this->model->get_single_review_photos_viewProps($args);
            return $this->view->get_single_review_photos($props);
        }

        public function get_single_review_photos_field($args)
        {
            $props = $this->model->get_field_viewProps($args);
            return $this->view->get_field($props);
        }

        public function get_ajax_response($request)
        {
            $response = $this->model->get_all_photos_viewProps($request);
            return $response['items'];
        }

    } // END CLASS

}
