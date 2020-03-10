<?php

namespace StarcatReview\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\ProsAndCons\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            $items = $this->get_items($args);
            $view_props = [
                'items' => $items,
            ];

            if (isset($args['current_user_review']->review) && !empty($args['current_user_review']->review)) {

                $view_props['fields'] = [
                    'pros' => $this->get_list($args['current_user_review']->review['pros']),
                    'cons' => $this->get_list($args['current_user_review']->review['cons']),
                ];
                error_log('ProsAndCons args: ' . print_r($args, true));
            }

            return $view_props;
        }

        protected function get_items($args)
        {
            // Return if empty
            if ($this->is_empty($args['items'])) {
                return [];
            }

            $itemsProps = [
                'pros' => $this->get_list($args['items']['pros-list']),
                'cons' => $this->get_list($args['items']['cons-list']),
            ];

            return $itemsProps;
        }

        protected function get_list($items)
        {
            $list = [];
            if (isset($items) && !empty($items)) {
                foreach ($items as $key => $item) {
                    array_push($list, $item['item']);
                }
            }

            return $list;
        }

        /* PRIVATE METHODS */
        private function is_empty($items)
        {
            $is_empty = true;

            if (!isset($items) || empty($items)) {
                return $is_empty;
            }

            // if (!is_array($items) || !is_object($items)) {
            //     return $is_empty;
            // }

            $is_pros_empty = (!isset($items['pros-list']) || empty($items['pros-list']));
            $is_cons_empty = (!isset($items['cons-list']) || empty($items['cons-list']));

            // Either should be NOT EMPTY
            if (!$is_pros_empty || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}
