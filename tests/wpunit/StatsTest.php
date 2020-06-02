
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
        $expected = [
            'stats' => [
                'stat_key_1' => 'value', // number
                'stat_key_2' => 'value', // number
                'stat_key_3' => 'value', // number
            ],
            'stat' => 'value', // number
        ];

        $data = [
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

        // Settings available stat
        $global_stats = ['feature', 'speed', 'ui', 'design']; // 400 Current

        // Author and User -- Post level
        // Author -- Post Level
        // User reviews --  review Level
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