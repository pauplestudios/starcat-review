<?php

namespace HelpieReviews\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Summary\Model')) {
    class Model
    {
        public function get_Props($args)
        {
            $props = $args;

            $props['items']['author'] = $args['items'];
            $props['items']['user']['stats-list'] = $this->get_userSummaryItems($props);

            return $props;
        }

        protected function get_userSummaryItems($collection)
        {
            $items = [];

            $args = [
                'post_id' => $collection['post_id'],
                'type' => 'helpie_reviews'
            ];

            $comments = get_comments($args);
            $groups = [];

            foreach ($comments as $comment) {
                $comment->review_props = get_comment_meta($comment->comment_ID, 'hrp_user_review_props', true);

                foreach ($collection['global_stats'] as $allowed_stat) {
                    $allowed_stat_name = strtolower($allowed_stat['stat_name']);
                    if (!isset($groups[$allowed_stat_name])) {
                        $groups[$allowed_stat_name] = 0;
                    }

                    $count = count($comment->review_props['stats'][$allowed_stat_name]);

                    $groups[$allowed_stat_name] += $comment->review_props['stats'][$allowed_stat_name]['rating'] / $count;
                }
            }

            if (!empty($groups)) {
                $items = $this->get_stats($groups);
            }

            return $items;
        }


        protected function get_stats($groups)
        {
            $stats = [];

            foreach ($groups as $key => $value) {
                $stats[$key] = [
                    'stat_name' => $key,
                    'rating' => $value
                ];
            }

            return $stats;
        }
    }
}
