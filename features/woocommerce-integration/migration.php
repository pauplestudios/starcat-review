<?php

namespace StarcatReview\Features\Woocommerce_Integration;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\Features\Woocommerce_Integration\Migration')) {
    class Migration
    {
        public function __construct()
        {
            error_log('!!! Core Woo starCat Review Migration !!!');
        }

        public function init()
        {
            // do migrate and run once after plugin version updated
        }
    } // END CLASS

}
