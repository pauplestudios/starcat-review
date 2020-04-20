<?php

namespace StarcatReviewPt\Repository;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPhotoReviews\Includes\Repository')) {
    class Photos_Repo
    {
        public function check_review_image($comment_id)
        {
            $maxsize_allowed = SCR_Getter::get('pr_photo_size');
            $max_file_up = SCR_Getter::get('pr_photo_quantity');
            $is_photo_required = SCR_Getter::get('pr_require_photos');

            error_log('size_of_the_photos : ' . $maxsize_allowed);
            error_log('quantity_of_the_photos : ' . $max_file_up);

            $alerts = [
                'required' => 'Photo is required',
                'max_files' => 'Maximum number of files allowed is: ',
                'large_file' => 'File\'s too large!',
                'max_size' => 'Max size allowed: ',
                'allowed_types' => 'Only JPG, JPEG, BMP, PNG and GIF are allowed.',
            ];

            error_log('Before Files of Photos : ' . sizeof($_FILES['files']));
            $files = isset($_FILES['files']) ? $_FILES['files'] : array();
            error_log('Files of Photos : ' . print_r($files, true));

            if (is_array($files['name'][0])) {
                if ($files['name'][0][0] == '') {
                    if ($is_photo_required) {
                        error_log('!!! Photo is required. !!!');
                        wp_send_json(['alert' => $alerts['required']]);
                    }
                } else {
                    if (count($files['name']) > $max_file_up) {
                        error_log('!!! Maximum number of files allowed is: !!!' . $max_file_up);
                        wp_send_json(['alert' => $alerts['max_files'] . $max_file_up . '.']);
                    }
                    foreach ($files['size'] as $k => $size) {
                        if (!$size[0]) {
                            error_log('!!! File\'s too large! !!!');
                            wp_send_json(['alert' => $alerts['large_file']]);
                        }
                        if ($size[0] > ($maxsize_allowed * 1024)) {
                            error_log("Max size allowed: $maxsize_allowed kB.");
                            wp_send_json(['alert' => $alerts['max_size'] . $maxsize_allowed . ' kb.']);
                        }
                    }
                    foreach ($files['type'] as $type_k => $type) {
                        if ($type[0] != "image/jpg" && $type[0] != "image/jpeg" && $type[0] != "image/bmp" && $type[0] != "image/png" && $type[0] != "image/gif") {
                            error_log('!!! Only JPG, JPEG, BMP, PNG and GIF are allowed. !!!');
                            wp_send_json(['alert' => $alerts['allowed_types']]);
                        }
                    }

                    $this->add_review_image($comment_id);
                }
            } else {
                error_log('!!! Else add Review alerts Conditions !!!');

                foreach ($files['name'] as $im_name_k => $im_name_v) {
                    if (!$im_name_v) {
                        foreach ($im as $im_k => $im_v) {
                            unset($files[$im_k][$im_name_k]);
                        }
                    }
                }

                if (!count($files['name']) && $files['name'] !== '404.php') {
                    if (SCR_Getter::get('pr_require_photos')) {
                        error_log('!!! Photo is required. !!!');
                        wp_send_json(['alert' => $alerts['required']]);
                    }
                } else {
                    if (count($files['name']) > $max_file_up) {
                        error_log("Maximum number of files allowed is: $max_file_up.");
                        wp_send_json(['alert' => $alerts['max_files'] . $max_file_up . '.']);
                    }
                    foreach ($files['size'] as $k => $size) {
                        if (!$size) {
                            error_log('!!! File\'s too large! !!!');
                            wp_send_json(['alert' => $alerts['large_file']]);
                        }

                        if ($size > ($maxsize_allowed * 1024)) {
                            error_log("Max size allowed: $maxsize_allowed kB.");
                            wp_send_json(['alert' => $alerts['max_size'] . $maxsize_allowed . ' kb.']);
                        }
                    }
                    foreach ($files['type'] as $type) {
                        if ($type != "image/jpg" && $type != "image/jpeg" && $type != "image/bmp" && $type != "image/png" && $type != "image/gif") {
                            error_log('!!! Only JPG, JPEG, BMP, PNG and GIF are allowed. !!!');
                            wp_send_json(['alert' => $alerts['allowed_types']]);
                        }
                    }

                    $this->add_review_image($comment_id);
                }
            }

            return $comment;
        }

        public function add_review_image($comment_id)
        {
            add_filter('intermediate_image_sizes', array($this, 'reduce_image_sizes'));
            error_log('comment_id : ' . print_r($comment_id, true));

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
                $meta['attachments'] = $img_id;
                update_comment_meta($comment_id, 'scr_user_review_props', $meta);

            }
        }

        public function reduce_image_sizes($sizes)
        {
            $reduce_array = apply_filters('scr_photos_review_reduce_array', array(
                'thumbnail',
                'scr-photos',
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

        public function delete_attachment($props)
        {
            if (metadata_exists('comment', $props['review_id'], 'scr_user_review_props')) {
                $meta_props = get_comment_meta($props['review_id'], 'scr_user_review_props', true);
                if (isset($meta_props['attachments']) && !empty($meta_props['attachments'])) {
                    $attachments = [];
                    foreach ($meta_props['attachments'] as $attachment) {
                        if ($attachment == $props['attachment_id']) {
                            wp_delete_attachment($attachment, true);
                            continue;
                        }
                        array_push($attachments, $attachment);
                    }
                    $meta_props['attachments'] = $attachments;
                    error_log('meta_props : ' . print_r($meta_props, true));

                    update_comment_meta($props['review_id'], 'scr_user_review_props', $meta_props);
                }
            }
        }

        public function get_processing_attachment_data()
        {
            $data = [];
            if (isset($_POST['review_id']) && !empty($_POST['review_id'])) {
                $data['review_id'] = $_POST['review_id'];
            }

            if (isset($_POST['attachment_id']) && !empty($_POST['attachment_id'])) {
                $data['attachment_id'] = $_POST['attachment_id'];
            }

            return $data;

        }

    } // END CLASS

}
