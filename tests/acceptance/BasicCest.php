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

    private function updateDatabase($I)
    {
        $I->amOnAdminPage('/upgrade.php?_wp_http_referer=%2Fwp-admin%2F');
        $I->see('Database Update Required');
        $I->click('.button-primary');
        $I->see('Update Complete');
        $I->click('Continue');
    }

    public function websiteLoads(\AcceptanceTester $I)
    {
        $I->loginAsAdmin();
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

        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->seeElement('.error.scr-error.scr-missing-parent');

        // 2. When Parent plugin is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

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

        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->seeElement('.error.scr-error.scr-missing-parent');

        // 2. When Parent plugin is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');

        /* Check Available Menus */
        $I->see('Comparison Table');
    }

    public function woocommerceNotficationAddonActivation(\AcceptanceTester $I)
    {
        $data_slug = 'starcat-review-woocommerce-notfication-addon';
        $I->loginAsAdmin();

        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->seeElement('.error.scr-error.scr-missing-parent');

        // 2. When Parent plugin is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');

        /* Check Available Menus */
        $I->see('Woocommerce Notification');
    }

    public function photoReviewsAddonActivation(\AcceptanceTester $I)
    {
        $data_slug = 'starcat-review-photo-reviews-addon';
        $I->loginAsAdmin();

        // 1. When Parent plugin is deactivated
        $I->amOnPluginsPage();
        $I->deactivatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginDeactivated('starcat-review');
        $I->activatePlugin($data_slug);
        $I->seeElement('.error.scr-error.scr-missing-parent');

        // 2. When Parent plugin is activated
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->activatePlugin($data_slug);
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated($data_slug);

        /* Settings Page */
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');

        /* Check Available Menus */
        $I->see('Photo Reviews');
    }
}
