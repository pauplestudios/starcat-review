<?php

class SinglePostCest
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

    public function defaultAuthorReview(AcceptanceTester $I)
    {
        $this->enable_author_review_for_post($I);
        $post_id = $this->create_post($I);
        $author_reviews_meta = $this->get_author_reviews_arg();
        $this->update_post_meta($I, $post_id, $author_reviews_meta);
        $this->insert_user_review($I, $post_id);
        $I->amOnPage('/car-reviews');

        // check the user review
        $I->see('I love this car');

        // .scr-summay selector class twice in the page. before and after the post content.
        $I->seeNumberOfElements('.scr-summary', 2);

        $I->see('Pros & Cons');
        $I->seeElement('.scr-summary .prosandcons');

        // dont show author and user review
        $meta_data = $this->get_dont_see_meta_args();
        $this->update_post_meta($I, $post_id, $meta_data);
        $I->amOnPage('/car-reviews');
        $I->dontSee('Pros & Cons');

    }

    protected function get_dont_see_meta_args()
    {
        $meta_data = $this->get_author_reviews_arg();

        $dont_show_args = array(
            'post_author_review_settings' => array(
                'can_show_user_review' => 'dont_show',
                'custom_location' => 1,
                'location' => 'shortcode',
            ),
            'post_user_review_settings' => array(
                'can_show_user_review' => 'dont_show',
                'custom_location' => 1,
                'location' => 'shortcode',
            ),
        );

        $meta_data = array_merge($meta_data, $dont_show_args);
        return $meta_data;
    }

    protected function create_post($I)
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

    protected function enable_author_review_for_post($I)
    {
        $I->haveOptionInDatabase('scr_options', array(
            'author_review_enabled_post_types' => ['post', 'page'],
            'user_review_enabled_post_types' => ['post', 'page'],
            'enable-pros-cons' => 1,
            'enable_user_reviews' => 1,
        ));
    }

    protected function update_post_meta($I, $post_id, $meta_data)
    {
        $I->havePostMetaInDatabase($post_id, '_scr_post_options', $meta_data);
    }

    protected function get_author_reviews_arg()
    {
        $data = array(
            'pros-list' => array(
                array(
                    'item' => 'pros1',
                ),
                array(
                    'item' => 'pros2',
                ),
                array(
                    'item' => 'pros3',
                ),
            ),
            'cons-list' => array(
                array(
                    'item' => 'cons1',
                ),
                array(
                    'item' => 'cons2',
                ),
                array(
                    'item' => 'cons3',
                ),
            ),
            'post_author_review_settings' => array(
                'can_show_user_review' => 'apply_global_settings',
                'custom_location' => 0,
                'location' => 'after',
            ),
            'post_user_review_settings' => array(
                'can_show_user_review' => 'apply_global_settings',
                'custom_location' => 0,
                'location' => 'after',
            ),
        );

        return $data;
    }

    private function insert_user_review($I, $post_id)
    {
        $reviewProp = array(
            'post_id' => $post_id,
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

        $comment_id = $I->haveCommentInDatabase($post_id, ['comment_content' => $reviewProp['description'], 'comment_type' => 'review']);

        $I->haveCommentMetaInDatabase($comment_id, 'scr_user_review_props', $reviewProp);
    }

}
