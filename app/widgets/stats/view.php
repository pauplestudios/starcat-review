<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\View')) {
    class View
    {
        public function __construct($viewProps)
        {
            $this->viewProps = $viewProps;
        }

        public function get()
        {
            $post_id = $this->viewProps['collection']['post_id'];
            $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($this->viewProps);
            $this->bar_rating = new \HelpieReviews\App\Views\Rating_Types\Bar_Rating($this->viewProps);
            $this->prosandcons = new \HelpieReviews\App\Widgets\ProsAndCons\Controller($post_id);

            $html = '<div class="ui stackable two column grid">';
            $html .= '<div class="column">';
            // Author Stat
            $html .= $this->star_rating->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';

            $html .= '<div class="column">';
            // User Stat
            $html .= $this->bar_rating->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }


        protected function get_rating_stat_set($viewProps)
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
    }
}
