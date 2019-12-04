<?php

if (!class_exists('WP_List_Table')) {
    require_once ABSPATH . 'wp-admin/includes/class-wp-list-table.php';
}

class User_Reviews_List extends WP_List_Table
{
    public function __construct()
    {
        parent::__construct([
            'singular' => __('User Review', SCR_DOMAIN), //singular name of the listed records
            'plural' => __('User Reviews', SCR_DOMAIN), //plural name of the listed records
            'ajax' => false, //does this table support ajax?
        ]);
    }

    public static function get_user_reviews($per_page = 20, $page_number = 1)
    {

        global $wpdb;

        $sql = "SELECT * FROM {$wpdb->prefix}comments WHERE comment_type='starcat_review'";

        if (!empty($_REQUEST['orderby'])) {
            $sql .= ' ORDER BY ' . esc_sql($_REQUEST['orderby']);
            $sql .= !empty($_REQUEST['order']) ? ' ' . esc_sql($_REQUEST['order']) : ' ASC';
        }

        $sql .= " LIMIT $per_page";
        $sql .= ' OFFSET ' . ($page_number - 1) * $per_page;

        $result = $wpdb->get_results($sql, 'ARRAY_A');

        return $result;
    }

    /**
     * Delete a user_review record.
     *
     * @param int $id user_review ID
     */
    public static function delete_user_review($id)
    {
        global $wpdb;

        $wpdb->delete(
            "{$wpdb->prefix}user_reviews",
            ['ID' => $id],
            ['%d']
        );
    }

    /**
     * Returns the count of records in the database.
     *
     * @return null|string
     */
    public static function record_count()
    {
        global $wpdb;

        $sql = "SELECT COUNT(*) FROM {$wpdb->prefix}comments WHERE comment_type='starcat_review'";

        return $wpdb->get_var($sql);
    }

    /** Text displayed when no user_review data is available */
    public function no_items()
    {
        echo __('No Reviews avaliable', SCR_DOMAIN);
    }

    /**
     * Render a column when no column specific method exist.
     *
     * @param array $item
     * @param string $column_name
     *
     * @return mixed
     */
    public function column_default($item, $column_name)
    {
        // error_log('item : ' . print_r($item, true));
        if ($item['comment_parent'] == 0) {
            $props = get_comment_meta($item['comment_ID'], 'scr_user_review_props', true);
            $title = $props['title'];
            $rating = $props['rating'];

            // $item['comment_content'] = 
            // $rating = 
        }
        switch ($column_name) {
            case 'author':
                return get_avatar($item['user_id'], 35) . ucfirst($item['comment_author']);
                break;
            case 'review':
                return $item['comment_content'];
                break;
            case 'rating':
                return (isset($rating)) ? $rating : '---';
                break;
            case 'in_response_to':
                return '<a href="' . get_the_permalink($item['comment_post_ID']) . '" target="_blank">' . get_the_title($item['comment_post_ID']) . '</a>';
                break;
            case 'submitted_on':
                return $item['comment_date'];
                break;
            default:
                return print_r($item, true); //Show the whole array for troubleshooting purposes
        }
    }

    /**
     * Render the bulk edit checkbox
     *
     * @param array $item
     *
     * @return string
     */
    public function column_cb($item)
    {
        return sprintf(
            '<input type="checkbox" name="bulk-delete[]" value="%s" />',
            $item['ID']
        );
    }

    /**
     * Method for name column
     *
     * @param array $item an array of DB data
     *
     * @return string
     */
    public function column_name($item)
    {

        $delete_nonce = wp_create_nonce('sp_delete_user_review');

        $title = '<strong>' . $item['name'] . '</strong>';

        $actions = [
            'delete' => sprintf('<a href="?page=%s&action=%s&user_review=%s&_wpnonce=%s">Delete</a>', esc_attr($_REQUEST['page']), 'delete', absint($item['ID']), $delete_nonce),
        ];

        return $title . $this->row_actions($actions);
    }

