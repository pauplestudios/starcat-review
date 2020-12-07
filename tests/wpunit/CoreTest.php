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

    public function setUp(): void
    {
        parent::setUp();
    }

    public function tearDown(): void
    {
        parent::tearDown();
    }

    public function test_cpt()
    {
        // Replace this with some actual testing code.
        $this->assertTrue(true);
    }

    public function test_create_article()
    {
        $id = wp_insert_post(array('post_title' => 'Test Create Article', 'post_type' => 'pauple_helpie', 'post_content' => 'Test CPT text'));
        $this->assertIsInt($id);
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
