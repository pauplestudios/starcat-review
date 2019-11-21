<?php

function scr_get_user_reviews($post_id)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_POST_TYPE
    ];

    $comments = get_comments($args);

    foreach ($comments as $comment) {
        $comment->reviews = get_comment_meta($comment->comment_ID, 'scr_user_review_props', true);
    }

    return $comments;
}

function scr_get_user_reviews_count($post_id)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_POST_TYPE
    ];

    $comments_count = count(get_comments($args));

    error_log('$post_id : ' . $post_id);
    error_log('$comments_count : ' . $comments_count);

    return $comments_count;
}

function scr_get_trend_score($post_id)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_POST_TYPE,
        'date_query' => array(
            'after' => '4 weeks ago',
            'before' => 'tomorrow',
            'inclusive' => true,
        ),
    ];

    $comments_count_last_4_weeks = count(get_comments($args));

    $trendScore = $comments_count_last_4_weeks;
    return $trendScore;
}