<?php
class ShortcodeCest
{
    public function _before(AcceptanceTester $I)
    {
        // will be executed at the beginning of each test
        $I->loginAsAdmin();
        $I->amOnPluginsPage();
        $I->activatePlugin('starcat-review');
        $I->amOnPagesPage();
        $I->amOnPluginsPage();
        $I->seePluginActivated('starcat-review');
    }

    public function overallUserReviewShortcode(AcceptanceTester $I)
    {
        $post_name = 'user-review-overall';
        $review_post_id = $this->insert_post($I);
        $content = '[starcat_review_overall_user_review post_id=' . $review_post_id . ']';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $post_name);

        // 1. Insert single User Review
        $this->insert_user_review($I, $review_post_id);
        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // 2. Check Shortcode Page
        $I->amOnPage('/' . $post_name);
        $I->see('This Car is too expensive');

        // 3. Check Major Components with Default Props
        $I->seeElement('.scr-search');
        $I->seeElement('.scr_user_reviews');
        $I->seeElement('.scr-icons-row');
        $I->seeElement('.prosandcons');

        // 4. Check by changing different props
    }

    public function insert_user_review($I, $review_post_id)
    {
        $reviewProp = array(
            'post_id' => '2',
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
            'votes' =>
            array(),
        );

        $comment_id = $I->haveCommentInDatabase($review_post_id, ['comment_content' => $reviewProp['description'], 'comment_type' => 'review']);

        $I->haveCommentMetaInDatabase($comment_id, 'scr_user_review_props', $reviewProp);
    }

    // public function test_user_review_list_shortcode(AcceptanceTester $I)
    // {
    //     $post_name = 'user-review-list';
    //     $content = '[starcat_review_user_review_list]';
    //     $shortcode_post_id = $this->insert_shortcode_post($I, $content, $post_name);
    // }

    // public function test_user_review_form_shortcode(AcceptanceTester $I)
    // {
    //     $post_name = 'user-review-form';
    //     $content = '[starcat_review_user_review_form]';
    //     $shortcode_post_id = $this->insert_shortcode_post($I, $content, $post_name);
    // }

    // public function test_review_summary_shortcode(AcceptanceTester $I)
    // {
    //     $post_name = 'user-review-summary';
    //     $content = '[starcat_review_summary]';
    //     $shortcode_post_id = $this->insert_shortcode_post($I, $content, $post_name);
    // }

    protected function insert_shortcode_post($I, $post_content, $post_name)
    {

        $shortcode_post_id = $I->havePostInDatabase(
            [
                'post_name' => $post_name,
                'post_type' => 'page',
                'post_title' => 'Starcat Reviews - Overall User Reviews Shortcode',
                'post_content' =>  $post_content,
                'post_status' => 'publish',
            ]
        );

        return $shortcode_post_id;
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
