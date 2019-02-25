<?php
/**
 * Class SampleTest
 *
 * @package Helpie
 */

/**
 * Sample test case.
 */

// require_once dirname( dirname( __FILE__ ) ).'/includes/user-capabilities.php';
class CoreTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * A single example test.
     */

    public function setUp()
    {
        parent::setUp();
    }

    public function tearDown()
    {
        parent::tearDown();
    }

    public function test_cpt()
    {
        // Replace this with some actual testing code.

        $this->assertTrue(true);
    }

    // function test_env(){
    //     // include_once( ABSPATH . 'wp-admin/includes/plugin.php' );
    //
    //     $as_plugin = 'awesome-support/awesome-support.php';
    //
    //     $this->assertTrue(is_plugin_active($as_plugin) );
    //     $this->assertTrue(class_exists('Awesome_Support') );
    //     $this->assertEquals("http://127.0.0.1:90/wp-content/themes/avada", get_template_directory_uri() );
    // }

    public function test_create_article()
    {
        $id = wp_insert_post(array('post_title' => 'Test Create Article', 'post_type' => 'pauple_helpie', 'post_content' => 'Test CPT text'));
        $this->assertInternalType("int", $id);
    }

    public function create_new_user()
    {
        $username = 'subman';
        $password = 'subpass';
        $email = 'submail@pauple.com';
        $userdata = array('role' => 'editor');

        wp_create_user($username, $password, $email);
        wp_update_user($userdata);
    }

}
