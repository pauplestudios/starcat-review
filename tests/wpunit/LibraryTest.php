<?php

class LibraryTest extends \Codeception\TestCase\WPTestCase
{

    public function test_upgrader()
    {
        $library_path = HELPIE_REVIEWS_PATH . 'includes/lib/';
        require_once $library_path . 'upgrader/UpgraderTest.php';
        $upgrader_test  = new UpgraderTest();
        $upgrader_test->test_upgrader_dummy($this);
    }
} // END TEST CLASS