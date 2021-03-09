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
        $shortcode_post_name = 'user-review-overall';
        $review_post_id = $this->insert_post($I);
        $content = '[starcat_review_overall_user_review post_id=' . $review_post_id . ']';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);

        // 1. Insert single User Review
        $this->insert_user_review($I, $review_post_id);
        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // 2. Check Shortcode Page
        $I->amOnPage('/' . $shortcode_post_name);
        $I->see('This Car is too expensive');

        // 3. Check Major Components with Default Props
        $I->seeElement('.scr-search');
        $I->seeElement('.scr_user_reviews');
        $I->seeElement('.scr-icons-row');
        $I->seeElement('.prosandcons');
        $I->seeElement('.dropdown.sort');

        // 4. Check by changing different props
        $content = '[starcat_review_overall_user_review post_id=' . $review_post_id . ' show_review_search=0 show_review_sort=0]';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);

        $I->amOnPage('/' . $shortcode_post_name);

        $I->dontSeeElement('.scr-search');
        $I->dontSeeElement('.dropdown.sort');
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
            'votes' => array(),
        );

        $comment_id = $I->haveCommentInDatabase($review_post_id, ['comment_content' => $reviewProp['description'], 'comment_type' => 'review']);

        $I->haveCommentMetaInDatabase($comment_id, 'scr_user_review_props', $reviewProp);
    }

    public function userReviewListShortcodeCest(AcceptanceTester $I)
    {
        $shortcode_post_name = 'user-review-list';
        $review_post_id = $this->insert_post($I);
        $content = '[starcat_review_user_review_list post_id=' . $review_post_id . ' show_review_search="1" show_review_title="1" show_review_sort="1"]';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);
        codecept_debug(' [shortcode_post_id] ' . $shortcode_post_id);

        // 1. Insert single User Review
        $this->insert_user_review($I, $review_post_id);
        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // 2. Check Shortcode Page
        $I->amOnPage('/' . $shortcode_post_name);
        $I->see('This Car is too expensive');

        // 3. Check Major Components with Default Props
        $I->seeElement('.scr-search');
        $I->seeElement('.dropdown.sort');
        $I->seeElement('h3.header');

        $content = '[starcat_review_user_review_list post_id=' . $review_post_id . ' show_review_search="1" show_review_title="1" show_review_sort="1"]';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);
        codecept_debug('[$shortcode_post_id] 1 : ' . $shortcode_post_id);

        $I->amOnPage('/' . $shortcode_post_name);
        $I->dontSeeElement('.scr-search');
        $I->dontSeeElement('.dropdown.sort');
    }

    public function userReviewFormCest(AcceptanceTester $I)
    {
        $shortcode_post_name = 'user-review-form';
        $review_post_id = $this->insert_post($I);
        $content = '[starcat_review_user_review_form post_id=' . $review_post_id . ']';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);

        // 1. Insert single User Review
        $this->insert_user_review($I, $review_post_id);
        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // 2. Check Shortcode Page
        $I->amOnPage('/' . $shortcode_post_name);
        $I->see('This Car is too expensive');

        // 3.  Check Major Components with Default Props
        $review_form_class = '.scr-user-review-form-' . $review_post_id;
        $I->seeElement($review_form_class);

    }

    public function userReviewSummary(AcceptanceTester $I)
    {
        $shortcode_post_name = 'user-review-summary';
        $review_post_id = $this->insert_post($I);
        $content = '[starcat_review_summary post_id=' . $review_post_id . ' show_author_reviews_summary="1" show_user_reviews_summary="1" show_pros_and_cons_summary="1"]';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);

        // 1. Insert single User Review
        $this->insert_user_review($I, $review_post_id);
        $I->amOnPage('/car-reviews');
        $I->see('This Car is too expensive');

        // 2. Check Shortcode Page
        $I->amOnPage('/' . $shortcode_post_name);
        // $I->see('This Car is too expensive');

        // 3. Check Major Components with Default Props

        $I->seeElement('.scr-summary'); // Checking Summary root element
        $I->seeElement('.reviewed-list'); // checking reviewed-list items element
        // $I->seeElement('.prosandcons'); // TODO need to checking author prosandcons element, not to added

        // 4. Check by changing different props
        $content = '[starcat_review_summary post_id=' . $review_post_id . ' show_author_reviews_summary="0" show_user_reviews_summary="0" show_pros_and_cons_summary="0"]';
        $shortcode_post_id = $this->insert_shortcode_post($I, $content, $shortcode_post_name);

        $I->amOnPage('/' . $shortcode_post_name);

        $I->dontSeeElement('.scr-summary .reviewed-list');
        $I->dontSeeElement('.prosandcons');
    }

    protected function insert_shortcode_post($I, $post_content, $post_name)
    {

        $shortcode_post_id = $I->havePostInDatabase(
            [
                'post_name' => $post_name,
                'post_type' => 'page',
                'post_title' => 'Starcat Reviews - Overall User Reviews Shortcode',
                'post_content' => $post_content,
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

    protected function insert_page($I)
    {

        $post_id = $I->havePostInDatabase([
            'post_type' => 'page',
            'post_title' => 'Car Reviews',
            'post_name' => 'car-reviews',
            'post_status' => 'publish',
            'post_content' => 'This car is great!',

        ]);

        return $post_id;
    }
}