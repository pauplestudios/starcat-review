<?php

namespace HelpieReviews\App\Widgets\Stats;

if (!defined('ABSPATH')) {
	exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Widgets\Stats\View')) {
	class View {
		private $html;

		public function __construct($stats) {
			$this->model = $stats;
			$this->rating_type = new \HelpieReviews\App\Views\Rating_Types\Rating_Type($this->model);		
			
		}

		public function get_html() {

			if ($this->is_empty()) {
				return '';
			}

			$html = $this->rating_type->get_stat($this->model);

			$this->html = $html;
			return $this->html;
		}

		/* PRIVATE CLASS */

		private function is_empty() {

			if (isset($this->model) && !empty($this->model)) {
				return false;
			}

			return true;
		}
	} // END CLASS
}