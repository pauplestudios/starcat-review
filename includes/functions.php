<?php

use \StarcatReview\Includes\Settings\SCR_Getter;

function scr_get_overall_rating($post_id)
{
    $args = [
        'post_id' => $post_id,
        'combine_type' => 'overall',
    ];

    $items = get_post_meta($post_id, '_scr_post_options', true);
    $args['items'] = isset($items) && !empty($items) ? $items : [];
    $args['items']['comments-list'] = scr_get_user_reviews($post_id);

    $args = array_merge(SCR_Getter::get_stat_default_args(), $args);

    $controller = new \StarcatReview\App\Components\Stats\Controller($args);
    $rating = $controller->get_rating();

    // error_log('args : ' . print_r($args, true));
    // error_log('rating : ' . print_r($rating, true));

    return $rating;
}

function scr_get_user_reviews($post_id)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_COMMENT_TYPE,
        'status' => 'approve',
    ];

    $comments = get_comments($args);

    foreach ($comments as $comment) {
        $comment->reviews = get_comment_meta($comment->comment_ID, 'scr_user_review_props', true);
    }

    return $comments;
}

function scr_get_user_reviews_count($post_id, $parent = true)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_COMMENT_TYPE,
        'status' => 'approve',
    ];

    if ($parent) {
        $args['parent'] = 0;
    }

    $comments_count = count(get_comments($args));

    // error_log('$post_id : ' . $post_id);
    // error_log('$comments_count : ' . $comments_count);

    return $comments_count;
}

function scr_get_trend_score($post_id)
{
    $args = [
        'post_id' => $post_id,
        'type' => SCR_COMMENT_TYPE,
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
