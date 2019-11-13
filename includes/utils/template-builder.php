<?php

namespace StarcatReview\Includes\Utils;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!class_exists('\StarcatReview\Includes\Utils\Template_Builder')) {
    class Template_Builder
    {

        private $template_sidebar_style;
        private $template_name;

        public function __construct($content, $template_name)
        {
            // Set Props
            $template_settings = $this->get_template_settings($template_name);
            $this->template_sidebar_style = $template_settings['template_sidebar_style'];
            $this->content = $content;

            // error_log('$template_name : ' . $template_name);
            // error_log('$template_settings : ' . print_r($template_settings, true));
        }

        public function get_template_settings($template_name)
        {
            /* settings getter */
            require_once(SCR_PATH . 'includes/settings/getter.php');

            if ($template_name == 'main_page') {

                $template_settings = [
                    'template_sidebar_style' => SCR_Getter::get('mp_template_layout'),
                ];
            } else if ($template_name == 'category_page') {
                $template_settings = [
                    'template_sidebar_style' => SCR_Getter::get('cp_template_layout'),
                ];
            } else {

                $template_settings = [
                    'template_sidebar_style' => SCR_Getter::get('sp_template_layout'),
                ];
            }

            return $template_settings;
        }

        public function get_html()
        {
            // Fix for Divi Theme Header not shrinking
            $id = 'main-content';

            $html = "<div class='scr-container scr-" . $this->template_sidebar_style . "  id='" . $id . "' >";

            $breadcrumb = new \StarcatReview\App\Components\Breadcrumbs\Controller();
            $html .= $breadcrumb->get_view();

            if ($this->template_sidebar_style == 'left-sidebar') {
                $html .= $this->get_sidebar('left');
                $html .= $this->get_content();
            } elseif ($this->template_sidebar_style == 'right-sidebar') {

                $html .= $this->get_content();
                $html .= $this->get_sidebar('right');
            } elseif ($this->template_sidebar_style == 'both-side-sidebars') {
                $html .= $this->get_sidebar('left', 'both');
                $html .= $this->get_content();
                $html .= $this->get_sidebar('right', 'both');
            } elseif ($this->template_sidebar_style == 'full-width' || $this->template_sidebar_style == 'boxed-width') {
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