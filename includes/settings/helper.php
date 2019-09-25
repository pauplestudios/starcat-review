<?php


if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('CSF_Field_icon_dropdown')) {
    class CSF_Field_icon_dropdown extends \CSF_Fields
    {
        public function __construct($field, $value = '', $unique = '', $where = '', $parent = '')
        {
            parent::__construct($field, $value, $unique, $where, $parent);
        }

        public function render()
        {
            echo $this->field_before();

            echo $this->get_icon_dropdown_html();

            echo $this->field_after();
        }

        protected function get_icon_dropdown_html()
        {
            $html = '<div class="ui selection dropdown hrp-dropdown">';
            $html .= '<input type="hidden" name="' . $this->field_name() . '" value="' . $this->value . '" ' . $this->field_attributes() . '>';
            $html .= '<i class="dropdown icon"></i>';
            $html .= '<div class="default text">Select Icon</div>';

            $html .= '<div class="menu">';

            $html .= '<div class="item" data-value="star">';
            $html .= '<i class="ui orange star icon"></i>';
            $html .= 'Star';
            $html .= '</div>';

            $html .= '<div class="item" data-value="heart">';
            $html .= '<i class="ui red heart icon" > </i>';
            $html .= 'Heart';
            $html .= '</div>';

            $html .= '<div class="item" data-value="square">';
            $html .= '<i class="ui grey square icon" > </i>';
            $html .= 'Square';
            $html .= '</div>';

            $html .= '<div class="item" data-value="circle">';
            $html .= '<i class="ui teal circle icon" > </i>';
            $html .= 'Circle';
            $html .= '</div>';

            $html .= '</div>';

            $html .= '</div>';

            return $html;
        }
    }
}

if (!function_exists('csf_validate_stat_limit')) {

    function csf_validate_stat_numeric($value)
    {
        if (!is_numeric($value)) {
            return esc_html__('Please giva a numeric limit !', 'csf');
        }

        if ($value > 100 || $value < 1) {
            return esc_html__('Please giva a value between one to hundread ( 1 to 100 ) limit !', 'csf');
        }

        if (!ctype_digit($value)) {
            return esc_html__('Please giva a rounded value limit !', 'csf');
        }
    }
}
