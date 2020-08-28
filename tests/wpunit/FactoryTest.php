
<?php
use \StarcatReview\Includes\Settings\SCR_Getter;

require_once SCR_PATH . 'includes/utils/review-data.php';

class FactoryTest extends \Codeception\TestCase\WPTestCase
{
    public function _before()
    {
        wp_set_current_user(1);
    }

    public function test_get_prosandcons_args()
    {
        $data = $this->get_data();
        $actual = scr_get_comments_args(['prosandcons'], ['post_id' => $data['product_id']]);
        $this->assertEquals(1, count($actual));
    }

    public function test_get_votes_args()
    {
        $data = $this->get_data();
        $votes = scr_get_comments_args(['votes'], ['post_id' => $data['product_id']]);

        $this->assertEquals(1, count($votes));

        $single_vote = current($votes);

        $this->assertEquals(2, $single_vote['likes']);
        $this->assertEquals(0, $single_vote['dislikes']);
        $this->assertEquals('like', $single_vote['active']);
        $this->assertEquals(2, $single_vote['people']);
    }

    public function test_scr_get_comments_args()
    {
        $data = $this->get_data();
        $actual = scr_get_comments_args(['comments'], ['post_id' => $data['product_id']]);
        $this->assertEquals(10, count($actual));
    }

    public function test_scr_get_stat_args()
    {
        $author_stat = 'author_stat'; // summary_author
        $comment_stat = 'comment_stat'; // summary_users

        $data = $this->get_data();

        SCR_Getter::set('stat-singularity', 'single');
        SCR_Getter::set('review_enable_post-types', ['post', 'product']);

        /*
        Case 1: 'post Overall Single -- Singluarity'
         */
        $actual = scr_get_stat_args($data['product_id']);
        $expected = [
            'stats' => ['feature' => 64],
            'overall' => 64,
        ];
        $this->assertEquals($expected, $actual);

        /*
        Case 2: 'summary_author or author_stat Single -- Singluarity'
         */
        $component = 'summary_author';
        $actual = scr_get_stat_args($data['product_id'], $author_stat);
        $expected = [
            'stats' => ['feature' => 50],
            'overall' => 50,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 3: 'Summary_users Single -- Singluarity'
         */
        $component = 'summary_users';
        $actual = scr_get_stat_args($data['product_id'], $comment_stat);
        $expected = [
            'stats' => ['feature' => 77],
            'overall' => 77,
        ];

        $this->assertEquals($expected, $actual);

        SCR_Getter::set('stat-singularity', 'multiple');
        $singularity = SCR_Getter::get('stat-singularity');

        /*
        Case 4: 'post Overall Muliple -- Singluarity'
         */
        $actual = scr_get_stat_args($data['product_id']);
        $expected = [
            'stats' => [
                'feature' => 63,
                'speed' => 80,
                'quality' => 56,
                'ui' => 78,
                'ux' => 80,
            ],
            'overall' => 70,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 5: 'Summary_author Muliple -- Singluarity'
         */
        $component = 'summary_author';
        $actual = scr_get_stat_args($data['product_id'], $author_stat);
        $expected = [
            'stats' => [
                'feature' => 50,
                'speed' => 80,
                'quality' => 40,
                'ui' => 90,
            ],
            'overall' => 65,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 6: 'Summary_users Multiple -- Singluarity'
         */
        $component = 'summary_users';
        $actual = scr_get_stat_args($data['product_id'], $comment_stat);
        $expected = [
            'stats' => [
                'feature' => 75,
                'speed' => 79,
                'quality' => 72,
                'ui' => 65,
                'ux' => 80,
            ],
            'overall' => 75,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 7: 'Listing Multiple -- Singluarity'
         */

        $actual = scr_get_comments_args(['stats'], ['post_id' => $data['product_id']]);
        $this->assertEquals(10, count($actual));

        SCR_Getter::set('stat-singularity', 'single');
        /*
        Case 8: 'Listing Single -- Singluarity'
         */
        $actual = scr_get_comments_args(['stats'], ['post_id' => $data['product_id']]);
        $this->assertEquals(10, count($actual));
    }

    // Setting Up Stat DB data
    public function get_data()
    {
        $stats_data = ReviewData::get_stats_data();
        $post_meta = $stats_data[SCR_POST_META];
        $comment_metas = $stats_data[SCR_COMMENT_META];
        $comments_data = [];

        $data['product_id'] = $this->factory()->post->create(['post_type' => 'product']);
        add_post_meta($data['product_id'], SCR_POST_META, $post_meta);

        for ($ii = 0; $ii < sizeof($comment_metas); $ii++) {
            $comment_id = $this->factory()->comment->create_post_comments($data['product_id'], 1, ['comment_type' => 'review'])[0];
            $data['comment_ids'][] = $comment_id;
            add_comment_meta($comment_id, SCR_COMMENT_META, $comment_metas[$ii]);
            // Adding product rating for each comment
            add_comment_meta($comment_id, 'rating', 4);
        }

        $data['global_stats'] = [
            ['stat_name' => 'feature'],
            ['stat_name' => 'speed'],
            ['stat_name' => 'quality'],
            ['stat_name' => 'ui'],
            ['stat_name' => 'ux'],
        ];

        SCR_Getter::set('global_stats', $data['global_stats']);

        return $data;
    }
}