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
            $collection = $this->get_collection($args);
            $viewProps = [
                'collection' => $collection,
                'items' => $this->get_items($collection),
            ];

            return $viewProps;
        }

        public function get_single_photos_viewProps($args)
        {
            $photos_JSON = file_get_contents(SCR_PT_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $props = ['a' => [], 'b' => [], 'c' => [], 'd' => []];

            $start = 50;
            foreach ($props as $key => $value) {
                for ($i = $start; $i < sizeof($photos['photos']); $i++) {
                    if ($i % 3 === 0 && ($i !== $start)) {
                        break;
                    }
                    array_push($props[$key], $photos['photos'][$i]['src']['tiny']);
                }
                $start = $i;
            };

            return $props;
        }

        protected function get_collection($args)
        {
            $photos_JSON = file_get_contents(SCR_PT_PATH . 'includes/utils/photos.json');
            $photos = json_decode($photos_JSON, true);

            $collection = [
                'from' => isset($args['from']) ? $args['from'] : 0,
                'size' => 'tiny',
                'photos' => $photos['photos'],
                'total_count' => sizeof($photos['photos']),
                'preview_limit' => 7,
                'photos_per_page' => 20,
                'photos_per_review' => 4,
                'placeholder_image' => SCR_URL . 'includes/assets/img/square-image.png',
            ];

            return $collection;
        }

        protected function get_items($collection)
        {
            $items = [];

            $data_review_id = ($collection['from'] !== 0) ? $collection['from'] / $collection['photos_per_review'] : 0; // Temporary review ID

            for ($i = $collection['from']; $i < sizeof($collection['photos']); $i++) {

                if (($i % $collection['photos_per_page'] === 0) && ($i !== $collection['from'])) {
                    break;
                }

                if ($i % $collection['photos_per_review'] === 0) {
                    $data_review_id++;
                }

                $item = [
                    'review_id' => $data_review_id,
                    'image_src' => $collection['photos'][$i]['src'][$collection['size']],
                ];

                array_push($items, $item);
            }

            return $items;
        }

    } // END CLASS

}
