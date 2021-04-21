<?php
class WhoCanReviewCest
{
    public function _before(AcceptanceTester $I)
    {
        $I->loginAsAdmin();
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated('starcat-review');
    }

    public function showReviewForLoggedInUsers(AcceptanceTester $I)
    {
        // create review page
        $this->create_page($I);
        $this->review_settings($I, 'logged_in');

        $I->amOnPage('/car-reviews');
        $I->see('This car is great');

        // loggedIn User can see the review form
        $I->see('Leave a Review');
        $I->seeElement('.scr-user-review');
        $I->see('Submit');

        // logout the current user session
        $I->logOut();

        // Non Logged-in User Can't see the review form
        $I->amOnPage('/car-reviews');

        // TODO Create new issue for validating same class names
        $I->dontSeeElement('.scr-user-review.active');

    }

    public function showReviewForEveryone(AcceptanceTester $I)
    {
        // create review page
        $this->create_page($I);
        $this->review_settings($I, 'everyone');

        $I->amOnPage('/car-reviews');
        $I->see('This car is great');

        // loggedIn User can see the review form
        $I->see('Leave a Review');
        $I->seeElement('form.scr-user-review');
        $I->see('Submit');
        // logout the current user session
        $I->logOut();
        // non-logged in user can see the review form
        $I->amOnPage('/car-reviews');
        $I->seeElement('form.scr-user-review');

    }

    private function review_settings($I, $who_can_review)
    {
        $options = [
            /** TODO: use - 'user_review_enabled_post_types' since - v0.7.6  */
            // 'review_enable_post-types' => ['post', 'page'],
            'user_review_enabled_post_types' => ['post', 'page'],

            'ur_who_can_review' => $who_can_review,
            'enable_user_reviews' => true,
        ];

        $I->haveOptionInDatabase('scr_options', $options);
    }

    private function create_page($I)
    {
        $post_id = $I->havePostInDatabase([
            'post_type' => 'post',
            'post_title' => 'Car Reviews',
            'post_name' => 'car-reviews',
            'post_status' => 'publish',
            'post_content' => 'This car is great!',

        ]);
        $this->set_post_level_settings($I, $post_id);
        return $post_id;
    }

    protected function set_post_level_settings($I, $post_id)
    {
        $I->havePostMetaInDatabase($post_id, '_scr_post_options', array(
            'post_author_review_settings' => array(
                'can_show_author_review' => 'apply_global_settings',
                'custom_location' => 0,
                'location' => 'after',
            ),
            'post_user_review_settings' => array(
                'can_show_user_review' => 'apply_global_settings',
                'custom_location' => 0,
                'location' => 'after',
            ),
        ));
    }
}