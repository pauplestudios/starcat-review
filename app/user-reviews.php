<?php

namespace HelpieReviews\App;

use HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\User_Reviews')) {
    class User_Reviews
    {
        public function __construct()
        {
            $this->form_controller = new \HelpieReviews\App\Components\Form\Controller();
            $this->reviews_controller = new \HelpieReviews\App\Components\User_Reviews\User_Reviews_Controller();
        }

        public function get_view()
        {

            $args = $this->get_default_args();
            $form_view = $this->form_controller->get_view($args);
            $reviews_list_view = $this->reviews_controller->get_view();

            $view = $form_view . $reviews_list_view;

            return $view;
        }

        public function get_default_args()
        {
            $global_stats = HRP_Getter::get('global_stats');
            $singularity = HRP_Getter::get('stat-singularity');
            $type = HRP_Getter::get('stats-type');
            $stars_limit =  HRP_Getter::get('stats-stars-limit');
            $rating_label =  HRP_Getter::get('stats-display-rating');
            $bars_limit = HRP_Getter::get('stats-bars-limit');
            $limit = ($type == 'star') ? $stars_limit : $bars_limit;
            $source_type = HRP_Getter::get('stats-source-type');
            $icons = HRP_Getter::get('stats-icons');
            $images = HRP_Getter::get('stats-images');
            $steps = HRP_Getter::get('stats-steps');
            $animate = HRP_Getter::get('stats-animate');

            $args = [
                'global_stats' => $global_stats,
                'items' => $this->get_items(),
                'singularity' => $singularity,
                'type' => $type,
                'source_type' => $source_type,
                'display_rating' => $rating_label,
                'icons' => $icons,
                'images' => $images,
                'steps' => $steps,
                'limit' => $limit,
                'animate' => $animate
            ];

            return $args;
        }

        protected function get_items()
        {
            $post_meta = get_post_meta(get_the_ID(), '_helpie_reviews_post_options', true);
            // error_log("Options : " . print_r($post_meta, true));
            $items = [];

            if (isset($post_meta['stats-list']) || !empty($post_meta['stats-list'])) {
                $items['stats-list'] = $post_meta['stats-list'];
            }
            if (isset($post_meta['pros-list']) || !empty($post_meta['pros-list'])) {
                $items['pros-list'] = $post_meta['pros-list'];
            }
            if (isset($post_meta['cons-list']) || !empty($post_meta['cons-list'])) {
                $items['cons-list'] = $post_meta['cons-list'];
            }

            return $items;
        }
    }
}
