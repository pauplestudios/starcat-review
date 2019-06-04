<?php

namespace HelpieReviews\App\Models;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Models\Pros_And_Cons')) {
    class Pros_And_Cons
    {
        public function get($post_id)
        {
            $review_post_meta =   get_post_meta($post_id, '_helpie_reviews_post_options', true);

            // Return if empty
            if ($this->is_empty($review_post_meta)) {
                return [];
            }

            $pros_list = $review_post_meta['pros']['pros-list'];
            $cons_list = $review_post_meta['cons']['cons-list'];

            $pros_and_cons = [];
            $pros_and_cons['pros'] = [];
            $pros_and_cons['cons'] = [];

            foreach ($pros_list as $key => $item) {
                $pros_and_cons['pros'][] = $item['pro_con'];
            }

            foreach ($cons_list as $key => $item) {
                $pros_and_cons['cons'][] = $item['pro_con'];
            }

            error_log('$pros_and_cons : ' . print_r($pros_and_cons, true));
            return $pros_and_cons;
        }

        /* PRIVATE METHODS */
        private function is_empty($dataModel)
        {
            $is_empty = true;

            if (!isset($dataModel) || empty($dataModel)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($dataModel['pros']) || empty($dataModel['pros']));
            $is_cons_empty = (!isset($dataModel['cons']) || empty($dataModel['cons']));

            // Either should be NOT EMPTY 
            if (!$is_pros_empty  || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}