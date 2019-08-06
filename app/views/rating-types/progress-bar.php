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
                'divisor' => 10,
                'show_stats' => ['overall', 'price', 'ux']
            ];
        }

        public function get_progress_bar()
        {
            
            $html ='<div class="progress">
                <div class="progress-bar" role="progressbar" aria-valuenow="70"
                aria-valuemin="0" aria-valuemax="100" style="width:70%">70%</div>
                </div>';

            return $html;
        }
    }
}

// 1 to 10