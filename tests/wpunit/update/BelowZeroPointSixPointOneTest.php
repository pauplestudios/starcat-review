
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
        $review_data = $this->setup_reviews_and_replies_data();

        $comments = scr_get_comments_args(['comments'], ['parent' => '']);
        $this->assertEquals(4, count($comments));

        $comments = scr_get_comments_args(['comments'], ['user_id' => 0]);
        $this->assertEquals(2, count($comments));

        $upgrader_list->upgrade_v061();
        /* Part 2 : Non-logged-in reviews author info support */
        $comments = scr_get_comments_args(['comments'], ['user_id' => 0]);
        $this->assertEquals(3, count($comments));

        $is_author_anonymous = array_search('Anonymous', wp_list_pluck($comments, 'author'));
        $this->assertFalse($is_author_anonymous);

        /* Part 1 : woocomemrce integration support */

        $actual = scr_get_comments_args(['comments'], ['parent' => '']);
        $expected = 6;
        $this->assertEquals($expected, count($actual));

        $this->assertEquals(4, get_comment_meta($review_data[0], 'rating', true));
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
            'rating' => 80,
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
                'author' => 'Ross Geller',
                'email' => 'chandlerbing@gmail.com',
                'url' => 'chandlerbing.com',
            ],
        ];

        add_filter('comment_flood_filter', '__return_false');

        $review = [];
        foreach ($datas as $version => $data) {
            $data = array_merge($data, $general);

            // reviews
            $comment_id = $UR_Repo->insert($data);
            $review[] = $comment_id;
            $this->update_scr_comment_props($comment_id);
            $this->update_comment_type($comment_id, $version);

            // replies
            $data['parent'] = $comment_id;
            $comment_id = $UR_Repo->insert($data);
            $replies[] = $comment_id;
            $this->update_comment_type($comment_id, $version);
        }

        return $review;
    }

    protected function update_scr_comment_props($comment_id)
    {

        $props = get_comment_meta($comment_id, SCR_COMMENT_META, true);

        if (isset($_POST['first_name']) && !empty($_POST['first_name'])) {
            $props['first_name'] = $_POST['first_name'];
        }

        if (isset($_POST['last_name']) && !empty($_POST['last_name'])) {
            $props['last_name'] = $_POST['last_name'];
        }

        if (isset($_POST['user_email']) && !empty($_POST['user_email'])) {
            $props['user_email'] = $_POST['user_email'];
        }

        if (isset($_POST['author']) && !empty($_POST['author'])) {
            $props['author'] = $_POST['author'];
        }

        if (isset($_POST['url']) && !empty($_POST['url'])) {
            $props['url'] = $_POST['url'];
        }

        update_comment_meta($comment_id, SCR_COMMENT_META, $props);
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