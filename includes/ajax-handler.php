<?php

namespace HelpieReviews\Includes;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\Includes\Ajax_Handler')) {
    class Ajax_Handler
    {
        public function search_posts()
        {

            if (isset($_GET['search'])) {
                $search_query = $_GET['search'];
                
                // Check the query variable is available
                // If not, global it so it can be read from
                if(!$wp_query) global $wp_query; 
                
                $query = array (
                    'the_title' => $search_query,
                    // 'the_content' => $search_query
                );
                
                $search_results = new WP_Query($query);

                // error_log("Results : " .print_r($search_results, true));
                echo json_encode( $search_results );
            }
            return 
        }
    }
}

$ajax_hanlder = new \HelpieReviews\Includes\Ajax_Handler();

add_action('wp_ajax_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']);
// add 'ajax' action when not logged in
add_action('wp_ajax_nopriv_helpiereview_search_posts', [$ajax_hanlder, 'search_posts']); 