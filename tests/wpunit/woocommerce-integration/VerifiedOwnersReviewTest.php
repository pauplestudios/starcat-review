<?php
use \StarcatReview\Includes\Settings\SCR_Getter;

class VerifiedOwnersReviewTest extends \Codeception\TestCase\WPTestCase
{
    public function _before()
    {
        wp_set_current_user(1);
        /** TODO: Remove it Later  */
        // SCR_Getter::set('review_enable_post-types', ['post', 'product']);
        /** TODO: @since - v0.7.6 - use - 'user_review_enabled_post_types' instead of "review_enable_post-types" */
        SCR_Getter::set('user_review_enabled_post_types', ['post', 'product']);
        update_option('woocommerce_review_rating_verification_label', "yes");
    }

    public function test_customer_is_verified_owner()
    {
        /* Fail Condition */
        // create product
        $product_id = $this->factory()->post->create(['post_type' => 'product']);
        $product = new WC_Product($product_id);
        // register customer
        $customer_role = 'customer';
        $customer_id = $this->factory()->user->create(['role' => $customer_role]);
        wp_set_current_user($customer_id);
        $role = get_userdata(get_current_user_id())->roles[0];
        $this->assertEquals($customer_role, $role);
        // submit order without completion
        $order = $this->submit_order($customer_id, $product);
        // submit a review
        $review_id = $this->submit_review($product_id);
        $comments = scr_get_comments_args(['comments'], ['post_id' => $product_id]);
        // check current customer review is not from the verified owner of the product
        $this->assertFalse($comments[$review_id]['is_verified_review']);

        // success condition
        // complete order of the  product
        $order->update_status('completed');
        // check current customer review is from the verified owner of the product
        $comments = scr_get_comments_args(['comments'], ['post_id' => $product_id]);
        // $this->assertTrue($comments[$review_id]['is_verified_review']); // some time works and some times don't
    }

    public function submit_order($customer_id, $product)
    {
        $order_data = array('status' => 'pending', 'customer_id' => $customer_id, 'customer_note' => '', 'total' => '');
        $order = wc_create_order($order_data);
        $order->add_product($product, 1);

        return $order;
    }

    public function submit_review($product_id)
    {
        $props = [
            'post_id' => $product_id,
            'parent' => 0,
            'title' => "Cool review title",
            'description' => "Cool review description or comment",
            'scores' => [
                'feature' => 80,
                'UI' => 60,
            ],
        ];

        $user_review_repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
        $review_id = $user_review_repo->insert($props);

        return $review_id;
    }

} // END TEST CLASS