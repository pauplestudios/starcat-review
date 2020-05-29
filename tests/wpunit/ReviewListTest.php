<?php

class ReviewListTest extends \Codeception\TestCase\WPTestCase
{
    private $test_helper;

    public function _before()
    {
        wp_set_current_user(1);
    }

    public function test_review_list()
    {
        $is_product_exist = post_type_exists('product');
        $this->assertTrue($is_product_exist);
        $this->create_factory_comment_with_review_meta();
        // $UR_controller = new \StarcatReview\App\Components\User_Reviews\Controller();
        // $UR_controller->get_view($args);
    }

    public function create_factory_comment_with_review_meta()
    {
        $product_id = $this->factory->post->create([
            'post_type' => 'product',
        ]);
        $comment_ids = [];

        for ($i = 0; $i < 5; $i++) {
            error_log('Number ' . $i);
            $comment_content = "This is review $i";
            $review_data = [
                'rating' => $i,
                'scr_user_review_props' => [
                    'title' => 'Super Duper',
                    'description' => $comment_content,
                    'rating' => 80,
                    'pros' => ['item' => 'log', 'item' => 'not logged'],
                    'cons' => ['dont', 'doesnt'],
                    'attachements' => [1, 2, 3, 4],
                    'votes' => [
                        ['user_id' => 1, 'vote' => 1],
                        ['user_id' => 2, 'vote' => 0],
                        ['user_id' => 0, 'vote' => 1],
                    ],
                ],
            ];

            // WooCommerce Review
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'review',
                'comment_meta' => ['rating' => $i],
            ]);

            // StarCat Review
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'starcat_review',
                'comment_meta' => $review_data,
            ]);

            // Comment
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'comment',
            ]);

            // Comment linked starcat review
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'comment',
                'comment_meta' => $review_data,
            ]);

            // WooCommerce linked starcat review
            $comment_ids[] = $this->factory->comment->create([
                'user_id' => get_current_user_id(),
                'comment_post_ID' => $product_id,
                'comment_content' => $comment_content,
                'comment_type' => 'review',
                'comment_meta' => $review_data,
            ]);

        }
        remove_action('pre_get_comments', 'exclude_from_comments');
        $this->assertEquals(25, count($comment_ids));
        $total_product_comments_count = get_comments(['post_id' => $product_id, 'parent' => 0, 'count' => true]);
        $this->assertEquals(25, $total_product_comments_count);

        // error_log("comment_ids: " . print_r($comment_ids, true));
        // error_log("comment Obj : " . print_r(get_comments(), true));
    }
}
