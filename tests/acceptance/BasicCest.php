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
        $I->click("Remind me later");
        $I->click("Update WordPress Database");
        /* End Conditional */

        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated('starcat-review');
    }
}