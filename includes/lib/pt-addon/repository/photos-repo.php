<?php

namespace StarcatReviewPt\Repository;

use \StarcatReview\Includes\Settings\SCR_Getter;

if (!defined('ABSPATH')) {
    exit;
} // Exit if accessed directly

if (!class_exists('\StarcatReviewPt\Repository\Photos_Repo')) {
    class Photos_Repo
    {
        public function check_review_image($comment)
        {
            $size_of_the_photos = SCR_Getter::get('pr_photo_size');
            $quantity_of_the_photos = SCR_Getter::get('pr_photo_quantity');

            // $maxsize_allowed = $this->settings->get_params('photo', 'maxsize');
            // $max_file_up = $this->settings->get_params('photo', 'maxfiles');

            $maxsize_allowed = $size_of_the_photos;
            $max_file_up = $quantity_of_the_photos;

            error_log('size_of_the_photos : ' . $size_of_the_photos);
            error_log('quantity_of_the_photos : ' . $quantity_of_the_photos);
            error_log('Files of Photos : ' . print_r($_FILES['files'], true));

            $im = isset($_FILES['files']) ? $_FILES['files'] : array();
            // if (!isset($_POST['wcpr_image_upload_nonce'], $_FILES['files']) || !wp_verify_nonce($_POST['wcpr_image_upload_nonce'], 'files')) {
            //     return $comment;
            // } else {
            // if (('on' == $this->settings->get_params('photo', 'gdpr')) && (!isset($_POST['wcpr_gdpr_checkbox']) || !$_POST['wcpr_gdpr_checkbox'])) {
            //     wp_die('Please agree with the GDPR policy!');
            // }
            if (is_array($im['name'][0])) {
                if ($im['name'][0][0] == '') {

                    if (true == SCR_Getter::get('pr_require_photos')) {
                        error_log('!!! Photo is required. !!!');

                        wp_die('Photo is required.');
                    }
                } else {
                    if (count($im['name']) > $max_file_up) {

                        error_log('!!! Maximum number of files allowed is: !!!' . $max_file_up);
                        wp_die("Maximum number of files allowed is: $max_file_up.");
                    }
                    foreach ($im['size'] as $k => $size) {
                        if (!$size[0]) {
                            if ($this->settings->get_params('image_caption_enable')) {
                                continue;
                            } else {
                                error_log('!!! File\'s too large! !!!');

                                wp_die("File's too large!");
                            }
                        }
                        if ($size[0] > ($maxsize_allowed * 1024)) {
                            error_log("Max size allowed: $maxsize_allowed kB.");

                            wp_die("Max size allowed: $maxsize_allowed kB.");
                        }
                    }
                    foreach ($im['type'] as $type_k => $type) {
                        if ($type[0] != "image/jpg" && $type[0] != "image/jpeg" && $type[0] != "image/bmp" && $type[0] != "image/png" && $type[0] != "image/gif") {
                            if ($this->settings->get_params('image_caption_enable')) {
                                continue;
                            } else {
                                error_log('!!! Only JPG, JPEG, BMP, PNG and GIF are allowed. !!!');

                                wp_die("Only JPG, JPEG, BMP, PNG and GIF are allowed.");
                            }
                        }
                    }
                    error_log('!!! IF First Add review Image !!!');

                    $this->add_review_image($comment);
                    // add_action('comment_post', array($this, 'add_review_image'));
                    // if ('on' == $this->settings->get_params('coupon', 'require')['photo'] && 'yes' == get_option('woocommerce_enable_coupons') && 'on' == $this->settings->get_params('coupon', 'enable')) {
                    //     add_action('comment_post', array($this, 'send_coupon_after_reviews'), 10, 2);
                    // }
                }
            } else {
                foreach ($im['name'] as $im_name_k => $im_name_v) {
                    if (!$im_name_v) {
                        foreach ($im as $im_k => $im_v) {
                            unset($im[$im_k][$im_name_k]);
                        }
                    }
                }

                if (!count($im['name'])) {
                    if (SCR_Getter::get('pr_require_photos') == true) {
                        wp_die('Photo is required.');
                    }
                } else {
                    if (count($im['name']) > $max_file_up) {

                        wp_die("Maximum number of files allowed is: $max_file_up.");
                    }
                    foreach ($im['size'] as $k => $size) {
                        if (!$size) {
                            if ($this->settings->get_params('image_caption_enable')) {
                                continue;
                            } else {
                                wp_die("File's too large!");
                            }
                        }
                        error_log('maxize_allowed : ' . $maxize_allowed * 1024);

                        if ($size > ($maxsize_allowed * 1024)) {
                            wp_die("Max size allowed: $maxsize_allowed kilobytes.");
                        }
                    }
                    foreach ($im['type'] as $type) {

                        if ($type != "image/jpg" && $type != "image/jpeg" && $type != "image/bmp" && $type != "image/png" && $type != "image/gif") {
                            if ($this->settings->get_params('image_caption_enable')) {
                                continue;
                            } else {
                                wp_die("Only JPG, JPEG, BMP, PNG and GIF are allowed.");

                            }
                        }
                    }
                    // add_action('comment_post', array($this, 'add_review_image'));
                    error_log('!!! Else Add review Image !!!');

                    $this->add_review_image($comment);
                    // if ('on' == $this->settings->get_params('coupon', 'require')['photo'] && 'yes' == get_option('woocommerce_enable_coupons') && 'on' == $this->settings->get_params('coupon', 'enable')) {
                    //     add_action('comment_post', array($this, 'send_coupon_after_reviews'), 10, 2);
                    // }
                }
            }

            // }

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
