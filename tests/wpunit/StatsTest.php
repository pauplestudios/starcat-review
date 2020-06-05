
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
        $args = [
            'items' => [
                'stats-list' => $data['comments_review_metas'][0]['stats'],
            ],
        ];
        $args = array_merge($args, $data['settings']);
        $stats_model = new \StarcatReview\App\Components\Stats\Model();

        // singularity type == single
        $model_props = $stats_model->get_viewProps($args);
        $expected = [
            'feature' => [
                'rating' => 100,
                'score' => 5,
            ],
        ];
        $actual = $model_pros['items'];

        /*
        segment: 'single singluarity for single review'
        given_args: singularity = single, type = star, steps = 'full'
         */
        $this->assertEquals($expected, $actual);

        /*
        segment: 'multiple singluarity for single review'
        given_args: singularity = multiple, type = star, steps = 'full'
         */
        $model_props = $stats_model->get_viewProps($args);
        $expected = [
            'feature' => [
                'rating' => 100,
                'score' => 5,
            ],
        ];
        $actual = $model_pros['items'];
        /*
        segment: 'single singluarity for combine review summary'
        given_args: singularity = multiple, type = star, steps = 'full'
         */

        /*
        segment: 'multiple singluarity for combine review summary'
        given_args: singularity = multiple, type = star, steps = 'full'
         */

        // /*
        // segment: 'multiple singluarity for combine review summary'
        // given_args: singularity = multiple, type = star, steps = 'full'
        //  */

        error_log('model_props : ' . print_r($model_props, true));
        // error_log('stats data : ' . print_r($data, true));
        $this->assertTrue(true);
    }

    public function get_stats_data()
    {

        $data = [
            'post_options' => [
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
            'comments_review_metas' => [
                [
                    'stats' => [
                        'feature' => [
                            'stat_name' => 'feature',
                            'rating' => 100,
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

            'settings' => [
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
            /*
        'settings' => [
        'stat-singularity' => 'single', // single or multiple
        'stats-type' => 'full', // full or half
        'stats-stars-limit' => 5, // 5 or 10
        'global_stats' => [
        ['stat_name' => 'Feature'],
        ['stat_name' => 'speed'],
        ['stat_name' => 'quality'],
        ['stat_name' => 'ui'],
        ],
        ],
         */
        ];

        return $data;
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