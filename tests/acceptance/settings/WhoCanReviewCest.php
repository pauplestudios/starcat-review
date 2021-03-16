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

    public function loggedInUsersCanSeeReviewForm(AcceptanceTester $I)
    {
        $this->create_page($I);
        $this->review_settings($I, 'logged_in');

        $I->amOnPage('/car-reviews');
        $I->see('This car is great');

        $I->see('Leave a Review');
        $I->seeElement('form.scr-user-review');
        $I->see('Submit');
        $I->logOut();

        $I->amOnPage('/car-reviews');
        $I->dontSeeElement('.scr-user-review.active');
    }

    public function nonLoggedInUsersCanSeeReviewForm(AcceptanceTester $I)
    {
        $this->create_page($I);
        $this->review_settings($I, 'everyone');

        $I->amOnPage('/car-reviews');
        $I->see('This car is great');

        $I->see('Leave a Review');
        $I->seeElement('form.scr-user-review');
        $I->see('Submit');

        $I->logOut();
        $I->amOnPage('/car-reviews');
        $I->seeElement('form.scr-user-review');

    }

    private function review_settings($I, $who_can_review)
    {
        $options = [
            'review_enable_post-types' => ['post', 'page'],
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
        return $post_id;
    }
}