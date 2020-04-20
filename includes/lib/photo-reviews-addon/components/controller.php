<?php

namespace StarcatReviewPhotoReviews\Components;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPhotoReviews\Components\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReviewPhotoReviews\Components\Model();
            $this->view = new \StarcatReviewPhotoReviews\Components\View();
            $this->repository = new \StarcatReviewPhotoReviews\Includes\Repository();
        }

        public function load()
        {
            add_filter('scr_photo_reviews/get_all_photos', [$this, 'get_all_photos']);
            add_filter('scr_photo_reviews/get_single_review_photos', [$this, 'get_single_review_photos']);
            add_filter('scr_photo_reviews/get_single_review_upload_photos_field', [$this, 'get_upload_photos_field']);

            add_filter('scr_photo_reviews/ajax', [$this, 'get_ajax_response']);

            add_action('scr_photo_reviews/add_attachments', [$this->repository, 'check_review_image']);
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

        public function get_upload_photos_field($args)
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
