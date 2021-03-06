
<?php

class StatsTest extends \Codeception\TestCase\WPTestCase
{
    public function _before()
    {
        wp_set_current_user(1);
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