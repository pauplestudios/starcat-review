<?php

namespace HelpieReviews\App\Components\User_Reviews;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\User_Reviews\User_Reviews_Controller')) {
    class User_Reviews_Controller
    {
        public function __construct()
        {            
            $this->utils = new \HelpieReviews\Includes\Utils();
            $this->reviews = new \HelpieReviews\App\Collections\User_Reviews();
            $this->view = new \HelpieReviews\App\Components\User_Reviews\View();
        }

        public function get_view()
        {            
            $viewProps = [
                'collection' => [
                    'title' => 'User Review For ...',
                    'columns' => 1,
                    'items_display' => ['title', 'content'],
                    'show_controls' => [
                        'search' => true,
                        'sort' => true,
                        'reviews' => true,
                        'verified' => false
                    ],
                    'pagination' => true
                ],
                'items' => [
                    '1' => [
                        'title' => 'The WP FrontEnd User Pro support was excellent',
                        'content' => "The WP FrontEnd User Pro support was fantastic. I had a issue with the registration form and spent 3 days on google trying to find a solution. The support team figured it out in a logical and systematic way by looking at the Themes and plugins that may cause conflict. Excellent work and now my website is on it's way to be amazing. glutenfreestyler.com"
                    ],
                    '2' => [
                        'title' => 'Great support team',
                        'content' => "Great support team. Responded quickly."
                    ],
                    '3' => [
                        'title' => 'Very efficient and helpful support team',
                        'content' => "Very efficient and helpful support team"
                    ],
                    '4' => [
                        'title' => 'Awesome products with solid support!',
                        'content' => "To start with, I am using both DOKAN and WPUF and I have to say they are some of the best and most well documented plugins ever! Not only that after purchasing, I contacted their support and their support was out of this world. They responded to every question I had and they solved my issues in no time. Not only they answered my questions but they've given me detailed explanation and information on what and how! I definitely recommend them to anyone that is looking for solid products with solid support. Thank you very much once again!"
                    ],
                ]
            ];
            return $this->view->get_html($viewProps);
        }
    } // END CLASS

}