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
            $this->sidebar_template_style = 'right-sidebar';
            // $this->sidebar_template_style = $this->settings->main_page->get_sidebar_template();
            $this->content = $content;

            error_log('$this->content : ' . $this->content);
        }

        public function get_html()
        {
            // Fix for Divi Theme Header not shrinking
            $id = 'main-content';

            $html = "<div class='scr-container scr-" . $this->sidebar_template_style . "  id='" . $id . "' >";
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

            $html .= "</div>";

            return $html;
        }

        public function get_content()
        {
            // return $this->get_have_access_content();
            return $this->content;
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

            $html = "<div id='secondary'>";
            $html .= $this->get_reviews_sidebar();
            $html .= "</div>";

            return $html;
        }

        protected function get_reviews_sidebar($template = 'starcat_review_sidebar')
        {
            $html = '';
            ob_start();
            dynamic_sidebar($template);
            $sidebar = ob_get_contents();
            ob_end_clean();
            $html .= $sidebar;

            return $html;
        }
    } // END CLASS
}