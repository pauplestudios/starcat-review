<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating')) {
    class Progress_Bar_Rating
    {
        private $html;

        public function __construct($stats)
        {             
            $this->props = [
                'stats' => $stats,
                // 'divisor' => 10,
                'show_stats' => ['overall', 'price', 'ux', 'feature'],
                'min' => 0,
                'max' => 100
            ];
        }

        public function get_html()
        {
            $html = "<div class='hrp-rating-collection hrp-container'>";
            // $count = 0;

            $stats_html = '';
            // $stats_cumulative_score = 0;

            foreach ($this->props['stats'] as $key => $value) {
                $stats_cumulative_score += $value;

                if ($this->is_stat_included($key)) {
                    $stats_html .= $this->get_single_stat($value, $key);
                }

                $count++;
            }

            $overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

            $html .= $overall_stat_html . $stats_html;
            
            // $html .= $this->get_progress_bar_set();
            $html .= "</div>";

            $this->html = $html;
            return $this->html;
            
        }

        protected function get_overall_stat_html($stats_cumulative_score, $count)
        {
            $overall_stat_value = $stats_cumulative_score / $count;
            $overall_stat_html = $this->get_single_stat($overall_stat_value, __('Overall', 'helpie-reviews'));

            // error_log('$stats_cumulative_score : ' . $stats_cumulative_score);
            // error_log('$overall_stat_value : ' . $overall_stat_value);

            return $overall_stat_html;
        }

        protected function get_single_stat($value, $key)
        {
            $html = '';            

            if (!$this->is_stat_included($key)) {
                return $html;
            }

            $html .= "<div class='single-rating'><div class='rating-label'>" . $key . "</div>";
            $html .= $this->get_progress_bar_set();
            $html .= "</div>";

            return $html;
        }        

        protected function is_stat_included($key)
        {            
            $key = $this->get_santized_key($key);
            if (in_array($key, $this->props['show_stats'])) {
                return true;
            }

            return false;
        }
        protected function get_santized_key($key)
        {
            $key = strtolower($key);
            $key = trim($key);

            return $key;
        }

        protected function get_progress_bar_set($min = 0, $max = 100, $value = 50)
        {            
            $html ='<div class="progress user-rating">
                <div class="progress-bar" role="progressbar" aria-valuenow="'.$value.'"
                aria-valuemin="'.$min.'" aria-valuemax="'.$max.'" style="width:'.$value.'%;">'.$value.'%</div>
                </div>';

            return $html;
        }
    }
}

// 1 to 10