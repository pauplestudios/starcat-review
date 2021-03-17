<?php
class EnableOrDisableUserReviewsCest
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

    public function EnableAndDisableUserReviews(AcceptanceTester $I)
    {
        // create new post
        $review_post_id = $this->insert_post($I);
        // enable the user reviews in starcat settings
        $this->user_review_settings($I, true);
        // add user review
        $this->insert_user_review($I, $review_post_id);

        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // checking major elements
        $I->seeElement('.scr_user_reviews');
        $I->seeElement('form.scr-user-review');

        // disable the user reviews in starcat settings
        $this->user_review_settings($I, false);
        $I->amOnPage('/car-reviews');

        $I->dontSeeElement('.scr_user_reviews');
        $I->dontSeeElement('form.scr-user-review');

    }

    private function user_review_settings($I, $enable_user_reviews)
    {
        $options = [
            'review_enable_post-types' => ['post'],
            'enable_user_reviews' => $enable_user_reviews,
            'is_enable_prosandcons' => true,
        ];

        $I->haveOptionInDatabase('scr_options', $options);
    }

    private function insert_user_review($I, $review_post_id)
    {
        $reviewProp = array(
            'post_id' => $review_post_id,
            'title' => 'I love this car',
            'description' => 'This is my first car ever and it was amazing!',
            'pros' => array(
                0 => array(
                    'item' => 'This Car is fast',
                ),
            ),
            'cons' => array(
                0 => array(
                    'item' => 'This Car is too expensive',
                ),
            ),
            'rating' => 90.0,
            'stats' => array(
                'feature' => array(
                    'stat_name' => 'feature',
                    'rating' => '90',
                ),
            ),
            'comment_id' => '2',
            'votes' => array(),
        );

        $comment_id = $I->haveCommentInDatabase($review_post_id, ['comment_content' => $reviewProp['description'], 'comment_type' => 'review']);

        $I->haveCommentMetaInDatabase($comment_id, 'scr_user_review_props', $reviewProp);
    }

    protected function insert_post($I)
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