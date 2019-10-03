<?php

namespace HelpieReviews\App\Components\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Stats\Controller')) {
    class Controller
    {
        public function __construct($post_id)
        {
            $this->model = new \HelpieReviews\App\Components\Stats\Model($post_id);
        }

        public function get_view()
        {
            $viewProps = $this->model->get_viewProps();
            return $this->get_stat_set($viewProps);
        }

        protected function get_stat_set($viewProps)
        {
            $display_rating_type = $viewProps['collection']['type'];

            switch ($display_rating_type) {
                case "star":
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    return $this->star_rating->get_view();
                case "bar":
                    $this->bar_rating = new \HelpieReviews\App\Views\Rating_Types\Bar_Rating($viewProps);
                    return $this->bar_rating->get_view();
                case "circle":
                    $this->circle_rating = new \HelpieReviews\App\Views\Rating_Types\Circle_Rating($viewProps);
                    return $this->circle_rating->get_html();
                default:
                    $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($viewProps);
                    return $this->star_rating->get_view();
            }
        }
    } // END CLASS

}