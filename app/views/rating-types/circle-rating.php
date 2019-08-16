<?php

namespace HelpieReviews\App\Views\Rating_Types;

use \HelpieReviews\App\Views\Rating_Types\Rating_Type as Rating_Type;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Circle_Rating')) {
    class Circle_Rating extends Rating_Type
    { 
        public function __construct($var) {
            $this->var = $var;
        }
        
    } // END CLASS
}