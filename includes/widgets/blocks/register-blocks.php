<?php

namespace HelpieFaq\Includes\Widgets\Blocks;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieFaq\Includes\Widgets\Blocks\Register_Blocks')) {
    class Register_Blocks
    {
        public function __construct($fields, $style_config)
        {
            // error_log('load fields: ' . print_r($fields, true) );
            $this->fields = $fields;
            $this->fields['style'] = array();
            $this->style_config = $style_config;
            $this->get_element_config($style_config);
        }

        public function get_element_config($style_config)
        {

            foreach ($style_config as $key => $element) {
                # code...
                $name = $element['name'];

                // $styleProps = $element['styleProps'];

                if (isset($element['styleProps'])) {
                    $this->fields['style'][$name] = $element;
                }

                if (isset($element['children'])) {
                    $this->get_element_config($element['children']);
                }
            }
        }
        public function load()
        {

            /* Editor only assets */
            add_action('enqueue_block_editor_assets', array($this, 'helpie_faq_block'));

            /* For both frontend and editor */
            add_action('enqueue_block_assets', array($this, 'helpie_faq_block_assets'));

            register_block_type('starcat-review/starcat-review', array(
                'attributes' => $this->fields,
                'render_callback' => array($this, 'render'),
            ));
        }

        public function helpie_faq_block_assets()
        {
            // error_log('helpie_faq_block_assets');
            wp_enqueue_style(
                'starcat-review/starcat-review',
                HELPIE_FAQ_URL . 'assets/main.bundle.css',
                array('wp-edit-blocks')
            );
        }

        public function helpie_faq_block()
        {
            wp_enqueue_script(
                'starcat-review/starcat-review', // Unique handle.
                HELPIE_FAQ_URL . 'assets/block.bundle.js', // block js
                array('wp-blocks', 'wp-components', 'wp-i18n', 'wp-element', 'wp-editor'), // Dependencies, defined above.
                filemtime(HELPIE_FAQ_PATH . 'assets/block.bundle.js') // filemtime — Gets file modification time.
            );
            wp_localize_script('starcat-review/starcat-review', 'BlockFields', $this->fields);
        }

        public function render($attributes)
        {
            if (!isset($attributes['id'])) {
                $attributes['id'] = uniqid('starcat-review-');
            }


            $faq = new \HelpieFaq\Features\Faq\Faq();

            $style = '';
            if (isset($attributes['style'])) {
                $style = $this->get_block_styles($attributes);
            }

            // error_log($style);
            $view_html =  $faq->get_view($attributes);

            return $style . $view_html;
        }

        public function get_block_styles($attributes)
        {
            $id = $attributes['id'];
            $block_style  = $attributes['style'];
            $style  = '<style>';
            $style .= $this->get_style($block_style, $this->style_config, $id);
            $style .= '</style>';
            return $style;
        }

        public function get_style($block_style, $style_config, $id)
        {
            $style = '';

            foreach ($style_config as $key => $config) {
                $element_name =  $config['name'];

                if (isset($block_style[$element_name])) {
                    $style .= "#" . $id . $config['selector'] . " { ";
                    /* Loop through each style attribute */
                    foreach ($block_style[$element_name] as $key1 => $value) {
                        $style .= $key1 . " : " . $value . ";";
                    }
                    $style .= " } ";
                }

                if (isset($config['children'])) {
                    $style .= $this->get_style($block_style, $config['children'], $id);
                }
            }
            return $style;
        }
    } // END CLASS
}
