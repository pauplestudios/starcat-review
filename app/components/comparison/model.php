<?php

namespace StarcatReview\App\Components\Comparison;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Comparison\Model')) {
    class Model
    {

        /*
        Data Model
        $stats = [
                'stat_name_1' => [
                    'post_id_1' => 'post_id_1_value',
                    'post_id_2' => 'post_id_2_value',
                    'post_id_3' => 'post_id_3_value',
                ],
                'stat_name_2 => [
                    'post_id_1' => 'post_id_1_value',
                    'post_id_2' => 'post_id_2_value',
                    'post_id_3' => 'post_id_3_value',
                ],
            ];

                    $stats = [
                'stat_name_1' => [
                    'post_id_1' => 'post_id_1_value',
                    'post_id_2' => 'post_id_2_value',
                    'post_id_3' => 'post_id_3_value',
                ],
                'stat_name_2 => [
                    'post_id_1' => 'post_id_1_value',
                    'post_id_2' => 'post_id_2_value',
                    'post_id_3' => 'post_id_3_value',
                ],
            ];
        */
        public function get($posts)
        {
            $stat_columns = [];
            $stats = [];

            foreach ($posts as $key => $post) {
                $stats_list = $this->get_stats_list($post->ID);
                $get_scr_get_user_reviews = scr_get_user_reviews($post->ID);

                // echo '<pre>';
                // print_r($get_scr_get_user_reviews);
                // echo '</pre>';
                $review_stats = array();
                if (count($get_scr_get_user_reviews) > 0) {
                    foreach ($get_scr_get_user_reviews  as $user_reviews) {
                        $reviews = isset($user_reviews->reviews) ? $user_reviews->reviews : [];
                        if (isset($reviews) && count($reviews) > 0) {
                            $review_stats = $reviews['stats'];
                        }
                    }
                }

                /*if (count($review_stats) > 0) {
                    //get stat features only
                    $stats_columns = array_keys($review_stats);
                } else {
                    $stats_columns = array();
                }*/

                // error_log('get_scr_get_user_reviews' . print_r($get_scr_get_user_reviews, true));
                // error_log('stats_columns' . print_r($stats_columns, true));

                $post_info = [];
                $post_info['title'] = $post->post_title;
                $post_info['featured_image_url'] = get_the_post_thumbnail_url($post->ID);
                $post_info['stats']  = [];
                // $post_info['stats'] = $stats_columns;

                foreach ($review_stats as $key => $single_post_stat) {
                    $stat_name = $single_post_stat['stat_name'];

                    // if (!isset($stats[$stat_name])) {
                    //     $stats[$stat_name] = [];
                    // }

                    $post_info['stats'][$stat_name] =  $single_post_stat['rating'];

                    if (!in_array($stat_name, $stat_columns)) {
                        $stat_columns[] = $stat_name;
                    }
                    // $stats[$stat_name][$post->ID] = $single_post_stat['rating'];
                }

                $stats[$post->ID] = $post_info;
            }

            return [
                'stats' => $stats,
                'cols' => $stat_columns
            ];
        }


        protected function get_stats_list($post_id)
        {
            $review_post_meta =   get_post_meta($post_id, '_scr_post_options', true);

            // Return if empty
            if (!isset($review_post_meta['stats']) || empty($review_post_meta['stats'])) {
                return [];
            }

            $stats_list = $review_post_meta['stats']['stats-list'];

            return $stats_list;
        }
    } // END CLASS

}
