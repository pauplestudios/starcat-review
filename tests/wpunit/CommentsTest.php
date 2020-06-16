<?php

class CommentsTest extends \Codeception\TestCase\WPTestCase
{
    public function expected_filters()
    {
        $filters = [
            'scr_stat',
            'scr_votes',
            'scr_comment',
            'scr_attachments',
            'scr_prosandcons',
        ];

        /*
         * scr_comment filter for Parent and child comment
         * Comment Object given
         */
        $expected = [
            'id' => 1,
            'time' => "10:10AM",
            'date' => "11-12-20",
            'title' => 'some',
            'avatar' => 'url',
            'author' => 'random',
            'content' => 'some',
        ];

        // child comment
        $expected = [
            'id' => 3,
            'time' => "10:10AM",
            'date' => "11-12-20",
            'author' => 'random',
            'avatar' => 'url',
            'content' => 'some',
            'parent_id' => 1,
        ];

        /*
         * scr_prosandcons filter
         * Comment meta given
         */
        $expected = [
            'pros' => ['super', 'awesome and super'],
            'cons' => ['dull', 'dudd and worst'],
        ];

        /*
         * Votes filter
         * Comment meta given
         */
        $expected = [
            'likes' => 0,
            'active' => 0,
            'people' => 0,
            'dislikes' => 0,
        ];

        /*
         * attachment filter
         * Comment meta given
         */
        $expected = [
            'attachment_id' => 10,
            'comment_id' => 1,
            'sizes' => [
                'small' => 'url',
                'large' => 'url',
                'medium' => 'url',
                'thumbnail' => 'url',
            ],
        ];
    }
}
