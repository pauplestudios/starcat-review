<?php

namespace HelpieReviews\App\Views\Rating_Types;

use \HelpieReviews\App\Views\Rating_Types\Rating_Type as Rating_Type;

if (!defined('ABSPATH')) {
	exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Views\Rating_Types\Progress_Bar_Rating')) {
	class Progress_Bar_Rating extends Rating_Type{
		private $html;

		public function __construct($viewProps) 
		{
			$this->props = $viewProps; 			
		}

		public function get_html() {

			$html = "<div class='hrp-rating-collection hrp-container'>";
			$stats_html = '';
			$get_user_review_html = '';

			foreach ($this->props['items'] as $key => $value) {
				$stats_cumulative_score += $value;

				if ($this->is_stat_included($key)) {
					$stats_html .= $this->get_single_stat($value, $key);
				}

				$count++;
			}

			$overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

			// if ($this->props['collection']['user_review']) {
			// 	$get_user_review_html = $this->get_user_review();
			// }

			$html .= $overall_stat_html . $stats_html . $get_user_review_html;
			$html .= "</div>";

			$this->html = $html;
			return $this->html;
		}


		protected function get_overall_stat_html($stats_cumulative_score, $count) {

			$overall_stat_value = $stats_cumulative_score / $count;
			$overall_stat_html = $this->get_single_stat($overall_stat_value, __('Overall', 'helpie-reviews'));

			return $overall_stat_html;
		}

		protected function get_single_stat($value, $key) {

			$html = '';

			if (!$this->is_stat_included($key)) {
				return $html;
			}

			$html .= "<div class='single-rating'><div class='rating-label'>" . $key . "</div>";
			$html .= $this->get_progress($value);
			$html .= "</div>";

			return $html;
		}

		protected function get_progress($value = 0, $min = 0, $max = 100) {

			$html = '<div class="hrp-progress">
                <div class="hrp-progress-bar" role="progressbar" aria-valuenow="' . $value . '"
                aria-valuemin="' . $min . '" aria-valuemax="' . $max . '">' . $value . '%</div>
                </div>';

			return $html;
		}

		// protected function get_user_review($value = 10, $min = 0, $max = 100) {
		// 	$html = '<div class="hrp-rating-wrapper"><hr class="hrp-divider">';
		// 	$html .= '<div class="hrp-user-review__label">User Review</div>';
		// 	$html .= '<div class="hrp-user-review__rating">';
		// 	$html .= '<input type="range" min="' . $min . '" max="' . $max . '" value="' . $value . '" class="hrp-user-review__range">';
		// 	$html .= '</div><span class="hrp-user-review__value">' . $value . " / " . $max . "%" . '</span>';
		// 	$html .= '</div>';

		// 	return $html;
		// }
	}
}

// 1 to 10