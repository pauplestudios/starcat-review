<?php

namespace HelpieReviews\Includes\Settings;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Settings\Extras')) {
    class Extras
    {
        public function __construct()
        { }

        public function get_main_page_url($margin_left = 0)
        {
            $href = $this->get_mainpage_permalink();

            $html = "<a style='margin-left: " . $margin_left . "em;' target ='_blank' class='ui labeled icon small button' href=" . $href . ">";
            $html .= __("Visit Main Page", "pauple-helpie");
            $html .= "<i class='external alternate icon'></i>";
            $html .= "</a>";

            return $html;
        }

        public function get_mainpage_permalink()
        {

            // if ($this->mp_settings->get_mp_location() == 'archive') {
            return get_post_type_archive_link(HELPIE_REVIEWS_POST_TYPE);
            // } else {
            //     $post_id = $this->get_mp_selected_page();
            //     return get_permalink($post_id);
            // }
        }
    } // END CLASS
}