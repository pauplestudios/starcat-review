<?php

class SinglePostSettingsTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * A single example test.
     */

    public function setUp(): void
    {
        parent::setUp();
    }

    public function tearDown(): void
    {
        parent::tearDown();
    }

    public function test_single_post_review_settings()
    {
        global $post;
        $post_id = $this->create_post();
        $post = get_post($post_id);

        $post_level_settings = new \StarcatReview\App\Post_Settings\Post_Level_Settings();

        $patterns = $this->get_patterns();

        foreach ($patterns as $pattern) {

            $actual_data = $this->get_actual_data($pattern);

            $summary_args = $post_level_settings->get_summary_args_by_post_settings($actual_data);

            $summary_args = $this->convert_to_integer($summary_args);

            $expected_data = $this->get_expected_data($pattern);

            codecept_debug(' [ ========= ' . $pattern . '=============]');
            codecept_debug('[$summary_args] : ' . print_r($summary_args, true));
            codecept_debug('[$expected_data] : ' . print_r($expected_data, true));

            $this->assertEquals($summary_args, $expected_data);
        }
    }

    public function convert_to_integer($summary_args)
    {
        $args = array(
            'after' => array(),
            'before' => array(),
        );

        foreach ($summary_args as $key => $summary) {
            foreach ($summary as $setting_key => $setting_value) {
                $args[$key][$setting_key] = ($setting_value == true) ? 1 : 0;
            }
        }
        return $args;
    }

    public function get_patterns()
    {
        return [
            'apply_global_settings',
            'dont_show',
            'show_author_reviews_only',
            'show_user_reviews_only',
            'show_author_review_before_the_content',
            'show_user_review_before_the_content',
        ];
    }

    public function get_actual_data($type = 'apply_global_settings')
    {
        $defaults = array(
            'apply_global_settings' => array(
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
            ),
            'dont_show' => array(
                'post_author_review_settings' => array(
                    'can_show_author_review' => 'dont_show',
                ),
                'post_user_review_settings' => array(
                    'can_show_user_review' => 'dont_show',
                ),
            ),
            'show_author_reviews_only' => array(
                'post_author_review_settings' => array(
                    'can_show_author_review' => 'show',
                    'custom_location' => 0,
                    'location' => 'after',
                ),
                'post_user_review_settings' => array(
                    'can_show_user_review' => 'dont_show',
                ),
            ),
            'show_user_reviews_only' => array(
                'post_author_review_settings' => array(
                    'can_show_author_review' => 'dont_show',
                ),
                'post_user_review_settings' => array(
                    'can_show_user_review' => 'show',
                    'custom_location' => 0,
                    'location' => 'after',
                ),
            ),
            'show_author_review_before_the_content' => array(
                'post_author_review_settings' => array(
                    'can_show_author_review' => 'show',
                    'custom_location' => 1,
                    'location' => 'before',
                ),
                'post_user_review_settings' => array(
                    'can_show_user_review' => 'dont_show',
                ),
            ),
            'show_user_review_before_the_content' => array(
                'post_author_review_settings' => array(
                    'can_show_author_review' => 'dont_show',
                ),
                'post_user_review_settings' => array(
                    'can_show_user_review' => 'show',
                    'custom_location' => 1,
                    'location' => 'before',
                ),
            ),
        );
        return $defaults[$type];
    }

    private function create_post()
    {
        $post_id = $this->factory->post->create([
            'post_status' => 'publish',
            'post_title' => 'Helpie Product',
            'post_content' => 'Helpie Product Post Content',
            'post_type' => 'post',
        ]);
        return $post_id;
    }

    public function get_expected_data($pattern = 'apply_global_settings')
    {
        $defaults = array(
            'apply_global_settings' => array(
                'before' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 1,
                    'enable_pros_cons' => 1,
                    'enable_user_reviews' => 1,
                    'enable_atthachments' => 1,
                ),
            ),
            'dont_show' => array(
                'before' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 1,
                ),
            ),
            'show_author_reviews_only' => array(
                'before' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 1,
                    'enable_pros_cons' => 1,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 1,
                ),
            ),
            'show_user_reviews_only' => array(
                'before' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 1,
                    'enable_atthachments' => 1,
                ),
            ),
            'show_author_review_before_the_content' => array(
                'before' => array(
                    'enable-author-review' => 1,
                    'enable_pros_cons' => 1,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 1,
                ),
            ),
            'show_user_review_before_the_content' => array(
                'before' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 1,
                    'enable_atthachments' => 0,
                ),
                'after' => array(
                    'enable-author-review' => 0,
                    'enable_pros_cons' => 0,
                    'enable_user_reviews' => 0,
                    'enable_atthachments' => 1,
                ),
            ),
        );

        return $defaults[$pattern];
    }
}