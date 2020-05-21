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

    private function updateDatabase($I){
        $I->amOnAdminPage('/upgrade.php?_wp_http_referer=%2Fwp-admin%2F');
        $I->see('Database Update Required');
        $I->click('.button-primary');
        $I->see('Update Complete');
        $I->click('Continue');
    }

    public function websiteLoads(\AcceptanceTester $I)
    {
        // $this->updateDatabase($I);
        // $I->see('Username');
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
        $data_slug = 'starcat-review-cpt-addon';
        $I->loginAsAdmin();
        $I->loginAsAdmin();
        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->see('Starcat Review');
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);
        $I->seeElement('.error.src-error.missing-parent');

        // 2. When Parent is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        // $I->activatePlugin($data_slug); // TODO: This fails in Bitbucket Pipelines, find WHY. Maybe because its already active
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);
        $I->dontSeeElement('.error.src-error.missing-parent');

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');
        $I->see('Main Page');
        $I->see('Category Page');
        $I->see('Single Page');
    }

    public function comparisonTableAddonActivation(\AcceptanceTester $I)
    {
        $data_slug = 'starcat-review-comparison-table';
        $I->loginAsAdmin();

        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        // $I->seePluginActivated($data_slug);
        $I->seeElement('.error');
        
        // 2. When Parent plugin is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');
        $I->see('Where to include reviews?');

        /* Check Available Menus */
        $I->see('General Settings');
        $I->see('User Review');
    }
}