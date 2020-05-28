<?php
/**
 * Display single product reviews for StarCat Review
 */

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

/**
 * undocumented class
 */
class review_template
{
    public function __construct()
    {
        echo $this->view();
    }

    public function view()
    {
        $list_controller = new \StarcatReview\App\Builders\Review_Builder();
        return $list_controller->get_reviews();
    }
}

new review_template();
