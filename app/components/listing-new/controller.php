<?php

namespace StarcatReview\App\Components\Listing_New;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\Listing_New\Controller')) {
    class Controller
    {
        public function __construct()
        {
            $this->model = new \StarcatReview\App\Components\Listing_New\Model();
            $this->view = new \StarcatReview\App\Components\Listing_New\View();
        }

        public function get_view($args)
        {
            $viewProps = $this->model->get_viewProps($args);
            return $this->view->get_html($viewProps);
        }

        public function get_viewProps()
        {
            $collectionProps = [
                'title' => '',
                'posts_per_page' => 10,
                'show_controls' => [
                    'search' => true,
                    'sort' =>   true,
                    // 'reviews' => $args['show_num_of_reviews_filter'],
                ],
                'post_count' => 20,
                'total_pages' => 20 / 10,
                'pagination' => true,
                'columns' =>  3,
                'items_display' =>  ['title', 'content', 'link']
            ];

            $viewProps = [
                'collection' => $collectionProps,
                'items' => [
                    [
                        'title' => 'Item Title 1',
                        'featured_image' => SCR_URL . 'includes/assets/img/dummy-review.jpg',
                        'content' => 'Item Content',
                        'stat_html' => '<div>Stats HTML</div>',
                        'url' => 'http://item.com',
                        'meta_data' => [
                            'review_count' => 30,
                            'post_date' => 11223434341,
                            'post_modified' => 11223434342,
                        ],
                        'columns' => $collectionProps['columns'],
                        'items_display' => $collectionProps['items_display'],
                    ],
                    [
                        'title' => 'Item Title 2',
                        'featured_image' => SCR_URL . 'includes/assets/img/dummy-review.jpg',
                        'content' => 'Item Content',
                        'stat_html' => '<div>Stats HTML</div>',
                        'url' => 'http://item.com',
                        'meta_data' => [
                            'review_count' => 30,
                            'post_date' => 11223434341,
                            'post_modified' => 11223434342,
                        ],
                        'columns' => $collectionProps['columns'],
                        'items_display' => $collectionProps['items_display'],
                    ],
                    [
                        'title' => 'Item Title 3',
                        'featured_image' => SCR_URL . 'includes/assets/img/dummy-review.jpg',
                        'content' => 'Item Content',
                        'stat_html' => '<div>Stats HTML</div>',
                        'url' => 'http://item.com',
                        'meta_data' => [
                            'review_count' => 30,
                            'post_date' => 11223434341,
                            'post_modified' => 11223434342,
                        ],
                        'columns' => $collectionProps['columns'],
                        'items_display' => $collectionProps['items_display'],
                    ]
                ]
            ];

            return $viewProps;
        }
    } // END CLASS

}