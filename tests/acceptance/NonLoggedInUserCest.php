<?php
class NonLoggedInUserCest
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

    public function non_logged_in_user(AcceptanceTester $I)
    {
        $this->dont_see_non_logged_user_fields($I);
        $I->see('Log Out');
        $I->click('Log Out');

        $this->settings_non_loggedin($I);

        $I->amOnPage('/product/album/');
        $I->see('Reviews (0)');
        $I->click('#tab-reviews');
        $I->see('Leave a Review');

        $props = [
            'IP' => '192.2.2.2',
            'description' => 'First review by Mr Anon',
            'author' => 'Mr Anon',
            'email' => 'myanon@gmail.com',
            'url' => 'http://www.mranon.com',
        ];

        $this->insert_review($I, $props);

        $I->amOnPage('/product/album/');
        $I->see('Reviews');
        $I->click('#tab-reviews');
        $I->see('Leave a Review');

        $this->can_see_non_logged_in_fields($I);

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
            'ur_who_can_review' => 'everyone',
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
}
