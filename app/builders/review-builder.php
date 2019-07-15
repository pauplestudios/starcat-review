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
        {
            $this->pros_cons_model = new \HelpieReviews\App\Models\Pros_And_Cons();
            $this->stats_model = new \HelpieReviews\App\Models\Stats();
        }
        public function get_reviews($post_id)
        {

            $stats_controller = new \HelpieReviews\App\Widgets\Stats\Controller($post_id);
            $html = $stats_controller->get_view();


            $enable_pros_cons = HRP_Getter::get('enable-pros-cons');

            if ($enable_pros_cons) {
                $pros_and_cons = $this->get_pros_and_cons($post_id);
                $pros_and_cons_view = new \HelpieReviews\App\Views\ProsAndCons($pros_and_cons);
                $html .= $pros_and_cons_view->get_html();
            }

            return $html;
        }


        private function get_pros_and_cons($post_id)
        {
            $pros_and_cons = $this->pros_cons_model->get($post_id);
            return $pros_and_cons;
        }

        private function get_stats($post_id)
        {

            $stats = $this->stats_model->get($post_id);
            return $stats;

            return $stats;
        }
    } // END CLASS

}