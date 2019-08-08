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
			// $this->star_rating = new \HelpieReviews\App\Views\Rating_Types\Star_Rating($this->model);
			// $this->progress_bar_rating = new \HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating($this->model);
			$this->image_rating = new \HelpieReviews\App\Views\Rating_Types\Image_Rating($this->model);
			// error_log('$stats : ' . print_r($stats, true));
		}

		public function get_html() {

			if ($this->is_empty()) {
				return '';
			}

			// $html = $this->star_rating->get_html();
			// $html = $this->progress_bar_rating->get_html();
			$html = $this->image_rating->get_html();

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