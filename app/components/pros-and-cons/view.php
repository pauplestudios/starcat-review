<?php

namespace StarcatReview\App\Components\ProsAndCons;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReview\App\Components\ProsAndCons\View')) {
    class View
    {
        public function get($viewProps)
        {
            $this->items = $viewProps['items'];

            // Return '' if pros and cons are empty
            if ($this->is_empty()) {
                return '';
            }

            $html = "<div class='prosandcons'>";
            $html .= "<h6 class='ui header'>Pros & Cons</h6>";
            $html .= "<div class='items-container'>";

            $html .= $this->get_list('pros', $this->items['pros']);
            $html .= $this->get_list('cons', $this->items['cons']);

            $html .= "</div>";

            $html .= "</div>";

            return $html;
        }

        // User review Form fields
        public function get_fields($props)
        {
            error_log('viewProps : ' . print_r($props, true));

            // $data = [];
            // $options = [];

            $html = '';
            // $html .= '<div class="two fields">';
            $html .= $this->get_field('pros', $options, $data);
            $html .= $this->get_field('cons', $options, $data);
            // $html .= '</div>';

            return $html;
        }

        protected function get_list($name, $items)
        {
            $icon_class = ($name === 'pros') ? 'green thumbs up icon' : 'red thumbs down icon';

            $html = "<ul class='" . $name . "'>";

            for ($ii = 0; $ii < sizeof($items); $ii++) {
                if (!empty($items[$ii])) {
                    $html .= "<li><i class='" . $icon_class . "'></i>" . $items[$ii] . "</li>";
                }
            }

            $html .= "</ul>";

            return $html;
        }

        protected function get_field($name, $options, $data)
        {
            $html = '<div class="field review-' . $name . '-repeater">';
            // $html .= '<div class="ui segment">';
            $html .= '<h5> ' . ucfirst($name) . ' </h5>';
            $html .= '<div data-repeater-list="' . $name . '" >';
            $html .= '<div class="unstackable fields" data-repeater-item >';
            $html .= '<div class="fourteen wide field">';
            $html .= '<select class="ui fluid search prosandcons dropdown" name="' . $name . '[0]" data-' . $name . '="' . $name . '">';
            $html .= $this->get_options($name);
            $html .= '</select>';
            $html .= '</div>';
            $html .= '<div class="two wide field">';
            $html .= '<div class="ui icon basic button" data-repeater-delete><i class="minus icon"></i></div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '<div data-repeater-create class="ui icon basic button"><i class="plus icon"></i></div>';
            // $html .= '</div>';
            $html .= '</div>';

            return $html;
        }

        private function get_options($option)
        {
            // default option value or sometimes field placeholder
            $html = '<option value=""> Type a new one or select existing ' . $option . '</option>';

            foreach ($this->props['items'][$option] as $value) {
                if (!empty($value['item'])) {
                    $html .= '<option value="' . $value['item'] . '"> ' . $value['item'] . '</option>';
                }
            }

            return $html;
        }

        private function is_empty()
        {
            $is_empty = true;

            if (!isset($this->items) || empty($this->items)) {
                return $is_empty;
            }

            $is_pros_empty = (!isset($this->items['pros']) || empty($this->items['pros']));
            $is_cons_empty = (!isset($this->items['cons']) || empty($this->items['cons']));

            // Either should be NOT EMPTY
            if (!$is_pros_empty || !$is_cons_empty) {
                $is_empty = false;
            }

            return $is_empty;
        }
    } // END CLASS
}
