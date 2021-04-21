<?php
class NonLoggedInUserCest
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

    public function non_logged_in_user(AcceptanceTester $I)
    {
        $this->settings_non_loggedin($I);

        $this->create_post($I);
        $I->amOnPage('/car-reviews');
        $I->see('Reviews');
        $I->see('Leave a Review');

        $this->dont_see_non_logged_user_fields($I);
        $I->logOut();

        $I->amOnPage('/car-reviews');

        $this->can_see_non_logged_in_fields($I);

        $props = [
            'IP' => '192.2.2.2',
            'description' => 'First review by Mr Anon',
            'author' => 'Mr Anon',
            'email' => 'myanon@gmail.com',
            'url' => 'http://www.mranon.com',
        ];

        $this->insert_review($I, $props);

        $I->submitForm('form.form.scr-user-review',
            [
                'name' => 'Miles Davis',
                'email' => 'milesdavis@gmail.com',
                'website' => 'milesdavis.local',
                'title' => 'This is Title of Review',
                'scores[]' => '4.5',
                'description' => 'This is Description of Review',
                'pros[0]' => 'First Pro',
                'cons[0]' => 'First Con',
                'wp-comment-cookies-consent' => 'checked',
            ]
        );

    }

    private function can_see_non_logged_in_fields($I)
    {
        $formElement = "form.form.scr-user-review";
        $I->seeElement($formElement . " [name='name']");
        $I->seeElement($formElement . " [name='email']");
        $I->seeElement($formElement . " [name='website']");
        $I->seeElement($formElement . " [name='scores[]']");
        $I->seeElement($formElement . " [name='wp-comment-cookies-consent']");

    }

    private function dont_see_non_logged_user_fields($I)
    {
        $formElement = "form.form.scr-user-review";
        $I->dontSeeElement($formElement . " [name='name']");
        $I->dontSeeElement($formElement . " [name='email']");
        $I->dontSeeElement($formElement . " [name='website']");
        $I->dontSeeElement($formElement . " [name='wp-comment-cookies-consent']");
    }

    private function settings_non_loggedin($I)
    {
        $options = [
            /** TODO: use - 'user_review_enabled_post_types' since - v0.7.6  */
            // 'review_enable_post-types' => ['post', 'starcat_review', 'product'],
            'user_review_enabled_post_types' => ['post', 'starcat_review', 'product'],
            'ur_who_can_review' => 'every_one',
        ];

        $I->haveOptionInDatabase('scr_options', $options);

    }

    private function insert_review($I, $props)
    {
        $comment_data = [];

        // General Properties
        $comment_data['comment_author_IP'] = $props['IP'];
        $comment_data['comment_post_ID'] = 19;
        $comment_data['comment_content'] = $props['description'];
        $comment_data['comment_agent'] = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36';
        $comment_data['comment_type'] = 'starcat_review';
        // $comment_data['comment_date'] = current_time('timestamp', true);
        $comment_data['comment_parent'] = 0;
        $comment_data['comment_approved'] = 0;
        $comment_data['comment_author'] = $props['author'];
        $comment_data['comment_author_email'] = $props['email'];
        $comment_data['comment_author_url'] = $props['url'];
        $comment_data['user_id'] = '';

        // $comment_id = wp_new_comment($comment_data);

        // $comment_modifier = [
        //     'comment_ID' => $comment_id,
        //     'comment_approved' => 0,
        // ];

        $postId = $comment_data['comment_post_ID'];
        $I->haveCommentInDatabase($postId, $comment_data);
        // wp_update_comment($comment_modifier);
    }

    private function create_post($I)
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