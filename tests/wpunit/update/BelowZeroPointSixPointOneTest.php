
<?php

class BelowZeroPointSixPointOneTest extends \Codeception\TestCase\WPTestCase
{

    public function setUp()
    {
        // parent::setUp();
    }

    public function tearDown()
    {
        // parent::tearDown();
    }

    public function test_upgrade_v061()
    {
        $upgrader_list = new \StarcatReview\Includes\Update\Upgrades_List();
        $this->setup_reviews_and_replies_data();

        /* Part 1 : Non-logged-in authors info review and reply support */

        /* Part 2 : woocomemrce integration support */
        $actual = scr_get_comments_args(['comments'], ['parent' => '']);
        $expected = 4;
        $this->assertEquals($expected, count($actual));

        $upgrader_list->upgrade_v061();
        $actual = scr_get_comments_args(['comments'], ['parent' => '']);
        $expected = 6;
        $this->assertEquals($expected, count($actual));
    }

    protected function setup_reviews_and_replies_data()
    {
        $UR_Repo = new \StarcatReview\App\Repositories\User_Reviews_Repo();
        $product_id = $this->factory()->post->create(['post_type' => 'product']);

        $general = [
            'post_id' => $product_id,
            'parent' => 0,
            'title' => "Cool review title",
            'description' => "Cool review description or comment",
            'scores' => [
                'feature' => 80,
                'UI' => 60,
            ],
        ];

        $datas = [
            "0.5" => [
                'first_name' => 'Joseph',
                'last_name' => 'Tribianni',
                'user_email' => 'josephtribianni@gmail.com',
            ],
            "0.6" => [
                'author' => 'Chandler Bing',
                'email' => 'chandlerbing@gmail.com',
                'url' => 'chandlerbing.com',
            ],
            "0.6.1" => [
                'name' => 'Ross Geller',
                'email' => 'rossgeller@gmail.com',
                'website' => 'rossgeller.com',
            ],
        ];

        add_filter('comment_flood_filter', '__return_false');

        $review = [];
        foreach ($datas as $version => $data) {
            $data = array_merge($data, $general);

            // reviews
            $comment_id = $UR_Repo->insert($data);
            $review[] = $comment_id;
            $this->update_comment_type($comment_id, $version);

            // replies
            $data['parent'] = $comment_id;
            $comment_id = $UR_Repo->insert($data);
            $replies[] = $comment_id;
            $this->update_comment_type($comment_id, $version);
        }

        return $review;
    }

    protected function update_comment_type($comment_id, $version)
    {
        $comment_modifier = [
            'comment_ID' => $comment_id,
        ];

        if ($version == "0.5") {
            $comment_modifier['comment_type'] = 'starcat_review';
        }
        wp_update_comment($comment_modifier);
    }
}

?>