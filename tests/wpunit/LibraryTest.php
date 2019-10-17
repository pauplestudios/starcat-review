<?php

class LibraryTest extends \Codeception\TestCase\WPTestCase
{

    public function test_upgrader()
    {
        $library_path = STARCAT_REVIEW_PATH . 'includes/lib/';
        require_once $library_path . 'upgrader/UpgraderTest.php';
        $upgrader_test  = new UpgraderTest();
        $upgrader_test->test_upgrader_dummy($this);

        /* Test 2 */
        $upgrader_list = new \HelpieReviews\Includes\Upgrades_List();
        $upgrader_test->test_init($this, $upgrader_list);
    }
} // END TEST CLASS
