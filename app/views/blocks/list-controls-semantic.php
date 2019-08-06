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

        public function dropdown($props)
        {

            $html = '<div class="ui fluid selection dropdown ' . $props['name'] . '">';
            $html .= '<input type="hidden" name="' . $props['name'] . '">';
            $html .= '<i class="dropdown icon"></i>';
            $html .= '<div class="default text">' . $props['label'] . '</div>';
            $html .= '<div class="menu">';

            $options = $props['options'];
            foreach ($options as $key => $option_value) {
                $html .= '<div class="item" data-value="' . $key . '">' . $option_value . '</div>';
            }

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

        public function radio_group($props)
        {
            $html = '';

            $html .= '<div class="ui form">';
            $html .= '<div class="grouped fields">';
            $html .= '<label>' . $props['label'] . '</label>';

            $options = $props['options'];
            foreach ($options as $key => $option_value) {

                $checked = '';
                if ($key == $props['default']) {
                    $checked = 'checked="checked"';
                }
                $html .= '<div class="field">';
                $html .= '<div class="ui radio checkbox">';
                $html .= '<input type="radio" name="' . $props['name'] . '" ' . $checked . '>';
                $html .= '<label>' . $option_value . '</label>';
                $html .= '</div>';
                $html .= '</div>';
            }

            $html .= '</div>';
            $html .= '</div>';
            return  $html;
        }
    } // END CLASS
}