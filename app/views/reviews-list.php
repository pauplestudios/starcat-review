<?php

namespace HelpieReviews\App\Views;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Reviews_List')) {
    class Reviews_List
    {
        private $html;

        public function __construct()
        {
            // $this->model = $reviews;
        }

        public function get()
        {
            $html = "<h1>User Review List" . $this->model->title . "</h1>";
            $html .= $this->get_list();
            $this->html = $html;
            echo $this->html;
        }

        public function get_list()
        {
            $html = '';

            $html .= '<div id="listId">';
            $html .= '<ul class="list helpie-list">';
            $html .= $this->get_items();
            $html .= '</ul>';
            $html .= ' <ul class="pagination"></ul>';
            $html .= '</div>';

            // A bunch of items

            return $html;
        }

        public function get_items()
        {
            $size = 5;

            $html = '';
            for ($ii = 0; $ii < $size; $ii++) {
                $html .= $this->get_single_item();
            }
            return $html;
        }

        public function get_single_item()
        {
            $html = '';

            $html .= '<li>';
            $html .= '<img src="https://ununsplash.imgix.net/photo-1414788020357-3690cfdab669?q=75&fm=jpg&s=da7d3842604f06bf5c6ded7f4fe7aeed" />';
            $html .= '<h3>Blog Post One</h3>';
            $html .= '<p>Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio.</p>';
            $html .= '<div class="button">Read More</div>';
            $html .= '</li>';

            return $html;
        }
    } // END CLASS
}