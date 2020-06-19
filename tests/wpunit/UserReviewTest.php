<?php

class UserReviewTest extends \Codeception\TestCase\WPTestCase
{

    /**
     * A single example test.
     */

    public function setUp()
    {
        parent::setUp();
    }

    public function tearDown()
    {
        parent::tearDown();
    }

    public function test_get_votes()
    {
        // $user_reviews_model = new StarcatReview\App\Components\User_Reviews\Model();

        /* Object Mocking */
        $user_reviews_model = $this->make(new StarcatReview\App\Components\User_Reviews\Model(), ['collection' => ['current_user_id' => 1]]);

        /* Test Values */
        $items = [
            [
                'user_id' => 1,
                'vote' => 1,
            ],
            [
                'user_id' => 2,
                'vote' => 1,
            ],
        ];

        $votes = $user_reviews_model->get_votes($items);

        /* Assertions */
        $this->assertEquals(2, $votes['summary']['likes']);
        $this->assertEquals(0, $votes['summary']['dislikes']);
        $this->assertEquals('like', $votes['summary']['active']);
        $this->assertEquals(2, $votes['summary']['people']);
    }

    public function insert_comment($post_id, $post_data)
    {
        $time = current_time('mysql');
        $data = array(
            'comment_post_ID' => $post_id,
            'comment_author' => 'admin',
            'comment_author_email' => 'admin@admin.com',
            'comment_author_url' => 'http://',
            'comment_content' => 'User Review content here',
            'comment_type' => SCR_POST_TYPE,
            'comment_parent' => 0,
            'user_id' => 1,
            'comment_author_IP' => '127.0.0.1',
            'comment_agent' => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.10) Gecko/2009042316 Firefox/3.0.10 (.NET CLR 3.5.30729)',
            'comment_date' => $time,
            'comment_approved' => 1,
        );

        $comment_id = wp_insert_comment($data);
        add_comment_meta($comment_id, 'stats', $post_data['stats']);
        add_comment_meta($comment_id, 'pros_and_cons', $post_data['pros_and_cons']);
        return $comment_id;
    }

    // public function ReviewTest()
    // {
    //     // insert a product
    //     // create subscriber user
    //     // insert review
    //     $expected = [
    //         'comment_id',
    //         'comment_approved',
    //         'comment_review' => [
    //             'title',
    //             'content',
    //             'pros_and_cons',
    //             'attachments',
    //         ],
    //     ];

    //     // manually comment_approved

    //     // check status of review

    // }

} // END TEST CLASS
