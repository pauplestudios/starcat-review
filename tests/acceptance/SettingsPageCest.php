<?php
class SettingsPageCest
{
    function _before(AcceptanceTester $I)
    {
        // will be executed at the beginning of each test
        $I->loginAsAdmin();
        $I->am('administrator');
    }

    function add_plugin_admin_menu(AcceptanceTester $I)
    {
        $I->wantTo('access to the plugin settings page as admin');
        $I->amOnPage('/wp-admin/admin.php?page=scr-settings#tab=1');
        $I->see('Where to include reviews?');

        /* Check Available Menus */
        $I->see('General Settings');
        $I->see('User Review');

        /* Check Addon Menus */
        $I->dontSee('Main Page');
        $I->dontSee('Category Page');
        $I->dontSee('Single Page');
    }

    // function add_action_link(AcceptanceTester $I)
    // {
    //     $I->wantTo('check plugin list page if include mine');
    //     $I->amOnPluginsPage();
    //     $I->see('LeasePress', 'tr.active[data-plugin="leasepress/leasepress.php"] td strong');
    // }
}