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

    public function enableUserReviews(AcceptanceTester $I)
    {

        /**
         * Note : since v0.7.6 "enable_user_reviews" option not-used.
         * If would like to enable/disable the user-reviews need overwrite the post_meta option.
         */

        // create new post
        $post_name = 'enable-user-reviews';
        $review_post_id = $this->insert_post($I, $post_name);

        $this->set_post_level_settings($I, $review_post_id, true);
        // add user review
        $this->insert_user_review($I, $review_post_id);

        $I->amOnPage('/' . $post_name);
        $I->see('This Car is too expensive');

        // checking major elements
        $I->seeElement('.scr_user_reviews');
        $I->seeElement('form.scr-user-review');

    }

    public function disableUserReviews(AcceptanceTester $I)
    {
        $post_name = 'disable-user-reviews';
        $review_post_id = $this->insert_post($I, $post_name);

        // disable the user reviews in starcat settings
        $this->set_post_level_settings($I, $review_post_id, false);
        // add user review
        $this->insert_user_review($I, $review_post_id);

        $I->amOnPage('/' . $post_name);

        $I->dontSeeElement('.scr_user_reviews');
        $I->dontSeeElement('form.scr-user-review');

    }

    private function user_review_settings($I, $enable_user_reviews)
    {
        $options = [

            /** TODO: use - 'user_review_enabled_post_types' since - v0.7.6  */
            // 'review_enable_post-types' => ['post'],
            'user_review_enabled_post_types' => ['post'],
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

    protected function insert_post($I, $post_name)
    {
        $post_id = $I->havePostInDatabase([
            'post_type' => 'post',
            'post_title' => 'Car Reviews',
            'post_name' => $post_name,
            'post_status' => 'publish',
            'post_content' => 'This car is great!',
        ]);
        return $post_id;
    }

    protected function set_post_level_settings($I, $review_post_id, $can_show_user_review)
    {
        $can_show_user_review = ($can_show_user_review == true) ? 'show' : 'dont_show';

        $I->havePostMetaInDatabase($review_post_id, '_scr_post_options', array(
            'post_author_review_settings' => array(
                'can_show_author_review' => 'apply_global_settings',
                'custom_location' => 0,
                'location' => 'after',
            ),
            'post_user_review_settings' => array(
                'can_show_user_review' => $can_show_user_review,
                'custom_location' => 0,
                'location' => 'after',
            ),
        ));
    }
}