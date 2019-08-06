<?php

namespace HelpieReviews\App\Views\Rating_Types;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Image_Rating')) {
    class Image_Rating
    {
        private $html;

        public function __construct($stats)
        { 
            $this->props = [
                'stats' => $stats,
                'divisor' => 20,
                'show_stats' => ['overall', 'price', 'ux']
            ];
        }
    }
}

// Custom Image