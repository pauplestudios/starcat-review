<?php

namespace HelpieReviews\App\Components\Summary;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\Summary\View')) {
    class View
    {
        public function __construct()
        { }

        public function get($post_id)
        {
            $this->stat = new \HelpieReviews\App\Components\Stats\Controller($post_id);
            $this->prosandcons = new \HelpieReviews\App\Components\ProsAndCons\Controller($post_id);

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
