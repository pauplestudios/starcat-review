<?php

namespace HelpieReviews\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\ProsAndCons\Model')) {
    class Model
    {
        public function get($post_id)
        {
            $review_post_meta =  get_post_meta($post_id, '_helpie_reviews_post_options', true);

            // Return if empty
            if ($this->is_empty($review_post_meta)) {
                return [];
            }

            $pros_list = $review_post_meta['pros-list'];
            $cons_list = $review_post_meta['cons-list'];

            $pros_and_cons = [];
            $pros_and_cons['pros'] = [];
            $pros_and_cons['cons'] = [];

            foreach ($pros_list as $key => $item) {
                $pros_and_cons['pros'][] = $item['item'];
            }

            foreach ($cons_list as $key => $item) {
                $pros_and_cons['cons'][] = $item['item'];
            }

            return $pros_and_cons;
        }

        /* PRIVATE METHODS */
        private function is_empty($dataModel)
        {
            $is_empty = true;

            if (!isset($dataModel) || empty($dataModel)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($dataModel['pros-list']) || empty($dataModel['pros-list']));
            $is_cons_empty = (!isset($dataModel['cons-list']) || empty($dataModel['cons-list']));

            // Either should be NOT EMPTY 
            if (!$is_pros_empty  || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}
