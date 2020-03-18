<?php

namespace StarcatReviewPt\Repository;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPt\Repository\Photos_Repo')) {
    class Photos_Repo
    {
        public function add_review_image($comment_id)
        {
            add_filter('intermediate_image_sizes', array($this, 'reduce_image_sizes'));

            $post_id = get_comment($comment_id)->comment_post_ID;
            require_once ABSPATH . 'wp-admin/includes/image.php';
            require_once ABSPATH . 'wp-admin/includes/file.php';
            require_once ABSPATH . 'wp-admin/includes/media.php';
            $files = isset($_FILES['files']) && !empty($_FILES['files']) ? $_FILES['files'] : array();
            $captions = array();
            $img_id = array();
            if (is_array($files['name'][0])) {
                foreach ($files['name'] as $key => $value) {
                    if ($files['name'][$key][0]) {
                        $meta = array();
                        if (isset($captions[$key]) && $captions[$key]) {
                            $meta['post_excerpt'] = $captions[$key];
                        }
                        $file = array(
                            'name' => apply_filters('scr_photos_review_image_file_name', $files['name'][$key][0], $comment_id, $post_id),
                            'type' => $files['type'][$key][0],
                            'tmp_name' => $files['tmp_name'][$key][0],
                            'error' => $files['error'][$key][0],
                            'size' => $files['size'][$key][0],
                        );
                        $_FILES['upload_file'] = $file;
                        $attachment_id = media_handle_upload('upload_file', $post_id, $meta);
                        if (is_wp_error($attachment_id)) {
                            wp_die('Error adding file.');
                        } else {
                            $img_id[] = $attachment_id;
                        }
                    }
                }
            } else {
                foreach ($files['name'] as $key => $value) {
                    if (empty($value)) {
                        continue;
                    }
                    if ($files['name'][$key]) {
                        $meta = array();
                        if (isset($captions[$key]) && $captions[$key]) {
                            $meta['post_excerpt'] = $captions[$key];
                        }
                        $file = array(
                            'name' => apply_filters('scr_photos_review_image_file_name', $files['name'][$key], $comment_id, $post_id),
                            'type' => $files['type'][$key],
                            'tmp_name' => $files['tmp_name'][$key],
                            'error' => $files['error'][$key],
                            'size' => $files['size'][$key],
                        );
                        $_FILES['upload_file'] = $file;
                        $attachment_id = media_handle_upload('upload_file', $post_id, $meta);
                        if (is_wp_error($attachment_id)) {
                            wp_die('Error adding file.');
                        } else {
                            $img_id[] = $attachment_id;
                        }
                    }
                }
            }
            remove_filter('intermediate_image_sizes', array($this, 'reduce_image_sizes'));
            if (count($img_id)) {
                update_comment_meta($comment_id, 'reviews-images', $img_id);
                $meta = get_comment_meta($comment_id, 'scr_user_review_props', true);
                $meta['attachements'] = $img_id;
                update_comment_meta($comment_id, 'scr_user_review_props', $meta);

            }
        }

        public function reduce_image_sizes($sizes)
        {
            $reduce_array = apply_filters('scr_photos_review_reduce_array', array(
                'thumbnail',
                'scr-photos-review',
                'medium',
            ));
            foreach ($sizes as $k => $size) {
                if (in_array($size, $reduce_array)) {
                    continue;
                }
                unset($sizes[$k]);
            }

            return $sizes;
        }

    } // END CLASS

}
