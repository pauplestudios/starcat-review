<?php

namespace HelpieReviews\App\Repositories;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\HelpieReviews\App\Repositories\User_Reviews_Repo')) {
    class User_Reviews_Repo
    {
        public function get()
        { }

        public function insert()
        {
            error_log('User_Reviews_Repo->insert()');
            $time = current_time('mysql');

            $data = array(
                'comment_post_ID' => 1,
                'comment_author' => 'admin',
                'comment_author_email' => 'admin@admin.com',
                'comment_author_url' => 'http://',
                'comment_content' => 'content here',
                'comment_type' => '',
                'comment_parent' => 0,
                'user_id' => 1,
                'comment_author_IP' => '127.0.0.1',
                'comment_agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 3.5.30729)',
                'comment_date' => $time,
                'comment_approved' => 1,
            );

            wp_insert_comment($data);
        }

        public function update()
        { }
    } // END CLASS
}