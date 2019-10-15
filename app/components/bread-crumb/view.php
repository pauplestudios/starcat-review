<?php

namespace HelpieReviews\App\Components\BreadCrumb;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Components\BreadCrumb')) {
    class View
    {
        public function __construct()
        { }

        public function single_item($link, $title)
        {
            // echo 'link' . $link;
            // echo 'title' . $title;
            $html = '';
            $html .= "<a class='mainpage-link' href='" . $link . "'>" . $title . '</a> ';
            return $html;
        }

        public function get_seperator()
        {
            $html = '';
            $html .= "<span class='helpiekb_separator'> &nbsp;&nbsp; <i class='fa fa-angle-right' aria-hidden='true'></i>&nbsp;&nbsp;</span>";
            return $html;
        }
    }
}
