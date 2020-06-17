
<?php
use \StarcatReview\Includes\Settings\SCR_Getter;

class StatsTest extends \Codeception\TestCase\WPTestCase
{
    public function _before()
    {
        wp_set_current_user(1);
    }

    public function test_preparing_stat_args()
    {

        $data = $this->setup_stat_db_datas();
        /*
        Case 1: 'post Overall Single -- Singluarity'
         */
        $actual = apply_filters('prepare_stat_args', $data['product_id']);
        $expected = [
            'stats' => ['feature' => 64],
            'overall' => 64,
        ];
        $this->assertEquals($expected, $actual);

        /*
        Case 2: 'summary_author Single -- Singluarity'
         */
        $component = 'summary_author';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
        $expected = [
            'stats' => ['feature' => 50],
            'overall' => 50,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 3: 'Summary_users Single -- Singluarity'
         */
        $component = 'summary_users';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
        $expected = [
            'stats' => ['feature' => 77],
            'overall' => 77,
        ];

        $this->assertEquals($expected, $actual);

        /*
        Case 4: 'Listing Single -- Singluarity'
         */
        $component = 'listing';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
        $this->assertEquals(10, count($actual));

        SCR_Getter::set('stat-singularity', 'multiple');
        $singularity = SCR_Getter::get('stat-singularity');

        /*
        Case 5: 'post Overall Muliple -- Singluarity'
         */
        $actual = apply_filters('prepare_stat_args', $data['product_id']);
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
        Case 6: 'Summary_author Muliple -- Singluarity'
         */
        $component = 'summary_author';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
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
        Case 7: 'Summary_users Multiple -- Singluarity'
         */
        $component = 'summary_users';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
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
        Case 8: 'Listing Multiple -- Singluarity'
         */
        $component = 'listing';
        $actual = apply_filters('prepare_stat_args', $data['product_id'], $component);
        $this->assertEquals(10, count($actual));

    }

    // Setting Up Stat DB data
    protected function setup_stat_db_datas()
    {
        $stats_data = $this->get_stats_data();
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

    public function stat()
    {

        $data = $this->get_stats_data();
        $review_meta = $data[SCR_COMMENT_META][0]['stats'];
        $args = [
            'items' => [
                'stats-list' => $review_meta,
            ],
        ];
        $args = array_merge($args, $data[SCR_OPTIONS]);
        $stats_model = new \StarcatReview\App\Components\Stats\Model();

        /*
        Case 1: 'single singluarity'
         */

        $model_props = $stats_model->get_viewProps($args);
        $expected = $this->get_expected_stat($review_meta);
        $actual = $model_props['items'];

        $this->assertEquals($expected, $actual);

        /*
        Case 2: 'multiple singluarity'
         */
        $args['singularity'] = 'multiple';
        $model_props = $stats_model->get_viewProps($args);
        $expected = $this->get_expected_stat($review_meta, 'multiple');
        $actual = $model_props['items'];

        $this->assertEquals($expected, $actual);

        /*
        case 3: 'summary single singluarity'
         */
        $args['combine_type'] = 'overall';
        $args['singularity'] = 'multiple';
        $args['items']['comments-list'] = $this->get_comments_stat_data();
        $model_props = $stats_model->get_viewProps($args);
        $expected = ['overall' => ['rating' => 50, 'score' => 3]];
        $actual = $model_props['items'];

        error_log('args : ' . print_r($args, true));
        error_log('expected : ' . print_r($expected, true));
        error_log('actual : ' . print_r($actual, true));

        // $this->assertEquals($expected, $actual);

        // error_log('model_props : ' . print_r($model_props['items'], true));

        /*
        case 4: 'summary multiple singluarity'
         */

        /*
        case 5: 'overall post / product combine single singluarity '
         */

        /*
        case 6: 'overall post / product combine multiple singluarity'
         */

        /*
         *   1. with author
         *   2. without author
         */
        $some = null;
    }

    protected function get_expected_stat($meta, $singularity = 'single')
    {
        $expected_stat = [];

        $stat_count = 0;
        $stat_total = 0;
        $stat_score = 0;

        foreach ($meta as $stat_key => $stat) {
            $expected_stat[$stat_key] = [
                'score' => $stat['rating'] / 20,
                'rating' => $stat['rating'],
            ];
            if ($singularity == 'single') {
                break;
            }
            $stat_count++;
            $stat_score += $expected_stat[$stat_key]['score'];
            $stat_total += $stat['rating'];
        }

        if ($singularity == 'multiple') {
            $expected_stat['overall'] = [
                'score' => round(($stat_score / $stat_count), 1),
                'rating' => $stat_total / $stat_count,
            ];
        }

        return $expected_stat;
    }

    protected function get_comments_stat_data()
    {
        $comemnt_list = [];
        $comment_metas_stat = $this->get_stats_data()[SCR_COMMENT_META];
        foreach ($comment_metas_stat as $key => $meta_stat) {
            $object = new stdClass();
            $object->reviews = $meta_stat;
            $comemnt_list[] = $object;
        }

        return $comemnt_list;
    }

    public function get_stats_data()
    {

        $data = [
            SCR_OPTIONS => [
                'singularity' => 'single', // single or multiple
                'type' => 'star',
                'steps' => 'full', // full or half
                'limit' => 5, // 5 or 10
                'global_stats' => [
                    ['stat_name' => 'Feature'],
                    ['stat_name' => 'speed'],
                    ['stat_name' => 'quality'],
                    ['stat_name' => 'ui'],
                ],
                'source_type' => 'icon',
                'icons' => 'star',
                'images' => [],
                'animate' => false,
                'show_rating_label' => true,
            ],
            SCR_POST_META => [
                'stats-list' => [
                    'feature' => [
                        'stat_name' => 'Feature',
                        'rating' => 50,
                    ],
                    'speed' => [
                        'stat_name' => 'Speed',
                        'rating' => 80,
                    ],
                    'ui' => [
                        'stat_name' => 'ui',
                        'rating' => 90,
                    ],
                    'quality' => [
                        'stat_name' => 'quality',
                        'rating' => 40,
                    ],
                ],
            ],
            // User reviews comments of its reviews stats meta
            SCR_COMMENT_META => [
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 50,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 80,
                        ],
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 70,
                        ],
                        'ui' => [
                            'stat_name' => 'ui',
                            'rating' => 50,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 100,
                        ],
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 60,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 80,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 100,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 90,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 80,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 80,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 0,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 65,
                        ],
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 95,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 90,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 50,
                        ],
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 70,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 60,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 40,
                        ],
                    ],
                ],
                [
                    'stats' => [
                        'quality' => [
                            'stat_name' => 'quality',
                            'rating' => 70,
                        ],
                        'speed' => [
                            'stat_name' => 'speed',
                            'rating' => 90,
                        ],
                    ],
                ],
            ],
        ];

        return $data;
    }

}