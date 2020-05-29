<?php

class ReviewListTest extends \Codeception\TestCase\WPTestCase
{
    private $test_helper;

    public function _before()
    {
        wp_set_current_user(1);
    }

    public function testWooProduct()
    {
        $is_product_exist = post_type_exists('product');
        $this->assertTrue($is_product_exist);
        $this->below_create_comment();
    }

    public function create_factory_comment_with_review_meta()
    {
        $product_id = $this->factory->post->create([
            'post_type' => 'product',
        ]);
        $comment_ids = [];
        for ($i = 0; $i < 5; $i++) {
            error_log('Number ' . $i);
            $comment_content = 'this is review ' . $i;
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'review',
                'comment_meta' => ['rating' => $i],
            ]);

            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'starcat_review',
                'comment_meta' => ['rating' => $i],
            ]);
        }

        $this->assertEquals(10, count($comment_ids));
        error_log("comment_ids: " . print_r($comment_ids, true));
        error_log("comment Obj : " . print_r(get_comments(), true));

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

}
