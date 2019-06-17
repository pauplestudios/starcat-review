<?php

namespace HelpieReviews\App\Views\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Blocks\List_Controls_Semantic')) {
    class List_Controls_Semantic
    {

        public function __construct()
        { }

        /* HTML for List_Controls */
        public function get_view()
        {
            $html = '';

            $html .= $this->dropdown();
            $html .= $this->checkbox();
            $html .= $this->radio_group();

            return $html;
        }

        public function search_dropdown()
        {
            $html = '';

            $html .= '<select class="ui fluid search dropdown" multiple="">';
            $html .= '<option value="">State</option>';
            $html .= '<option value="WY">Wyoming</option>';
            $html .= '</select>';

            return $html;
        }

        public function dropdown()
        {

            $values = [
                '2' => '2+',
                '4' => '4+',
                '25' => '25+',
                '50' => '50+'
            ];

            $html = '<div class="ui dropdown">';

            $html .= '<input type="hidden" name="gender">';
            $html .= '<i class="dropdown icon"></i>';
            $html .= '<div class="default text">Gender</div>';
            $html .= '<div class="menu">';


            foreach ($values as $key => $value) {
                $html .= '<div class="item" data-value="' . $key . '">' . $value . '</div>';
            }
            // $html .= '<div class="item" data-value="male">Male</div>';
            // $html .= '<div class="item" data-value="female">Female</div>';
            $html .= '</div>';
            $html .= '</div>';

            return $html;
        }


        public function checkbox()
        {
            $html = '';

            $html .= '<div class="ui checkbox">';
            $html .= '<input type="checkbox" name="example">';
            $html .= ' <label>Make my profile visible</label>';
            $html .= '</div>';

            return $html;
        }

        public function radio_group()
        {
            $html = '';

            $html .= '<div class="ui form">';
            $html .= '<div class="grouped fields">';
            $html .= '<label>How often do you use checkboxes?</label>';

            $html .= '<div class="field">';
            $html .= '<div class="ui radio checkbox">';
            $html .= '<input type="radio" name="example2" checked="checked">';
            $html .= '<label>Once a week</label>';
            $html .= '</div>';
            $html .= '</div>';

            $html .= '</div>';
            $html .= '</div>';
            return  $html;
        }
    } // END CLASS
}