<?php

namespace HelpieReviews\App\Abstracts;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Abstracts\Widget_Model')) {
    abstract class Widget_Model
    {
        public function __construct($fields_model)
        {
            $this->fields_model = $fields_model;
        }

        public function get_viewProps($args)
        {
            $args = $this->append_fallbacks($args);

            $viewProps = array(
                'collection' => $this->get_collection_props($args),
                'items' => $this->get_items_props($args),
            );

            // error_log('$viewProps : ' . print_r($viewProps, true));

            return $viewProps;
        }

        protected function append_fallbacks($args)
        {

            // Get Default Values from GET - FIELDS
            $args = $this->fields_model->get_default_args();

            return $args;
        }

        public function get_fields()
        {
            return $this->fields_model->get_fields();
        }

        public function get_style_config()
        {
            return $this->style_config->get_config();
        }
    } // END CLASS

}