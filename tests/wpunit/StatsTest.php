
<?php

class StatsTest extends \Codeception\TestCase\WPTestCase
{
    private $test_helper;

    public function _before()
    {
        wp_set_current_user(1);
    }

    public function test_stat()
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
                        'rating' => 0,
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
            ],
        ];

        return $data;
    }

    private function extra_datas()
    {
        // No existed review meta
        /*
         * 1. Has product rating -- UnEqualed
         * 2. doesnt have product rating -- Non-review
         */

        /*
         * Yes existed review meta
         * 1. have stats entry - Equaled
         * 2. Not have stats entry - UnEqualed
         */

        //
        // yes existed review meta not have stats entry
    }

    private function later_refer_details()
    {
        /* Single Review */
        // mulitple
        $expected = [
            'stats' => [
                'stat_key_1' => 'value', // number
                'stat_key_2' => 'value', // number
                'stat_key_3' => 'value', // number
            ],
            'aggregate' => 'value', // number
        ];

        // single
        $expected = [
            'stat' => [
                'stat_key_1' => 'value', // number
            ],
        ];

        /* summary review */
        // multiple users
        $expected = [
            'stats' => [
                'stat_key_1' => 'value', // number
                'stat_key_2' => 'value', // number
                'stat_key_3' => 'value', // number
            ],
            'aggregate' => 'value', // number
        ];

        // 100 percentage

        $improved_data = [
            0 => [
                'speed' => 100,
                'quality' => 50,
                'design' => 10,
            ],
            1 => [
                'speed' => 80,
                'quality' => 90,
            ],
            2 => [
                'speed' => 80,
            ],
            3 => [
                'feature' => 90,
            ],
        ];

        $existing_data = [
            'stats' => [
                'feature' => [
                    'stat_name' => 'feature',
                    'rating' => 100,
                ],
                'speed' => [
                    'stat_name' => 'speed',
                    'rating' => 80,
                ],
            ],
        ];

        // Settings available stat
        $global_stats = ['feature', 'speed', 'ui', 'design']; // 400 Current

        // Author and User -- Post level
        // Author -- Post Level
        // User reviews --  review Level
    }

/*
[global_stats] => Array
(
[0] => Array
(
[stat_name] => Feature
)

[1] => Array
(
[stat_name] => speed
)

[2] => Array
(
[stat_name] => quality
)

[3] => Array
(
[stat_name] => ui
)

)

rating = below and equal to 5 and whole number

use cases :
1. Combined author and User stat -- post level
2. -- single review stat
3. -- multi review stat

1st
mulitple stat [
'speed' => 100
'quality' => 50
'design' => 10
];

overall of that based on
single stat [
'feature' or 'whatever_name'
]

 */
}