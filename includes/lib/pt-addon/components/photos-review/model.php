<?php

namespace StarcatReviewPt\Components\Photos_Review;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPt\Components\Photos_Review\Model')) {
    class Model
    {
        public function get_all_photos_viewProps($args)
        {
            $photos_JSON = file_get_contents(SCR_PT_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $collection = $this->get_collection($photos);
            $viewProps = [
                'collection' => $collection,
                'items' => $this->get_items($collection),
            ];

            return $viewProps;
        }

        public function get_single_photos_viewProps($args)
        {
            return $args;
        }

        protected function get_collection($args)
        {
            $collection = [
                'limit' => '8',
                'size' => 'portrait',
                'photos' => $args['photos'],
                'total_count' => sizeof($args['photos']),
                'placeholder_image' => SCR_URL . 'includes/assets/img/square-image.png',
            ];

            return $collection;
        }

        protected function get_items($collection)
        {
            $items = [];

            for ($i = 0; $i < sizeof($collection['photos']); $i++) {

                if ($i == $collection['limit']) {
                    break;
                }

                array_push($items, $collection['photos'][$i]['src'][$collection['size']]);
            }

            return $items;
        }

    } // END CLASS

}
