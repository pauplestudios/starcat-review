<?php


namespace HelpieReviews\App\Widgets\Comparison;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Comparison\View')) {
    class View
    {
        private $html;

        public function __construct()
        {
            /* Views */
            // $this->Comparison_Table = new \HelpieReviews\App\Views\Blocks\Comparison_Table();
        }

        public function get_html($stats = [])
        {
            $html = '';

            $html .= '<section class="cd-products-comparison-table">';
            $html .= $this->get_header();
            $html .= '<div class="cd-products-table">';
            $html .= $this->features($stats['cols']);
            $html .= $this->get_columns($stats['stats'], $stats['cols']);
            $html .= $this->navigation();
            $html .= '</div> <!-- .cd-products-table -->';
            $html .= '</section> <!-- .cd-products-comparison-table -->';
            return $html;
        }

        public function get_header()
        {
            $html = '';
            $html .= '<header>';
            $html .= '<h2>Compare Models</h2>';
            $html .= '<div class="actions">';
            $html .= '<a href="#0" class="reset">Reset</a>';
            $html .= ' <a href="#0" class="filter">Filter</a>';
            $html .= '</div>';
            $html .= '</header>';
            return $html;
        }

        public function features($stat_cols)
        {
            $html = '';
            $html .= '<div class="features">';
            $html .= '<div class="top-info">Models</div>';
            $html .= '<ul class="cd-features-list">';

            error_log('$stat_cols : ' . print_r($stat_cols, true));
            for ($ii = 0; $ii < sizeof($stat_cols); $ii++) {
                $html .= '<li>' . $stat_cols[$ii] . '</li>';
            }

            $html .= '</ul>';
            $html .= ' </div> <!-- .features -->';

            return $html;
        }

        public function get_columns($stats, $stat_cols)
        {
            $html = '';
            $html .= '<div class="cd-products-wrapper">';
            $html .= '<ul class="cd-products-columns">';

            foreach ($stats as $key => $single_product_stats) {
                $html .= $this->single_product($single_product_stats, $stat_cols);
            }

            $html .= '</ul> <!-- .cd-products-columns -->';
            $html .= '</div> <!-- .cd-products-wrapper -->';


            return $html;
        }

        public function single_product($stats, $stat_cols)
        {
            $html = '';

            $html .= '<li class="product">';
            $html .= '<div class="top-info">';
            $html .= '<div class="check"></div>';
            $html .= '<img src="../img/product.png" alt="product image">';
            $html .= '<h3>' . $stats['title'] . '</h3>';
            $html .= '</div> <!-- .top-info -->';

            $html .= $this->single_product_features($stats['stats'], $stat_cols);
            $html .= '</li> <!-- .product -->';
            $html .= '<li class="product">';
            $html .= '</li> ';


            return $html;
        }

        public function single_product_features($stats, $stat_cols)
        {
            $html = '';

            $html .= '<ul class="cd-features-list">';

            for ($ii = 0; $ii < sizeof($stat_cols); $ii++) {
                $stat_name = $stat_cols[$ii];
                $stat_value = isset($stats[$stat_name]) ? $stats[$stat_name] : 'X';
                $html .= '<li>' . $stat_value . '</li>';
            }
            // foreach ($stats as $key => $stat) {
            //     $html .= '<li>' . $stat . '</li>';
            // }


            $html .= '</ul>';

            return $html;
        }

        public function navigation()
        {
            $html = '';

            $html .= '<ul class="cd-table-navigation">';
            $html .= '<li><a href="#0" class="prev inactive">Prev</a></li>';
            $html .= '<li><a href="#0" class="next">Next</a></li>';
            $html .= '</ul>';

            return $html;
        }




        /* PRIVATE CLASS */
    } // END CLASS
}