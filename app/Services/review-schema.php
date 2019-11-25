<?php

namespace StarcatReview\App\Services;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

require __DIR__ . '/../../vendor/autoload.php';


use Spatie\SchemaOrg\Schema;


if (!class_exists('\StarcatReview\App\Services\Review_Schema')) {
    class Review_Schema
    {
        public function get_schema($args)
        {
            $get_review_scripts =  $this->get_product_schema($args);
            return $get_review_scripts;
        }


        protected function get_product_schema($args)
        {
            // generate product review 
            // echo '<pre>';
            // print_r($args);
            // echo '</pre>';
            // exit;
            $reviews_schema = $this->get_reviews_schema($args);
            $schema_review = Schema::product()
                ->review($reviews_schema);

            return $schema_review;
        }

        protected function get_reviews_schema($args)
        {
            $review_schema = array();
            foreach ($args as $comment) {
                $comment_date = date('Y-n-j', strtotime($comment->comment_date));
                $review = $comment->reviews;
                $stats_ratings = $this->get_min_max_ratings($review['stats']);
                $schema_review = Schema::review()
                    ->name($review['title'])
                    ->reviewBody($review['description'])
                    ->datePublished($comment_date)
                    ->reviewRating(
                        Schema::rating()
                            ->ratingValue($review['rating'])
                            ->bestRating($stats_ratings['max_rating'])
                            ->worstRating($stats_ratings['min_rating'])
                    )
                    ->author(
                        Schema::person()
                            ->name($comment->comment_author)
                    );
                $review_schema[] = $schema_review;
            }
            return $review_schema;
        }

        protected function get_article_schema($args)
        {
            // need to implement
        }

        protected function get_breadcrump_schema($args)
        {
            // need to implement
        }

        protected function get_min_max_ratings($args)
        {
            //get the min and max ratings 
            if (count($args) > 0) {
                
                $ratings = array();
                foreach ($args as $stat) {
                    $ratings[] = $stat['rating'];
                }
                $min_ratings = min($ratings);
                $max_ratings = max($ratings);
                return array(
                    'min_rating' => $min_ratings,
                    'max_rating' => $max_ratings
                );
            } else {
                return array(
                    'min_rating' => 0,
                    'max_rating' => 0
                );
            }
        }
    }
}
