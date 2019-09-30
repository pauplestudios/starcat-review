<?php

namespace HelpieReviews\App\Widgets\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Summary\View')) {
    class View
    {
        public function __construct($post_id)
        {
            $this->stat = new \HelpieReviews\App\Widgets\Stats\Controller($post_id);
            $this->prosandcons = new \HelpieReviews\App\Widgets\ProsAndCons\Controller($post_id);
        }

        public function get()
        {
            $html = '<div class="ui stackable two column grid">';
            $html .= '<div class="column">';
            // Author Summary
            $html .= $this->stat->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';

            $html .= '<div class="column">';
            // User Summary         
            $html .= $this->stat->get_view();
            $html .= $this->prosandcons->get_view();
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }
    }
}
