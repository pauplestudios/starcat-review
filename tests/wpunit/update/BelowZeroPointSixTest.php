
<?php
// use \StarcatReview\Includes\Settings\SCR_Getter;

class BelowZeroPointSixTest extends \Codeception\TestCase\WPTestCase
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

        $actual = $upgrader_list->upgrade_v061();
        $expected = [];

        $review_data = $this->get_review_data();
        $comments = scr_get_comments_args(['comments'], []);

        error_log('review_data : ' . print_r($review_data, true));
        error_log('comments : ' . print_r($comments, true));
    }

    public function get_review_data()
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
            error_log('data : ' . print_r($data, true));

            $comment_id = $UR_Repo->insert($data);
            $review[] = $comment_id;

            $comment_modifier = [
                'comment_ID' => $comment_id,
                'comment_approved' => 1,
            ];

            if ($version == "0.5") {
                $comment_modifier['comment_type'] = 'starcat_review';
            }
            wp_update_comment($comment_modifier);
        }

        return $review;
    }

}

?>