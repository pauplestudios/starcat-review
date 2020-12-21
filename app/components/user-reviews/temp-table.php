<?php

if (!class_exists('WP_List_Table')) {
    require_once ABSPATH . 'wp-admin/includes/class-wp-list-table.php';
}

use StarcatReview\Includes\Settings\SCR_Getter;

class UR_Comments_List_Table_Controller{
    
    // class instance
    static $instance;

    // user_review WP_List_Table object
    public $ur_table;

    // class constructor
    public function __construct()
    {
        add_filter('set-screen-option', [__CLASS__, 'set_screen'], 10, 3);
        add_action('admin_menu', [$this, 'plugin_menu']);
    }

    /** Singleton instance */
    public static function get_instance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public static function set_screen($status, $option, $value)
    {
        return $value;
    }

    public function plugin_menu()
    {

        $hook = add_menu_page(
            __('User Reviews', SCR_DOMAIN),
            __('User Reviews', SCR_DOMAIN) . ' ' . $this->get_review_pending_count_html(),
            'read',
            'scr-reviews-comment',
            [$this, 'plugin_settings_page'],
            'dashicons-format-status',
            '35'
        );

        add_action("load-$hook", [$this, 'screen_option']);
    }

     /**
     * Plugin settings page
     */
    public function plugin_settings_page()
    {

        // query, filter, and sort the data
        $this->ur_table->prepare_items();
    

        $html = '<div class="wrap reviews-comment-wrap">';
        $html .= '<h1 class="wp-heading-inline"> ' . __("User Reviews", SCR_DOMAIN) . '</h1>';
        $html .= '<hr class="wp-header-end">';
        $html .= '<form id="scr-user-comments-form" method="get">';
        
        ob_start();
        $html .= ob_get_contents();
        ob_end_clean();
        
        $html .= '</form>';
        $html .= '</div>';

        echo $html;
    }

    /**
     * Screen options
     */
    public function screen_option()
    {

        $option = 'per_page';

        $args = [
            'label' => __("Number of items per page:", SCR_DOMAIN),
            'default' => 5,
            'option' => 'user_reviews_per_page',
        ];

        add_screen_option($option, $args);

        $this->ur_table = new UR_List_Table();
    }

    /**
     * Get Pending User Reviews Pending Count
     */
    protected function get_review_pending_count_html()
    {
        $count = $this->get_review_pending_count();
        $html = '';
        if ($count !== 0) {
            $html .= '<span class="awaiting-mod count-1">';
            $html .= '<span class="pending-count" aria-hidden="true">';
            $html .= $count;
            $html .= '</span>';
            $html .= '</span>';
        }

        return $html;
    }

    protected function get_review_pending_count()
    {
        global $wpdb;
        $count = 0;
        $where = $wpdb->prepare('WHERE comment_type IN (%s, %s)', 'review', 'starcat_review');
        $pending = $wpdb->get_results("SELECT comment_post_ID, COUNT(comment_ID) as num_comments FROM $wpdb->comments {$where} AND comment_approved = '0'", ARRAY_A);

        if (!empty($pending)) {
            $count = absint($pending[0]['num_comments']);
        }

        return $count;
    }

}

add_action('plugins_loaded', function () {
    UR_Comments_List_Table_Controller::get_instance();
});



class UR_List_Table extends WP_List_Table
{
    public $checkbox = true;

    public $pending_count = array();

    public $extra_items;

    private $user_can;

    private $comments_of_stats = array();

    private $stat_args;

    /**
     * Constructor.
     *
     * @since 3.1.0
     *
     * @see WP_List_Table::__construct() for more information on default arguments.
     *
     * @global int $post_id
     *
     * @param array $args An associative array of arguments.
     */
    public function __construct($args = array())
    {
        global $post_id;

        $post_id = isset($_REQUEST['p']) ? absint($_REQUEST['p']) : 0;

        if (get_option('show_avatars')) {
            add_filter('comment_author', array($this, 'floated_admin_avatar'), 10, 2);
        }

        parent::__construct(
            array(
                'plural' => 'comments',
                'singular' => 'comment',
                'ajax' => true,
                'screen' => isset($args['screen']) ? $args['screen'] : null,
            )
        );

        $this->comments_of_stats = scr_get_comments_args(['stats']);
        $this->stat_args = SCR_Getter::get_stat_default_args();
    }

    public function floated_admin_avatar($name, $comment_ID)
    {
        $comment = get_comment($comment_ID);
        $avatar = get_avatar($comment->user_id, 32);
        return "$avatar $name";
    }

    /**
     * @return bool
     */
    public function ajax_user_can()
    {
        return current_user_can('edit_posts');
    }

    /**
     * @global int    $post_id
     * @global string $comment_status
     * @global string $search
     * @global string $comment_type
     */
    public function prepare_items()
    {
        // check if a search was performed.
        $user_search_key = isset( $_REQUEST['s'] ) ? wp_unslash( trim( $_REQUEST['s'] ) ) : '';
	
    }

}
?>