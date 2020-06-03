
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

        $stats_model = new \StarcatReview\App\Components\Stats\Model();
        $model_props = $stats_model->get_itemsProps([]);
        error_log('model_props : ' . print_r($model_props, true));
    }

/*

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