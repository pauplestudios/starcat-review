<?php
class WCVerifiedOwnersCest
{
    public function _before(AcceptanceTester $I)
    {
        // will be executed at the beginning of each test
        $I->loginAsAdmin();
        $I->am('administrator');
        $I->amOnPluginsPage();
        $I->activatePlugin(['woocommerce']);
        $I->seePluginActivated('woocommerce');
        // $I->activatePlugin(['hello-dolly','woocommerce']);
    }

    public function isVerfiedOwner(AcceptanceTester $I)
    {
        $product = $I->WC_Helper_Product::create_simple_product();

        // create product

        // register customer
        // order the created product
        // review the product
    }

}
