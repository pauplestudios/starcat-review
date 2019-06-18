<?php

namespace HelpieReviews\App\Builders;

use \HelpieReviews\Includes\Settings\HRP_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Builders\Controls_Builder')) {
    class Controls_Builder
    {

        public function __construct()
        {
            $this->controls = [
                'search' => [
                    'type' => 'search',
                ],

                'sort' => [
                    'name' => 'sort',
                    'type' => 'dropdown',
                    'default' => '',
                    'label' => 'SortBy',
                    'options' => [
                        'alphabet-asc' => 'Alphabetic Asc',
                        'alphabet-desc' => 'Alphabetic Desc',
                        'avg-rating' => 'Average Rating',
                        'review-count' => 'Number of Reviews'
                    ]
                ],
                'reviews' => [
                    'name' => 'reviews',
                    'type' => 'dropdown',
                    'default' => '',
                    'label' => 'No. of reviews',
                    'options' => [
                        '2' => '2+',
                        '4' => '4+',
                        '25' => '25+',
                        '50' => '50+'
                    ]
                ],
                'verified' => [
                    'name' => 'verified',
                    'type' => 'radio',
                    'label' => 'Verified',
                    'default' => 'either',
                    'options' => [
                        'true' => 'True',
                        'false' => 'False',
                        'either' => 'Either'
                    ]
                ]
            ];

            $this->semantic = new \HelpieReviews\App\Views\Blocks\List_Controls_Semantic();
            $this->listjs = new \HelpieReviews\App\Views\Blocks\List_Controls_Listjs();
        }

        public function get_controls()
        {
            $html = '';

            foreach ($this->controls as $key => $control) {
                $map = $this->get_map($control['type']);
                $methodName = $map['methodName'];
                $html .= $map['class']->$methodName($control);
            }

            return $html;
        }

        private function get_map($controlName)
        {
            $map = [
                'search' => [
                    'class' => new \HelpieReviews\App\Views\Blocks\List_Controls_Listjs(),
                    'methodName' => 'search'
                ],
                'sort_button' => [
                    'class' => new \HelpieReviews\App\Views\Blocks\List_Controls_Listjs(),
                    'methodName' => 'sort_button'
                ],
                'dropdown' => [
                    'class' => new \HelpieReviews\App\Views\Blocks\List_Controls_Semantic(),
                    'methodName' => 'dropdown'
                ],
                'radio' => [
                    'class' => new \HelpieReviews\App\Views\Blocks\List_Controls_Semantic(),
                    'methodName' => 'radio_group'
                ]
            ];

            return $map[$controlName];
        }
    } // END CLASS

}