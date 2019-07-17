<?php

namespace HelpieReviews\App\Widgets\Comparison;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Comparison\Model')) {
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
        */
        public function get($posts)
        {
            $stat_columns = [];
            $stats = [];

            foreach ($posts as $key => $post) {
                $stats_list = $this->get_stats_list($post->ID);

                $post_info = [];
                $post_info['title'] = $post->post_title;
                $post_info['featured_image_url'] = get_the_post_thumbnail_url($post->ID);
                $post_info['stats'] = [];
                foreach ($stats_list as $key => $single_post_stat) {
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
            $review_post_meta =   get_post_meta($post_id, '_helpie_reviews_post_options', true);

            // Return if empty
            if (!isset($review_post_meta['stats']) || empty($review_post_meta['stats'])) {
                return [];
            }

            $stats_list = $review_post_meta['stats']['stats-list'];

            return $stats_list;
        }
    } // END CLASS

}