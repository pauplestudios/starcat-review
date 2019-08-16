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

		public function get_html() 
		{
			$this->limit = ($this->props['collection']['value_type'] == 'percentage') ? 100 : $this->props['collection']['value_limit'];

			$html = "<div class='hrp-container'>";			
			$html .= "<ul class='hrp-review-list'>";
			$stats_html = '';
			$get_user_review_html = '';
			
			foreach ($this->props['items'] as $key => $value) {
				$stats_cumulative_score += $value;
				$number_value = $this->get_value_byType($value);
				
				if ($this->is_stat_included($key, $this->props['collection'])) {
					$stats_html .= $this->get_single_stat($key, $value, $number_value);
				}
				
				$count++;
			}
			
			$overall_stat_html = $this->get_overall_stat_html($stats_cumulative_score, $count);

			// if ($this->props['collection']['show_user_review']) {
			// 	$get_user_review_html = $this->get_user_review();
			// }

			$html .= $overall_stat_html . $stats_html;
			$html .= "</ul></div>";

			$this->html = $html;
			return $this->html;
		}

		protected function get_value_byType($value) 
		{			
			$divisor = 100 / $this->limit;
			$number = $value / $divisor;
            return $number;
		}

		protected function get_overall_stat_html($stats_cumulative_score, $count) {

			$overall_stat_value = round($stats_cumulative_score / $count);	
			$overall_number_value = $this->get_value_byType($overall_stat_value);		
			$overall_stat_html = $this->get_single_stat(__('overall', 'helpie-reviews'), $overall_stat_value, $overall_number_value);

			return $overall_stat_html;
		}

		protected function get_single_stat($key, $value, $number_value) {

			$html = '';

			if (!$this->is_stat_included($key, $this->props['collection'])) {
				return $html;
			}

			$html .= '<li class="single-progress-review">';
			$html .= '<span class="single-progress-review__label">'.$key.' - '.$number_value.'/'.$this->limit.'</span>';
			$html .= '<div class="single-progress-review__wrapper">';
				$html .= '<div class="single-progress-review__results" data-valuenow="'.$value.'" style = "width: 0%"></div>';
				$html .= '<div class="single-progress-review__text">'.$number_value.' / '.$this->limit.'</div>';
			$html .= '</div>';
			$html .= '</li>';


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