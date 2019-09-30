<?php

namespace HelpieReviews\App\Builders;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Builders\Review_Builder')) {
    class Review_Builder
    {

        public function __construct()
        { }
        public function get_reviews($post_id)
        {
            $html = '';
            $summary = new \HelpieReviews\App\Widgets\Summary\Controller($post_id);
            $html .= $summary->get_view();

            $form_controller = new \HelpieReviews\App\Widgets\Form\Controller($post_id);
            $html .= $form_controller->get_view();

            return $html;
        }
    } // END CLASS

}
