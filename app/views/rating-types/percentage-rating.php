<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Percentage_Rating')) {
    class Percentage_Rating
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
    }
}

// 1 to 100