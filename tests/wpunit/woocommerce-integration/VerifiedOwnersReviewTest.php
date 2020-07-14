<?php

class VerifiedOwnersReviewTest extends \Codeception\TestCase\WPTestCase
{
    public function _before()
    {
        wp_set_current_user(1);

    }

    public function test_customer_is_verfied_owner()
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
        error_log('comments : ' . print_r($comments, true));

        // check current customer review is not from the verified owner of the product

        // success condition
        // create product
        // register customer
        // order the created product
        // review the product

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

        $UR_Repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
        $review_id = $UR_Repo->insert($props);

        return $review_id;
    }

    public function get_review_data($product_id)
    {
        ;

        return $data;

    }

} // END TEST CLASS
