<?php

namespace acceptance;

class BasicCest
{


    public function _before(\AcceptanceTester $I)
    {
    }

    public function _after(\AcceptanceTester $I)
    {
    }

    public function websiteLoads(\AcceptanceTester $I)
    {
        $I->loginAsAdmin();

        /* Start Conditional */
        // $I->click("Remind me later");
        // $I->click("Update WordPress Database");
        /* End Conditional */

        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated('starcat-review');
    }

    public function cptAddonActivation(\AcceptanceTester $I)
    {
        $I->loginAsAdmin();

        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review-cpt-addon');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated('starcat-review-cpt-addon');

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');
        $I->see('Main Page');
        $I->see('Category Page');
        $I->see('Single Page');
    }

    public function comparisonTableAddonActivation(\AcceptanceTester $I)
    {
        $data_slug = 'starcat-review-comparison-table-addon';
        $I->loginAsAdmin();

        $I->amOnPluginsPage();
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');
        $I->see('Where to include reviews?');
    }
}