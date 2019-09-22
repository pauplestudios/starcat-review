<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Widgets\Stats\Model($post_id);
        }

        public function get_view()
        {
            $viewProps = $this->model->get_viewProps();
            return $this->get_stat_set($viewProps);
        }

        protected function get_stat_set($viewProps)
        {
            $display_rating_type = $viewProps['collection']['display_rating_type'];

            switch ($display_rating_type) {
                case "star":
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    $html = $this->star_rating->get_view();
                    $html .= $this->star_rating->get_html();
                    return $html;
                    break;
                case "progress_bar":
                    $this->progress_bar_rating = new \HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating($viewProps);
                    return $this->progress_bar_rating->get_html();
                    break;
                case "circle":
                    $this->circle_rating = new \HelpieReviews\App\Views\Rating_Types\Circle_Rating($viewProps);
                    return $this->circle_rating->get_html();
                    break;
                default:
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    return $this->star_rating->get_html();
            }
        }

        private function get_stats($post_id)
        {
            $stats = $this->model->get($post_id);
            return $stats;
        }
    } // END CLASS

}
