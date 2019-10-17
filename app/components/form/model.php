<?php

namespace HelpieReviews\App\Components\Form;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Form\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            $this->collection = $this->get_collectionProps($args);
            $this->items = $this->get_itemsProps($args);

            $view_props = [
                'collection' => $this->collection,
                'items' => $this->items
            ];

            return $view_props;
        }

        protected function get_collectionProps($args)
        {
            $collection =  [
                'show_form_title' => $args['show_form_title'],
                'form_title' => $args['form_title'],
                'show_title' => $args['show_title'],
                'show_stats' => $args['show_stats'],
                'show_prosandcons' => $args['enable_pros_cons'],
                'show_description' => $args['show_description'],
                'show_rating_label' => $args['show_rating_label'],
                'singularity' => $args['singularity'],
                'review_type' => $args['type'],   // Star, Bar, Circle
                'source_type' => $args['source_type'], // icon or image
                'icons' => $args['icons'],
                'images' => $args['images'],
                'limit' => $args['limit'],
                'steps' => $args['steps'], // full or half or progress
                'no_rated_message' => $args['no_rated_message'],
                'animate' => false,
                'can_user_review' => $args['can_user_review'],
            ];

            $collection = $this->get_icons($collection);

            return $collection;
        }

        public function get_itemsProps($args)
        {
            $items = [];
            $items['pros'] = $this->get_filtered_prosorcons($args, 'pros-list');
            $items['cons'] = $this->get_filtered_prosorcons($args, 'cons-list');
            $items['stats'] = $this->get_filtered_stats($args);

            return $items;
        }

        protected function get_filtered_stats($args)
        {
            $stats = [];
            $stat_count = 0;

            // if (!isset($args['items']['stats-list']) && empty($args['items']['stats-list'])) {
            //     return $stats;
            // }
            if (isset($args['global_stats']) && !empty($args['global_stats'])) {
                foreach ($args['global_stats'] as $allowed_stat) {

                    if ($this->collection['singularity'] == 'single' && $stat_count >= 1) {
                        break;
                    }

                    $stat = strtolower($allowed_stat['stat_name']);

                    $stats[$stat] = ['stat_name' => $stat];

                    $stat_count++;
                }
            }

            return $stats;
        }

        protected function get_filtered_prosorcons($args, $prosorcons)
        {
            $items = [];

            if (!isset($args['items'][$prosorcons]) && empty($args['items'][$prosorcons])) {
                return $items;
            }

            foreach ($args['items'][$prosorcons] as $key => $item) {
                $proorcon = strtolower(preg_replace('/\s+/', '_', $item['item']));
                $items[] = [
                    'item' => $item['item'],
                    'unique' => $proorcon
                ];
            }

            return $items;
        }

        protected function get_icons($collection)
        {
            $image = SCR_URL . 'includes/assets/img/tomato.png';
            $image_outline =  SCR_URL . 'includes/assets/img/tomato-outline.png';
            $collection['icon'] = (isset($collection['images']['image']['thumbnail'])) ? $collection['images']['image']['thumbnail'] : $image;
            $collection['outline_icon'] = (isset($collection['images']['image-outline']['thumbnail'])) ? $collection['images']['image-outline']['thumbnail'] : $image_outline;

            if ($collection['source_type'] == 'icon') {
                $collection['icon'] = $collection['icons'] . ' icon';
                $collection['outline_icon'] = $collection['icons'] . ' outline icon';
            }

            return $collection;
        }
    } // END CLASS
}
