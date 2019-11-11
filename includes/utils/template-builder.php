<?php

namespace StarcatReview\Includes\Utils;

if (!class_exists('\StarcatReview\Includes\Utils\Template_Builder')) {
    class Template_Builder
    {

        private $sidebar_template_style;
        private $template_name;

        public function __construct($content)
        {
            // $this->settings = new \Helpie\Includes\Settings\Getters\Settings();

            // Set Props
            $this->template_name = 'mainpage_template';
            $this->sidebar_template_style = 'full-width';
            // $this->sidebar_template_style = $this->settings->main_page->get_sidebar_template();
            $this->content = $content;
        }

        public function get_html()
        {
            // Fix for Divi Theme Header not shrinking
            $id = 'main-content';

            $html = "<div id='" . $id . "' class='helpie-primary-view " . $this->sidebar_template_style . "'><div id='helpiekb-main-wrapper' class='wrapper'>";
            if ($this->sidebar_template_style == 'left-sidebar') {
                $html .= $this->get_sidebar('left');
                $html .= $this->get_content();
            } elseif ($this->sidebar_template_style == 'right-sidebar') {
                $html .= $this->get_content();
                $html .= $this->get_sidebar('right');
            } elseif ($this->sidebar_template_style == 'both-side-sidebars') {
                $html .= $this->get_sidebar('left', 'both');
                $html .= $this->get_content();
                $html .= $this->get_sidebar('right', 'both');
            } elseif ($this->sidebar_template_style == 'full-width' || $this->sidebar_template_style == 'boxed-width') {
                $html .= $this->get_content();
            }

            return $html;
        }

        public function get_content()
        {
            // return $this->get_have_access_content();
            return "Content: " . $this->content;
        }

        public function get_sidebar($position, $sidebar_count = 'single')
        {
            // $args = array(
            //     'position' => $position,
            //     'template' => $this->template_name,
            //     'count' => $sidebar_count,
            // );

            // $sidebar_controller = new \Helpie\Features\Components\Sidebar\Sidebar_Controller();
            // $sidebar = $sidebar_controller->get_sidebar($args);

            // return $sidebar;

            return "Sidebar";
        }
    }
}