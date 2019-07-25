<?php

namespace HelpieReviews\App\Abstracts;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Abstracts\Widget_Model')) {
    abstract class Widget_Model
    {
        public function __construct()
        { }

        public function get_viewProps($args)
        {
            $args = $this->append_fallbacks($args);

            $viewProps = array(
                'collection' => $this->get_collection_props($args),
                'items' => $this->get_items_props($args),
            );

            return $viewProps;
        }

        protected function append_fallbacks($args)
        {

            // Get Default Values from GET - FIELDS
            $fields = $this->get_fields();
            foreach ($fields as $key => $field) {
                $args[$key] = !empty($args[$key]) ? $args[$key] : $field['default'];
            }
        }

        public function get_fields()
        {
            return $this->fields_model->get_fields();
        }
    } // END CLASS

}