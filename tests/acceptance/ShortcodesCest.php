<?php
class ShortcodeCest
{
    public function _before(AcceptanceTester $I)
    {
        // will be executed at the beginning of each test
        // $I->loginAsAdmin();
        // $I->am('administrator');
        // $I->amOnPluginsPage();
        // $I->activatePlugin(['woocommerce']);
        // $I->seePluginActivated('woocommerce');
    }

    public function test_user_review_overview_shortcode(AcceptanceTester $I)
    {
        $content = '[starcat_review_overall_user_review]';
        $post_ids = $this->insert_post($I);
    }

    public function test_user_review_list_shortcode(AcceptanceTester $I)
    {
        $content = '[starcat_review_user_review_list]';
        $post_ids = $this->insert_post($I);
    }

    public function test_user_review_form_shortcode(AcceptanceTester $I)
    {
        $content = '[starcat_review_user_review_form]';
        $post_ids = $this->insert_shortcode_post($I, $content);
    }

    public function test_review_summary_shortcode(AcceptanceTester $I)
    {
        $content = '[starcat_review_summary]';
        $post_ids = $this->insert_shortcode_post($I, $content);
    }

    protected function insert_shortcode_post($I, $post_content)
    {

        $shortcode_post_id = $I->havePostInDatabase(
            [
                'post_name' => 'Starcat Reviews - Overall User Reviews Shortcode',
                'post_type' => 'page',
                'post_title' => 'Starcat Reviews - Overall User Reviews Shortcode',
                'post_content' => '[starcat_review_overall_user_review]',
                'post_status' => 'publish',
            ]
        );

        return $shortcode_post_id;
    }
    
    protected function insert_post($I)
    {
        
        $post_ids = [];

        $post_ids[] = $I->havePostInDatabase([
            'post_type' => 'post',
            'post_title' => 'Car Reviews',
            'post_status' => 'publish',
            'post_content' => 'This car is great!',

        ]);





        return $post_ids;
    }

}
