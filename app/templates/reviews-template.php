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
class reviews_template
{
    public function __construct()
    {
        echo $this->view();
    }

    public function view()
    {
        $review_builder = new \StarcatReview\App\Builders\Review_Builder();
        $review_summary_content = $review_builder->get_summary_content([]);
        $form_and_list_content = $review_builder->get_reviews();
        return $review_summary_content . $form_and_list_content;
    }
}

new reviews_template();