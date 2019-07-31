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

            $stats_controller = new \HelpieReviews\App\Widgets\Stats\Controller($post_id);
            $html = $stats_controller->get_view();


            $enable_pros_cons = HRP_Getter::get('enable-pros-cons');

            if ($enable_pros_cons) {

                $pros_and_cons_controller = new \HelpieReviews\App\Widgets\ProsAndCons\Controller($post_id);
                $html .= $pros_and_cons_controller->get_view();
            }

            return $html;
        }
    } // END CLASS

}