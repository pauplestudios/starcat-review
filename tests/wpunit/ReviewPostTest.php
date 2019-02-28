dd
<?php

class ReviewPostTest extends \Codeception\TestCase\WPTestCase
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

    public function test_review_setup()
    {
        $post_data = array();
        $post_data['title'] = 'Zendesk';
        $post_data['content'] = 'Help Desk Software including ticketing and knowledge base. Online help desk software with no downloading.';
        $post_data['stats'] = array(
            'style' => 4.5,
            'speed' => 4,
            'power' => 5,
            'customisation' => 4.7,
        );
        $post_data['pros_and_cons'] = array(
            'pros' => array(
                'Awesome display',
                'A phone that feels like the future',
                'Stunning camera',
                'It’s actually innovative',
            ),
            'cons' => array(
                'Awfully placed fingerprint sensor',
                'Bixby is a bit of a dud',
            ),
        );
        $post_id = $this->insert_post($post_data);
        $wp_review_post = get_post($post_id);
        $comment_id = $this->insert_comment($post_id, $post_data);

        $review_post = new \HelpieReviews\App\Review_Post($wp_review_post);

        $this->assertEquals($post_id, $review_post->id);
        $this->assertEquals($post_data['content'], $review_post->content);
        $this->assertEquals($post_data['stats'], $review_post->stats);

        /* Comments */
        $user_reviews = $review_post->user_reviews;
        $this->assertEquals(1, sizeof($user_reviews, 0));
        $this->assertEquals($post_data['stats'], $user_reviews[0]->stats);
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
            'comment_type' => 'helpie_user_review',
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

    public function insert_post($post)
    {
        return wp_insert_post(array(
            'post_title' => $post['title'],
            'post_content' => $post['content'],
            'post_type' => 'helpie_reviews',
            'meta_input' => array(
                'stats' => $post['stats'],
                'pros_and_cons' => $post['pros_and_cons'],
            ),
        ));
    }

} // END TEST CLASS