    /**
     *  Associative array of columns
     *
     * @return array
     */
    public function get_columns()
    {
        $columns = [
            'cb' => '<input type="checkbox" />',
            'author' => __('Author', SCR_DOMAIN),
            'review' => __('Review', SCR_DOMAIN),
            'rating' => __('Rating', SCR_DOMAIN),
            'in_response_to' => __('In Response To', SCR_DOMAIN),
            'submitted_on' => __('Submitted On', SCR_DOMAIN),
        ];

        return $columns;
    }

    /**
     * Columns to make sortable.
     *
     * @return array
     */
    public function get_sortable_columns()
    {
        $sortable_columns = array(
            'author' => array('author', true),
            'review' => array('review', false),
            'rating' => array('rating', true),
            'in_response_to' => array('in_response_to', true),
            'submitted_on' => array('author', false),
        );

        return $sortable_columns;
    }

    /**
     * Returns an associative array containing the bulk action
     *
     * @return array
     */
    public function get_bulk_actions()
    {
        $actions = [
            'bulk-delete' => 'Delete',
        ];

        return $actions;
    }

    /**
     * Handles data query and filter, sorting, and pagination.
     */
    public function prepare_items()
    {

        $this->_column_headers = $this->get_column_info();

        /** Process bulk action */
        $this->process_bulk_action();

        $per_page = $this->get_items_per_page('user_reviews_per_page', 20);
        $current_page = $this->get_pagenum();
        $total_items = self::record_count();

        $this->set_pagination_args([
            'total_items' => $total_items, //WE have to calculate the total number of items
            'per_page' => $per_page, //WE have to determine how many items to show on a page
        ]);

        $this->items = self::get_user_reviews($per_page, $current_page);
    }

    public function process_bulk_action()
    {

        //Detect when a bulk action is being triggered...
        if ('delete' === $this->current_action()) {

            // In our file that handles the request, verify the nonce.
            $nonce = esc_attr($_REQUEST['_wpnonce']);

            if (!wp_verify_nonce($nonce, 'sp_delete_user_review')) {
                die('Go get a life script kiddies');
            } else {
                self::delete_user_review(absint($_GET['user_review']));

                // esc_url_raw() is used to prevent converting ampersand in url to "#038;"
                // add_query_arg() return the current url
                wp_redirect(esc_url_raw(add_query_arg()));
                exit;
            }
        }

        // If the delete bulk action is triggered
        if ((isset($_POST['action']) && $_POST['action'] == 'bulk-delete')
            || (isset($_POST['action2']) && $_POST['action2'] == 'bulk-delete')
        ) {

            $delete_ids = esc_sql($_POST['bulk-delete']);

            // loop over the array of record IDs and delete them
            foreach ($delete_ids as $id) {
                self::delete_user_review($id);
            }

            // esc_url_raw() is used to prevent converting ampersand in url to "#038;"
            // add_query_arg() return the current url
            wp_redirect(esc_url_raw(add_query_arg()));
            exit;
        }
    }
}

class SP_Plugin
{

    // class instance
    static $instance;

    // user_review WP_List_Table object
    public $user_reviews_obj;

    // class constructor
    public function __construct()
    {
        add_filter('set-screen-option', [__CLASS__, 'set_screen'], 10, 3);
        add_action('admin_menu', [$this, 'plugin_menu']);
    }

    public static function set_screen($status, $option, $value)
    {
        return $value;
    }

    public function plugin_menu()
    {

        $hook = add_menu_page(
            'User Reviews',
            'User Reviews',
            'manage_options',
            'user-reviews-wp-list-table',
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
        $html = '<div class="wrap">';
        $html .= '<h1 class="wp-heading-inline">User Reviews Table List </h1>';
        $html .= '<hr class="wp-header-end">';

        $html .= '<div id="poststuff">';
        $html .= '<form method="post">';

        ob_start();
        $this->user_reviews_obj->prepare_items();
        $this->user_reviews_obj->display();
        $html .= ob_get_contents();
        ob_end_clean();

        $html .= '</form>';
        $html .= '</div>';
        $html .= '<br class="clear">';
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
            'label' => 'user_reviews',
            'default' => 5,
            'option' => 'user_reviews_per_page',
        ];

        add_screen_option($option, $args);

        $this->user_reviews_obj = new User_Reviews_List();
    }

    /** Singleton instance */
    public static function get_instance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }
}

add_action('plugins_loaded', function () {
    SP_Plugin::get_instance();
});
