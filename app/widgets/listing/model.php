<?php

namespace HelpieReviews\App\Widgets\Listing;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Listing\Model')) {
    class Model
    {
        public function get_viewProps($args)
        {
            $args = $this->append_fallbacks($args);

            $viewProps = array(
                'collection' => $this->get_collection_props($args),
                'items' => $this->get_items_props($args['articles']),
            );

            return $viewProps;
        }
    } // END CLASS
}