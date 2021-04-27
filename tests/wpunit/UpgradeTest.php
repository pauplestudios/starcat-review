<?php

class UpgradeTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * @var \WpunitTester
     */
    protected $tester;

    public function setUp(): void
    {
        // Before...
        parent::setUp();

        // Your set up methods here.
    }

    public function tearDown(): void
    {
        // Your tear down methods here.

        // Then...
        parent::tearDown();
    }

    // Tests
    public function test_v076_migration()
    {
        $option_name = 'scr_options';
        $options = get_option($option_name);
        $options['enable-author-review'] = 1;
        $options['review_enable_post-types'] = array('post', 'page', 'product');
        update_option($option_name, $options);

        $upgrade_list = new \StarcatReview\Includes\Update\Upgrades_List();
        $upgraded = $upgrade_list->upgrade_v076();
        $this->assertTrue($upgraded);
    }

}