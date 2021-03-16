# WordPress MySQL database migration
#
# Generated: Monday 24. August 2020 05:36 UTC
# Hostname: db
# Database: `wp`
# URL: //127.0.0.1:83
# Path: /var/www/html
# Tables: wp_actionscheduler_actions, wp_actionscheduler_claims, wp_actionscheduler_groups, wp_actionscheduler_logs, wp_commentmeta, wp_comments, wp_links, wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users, wp_wc_admin_note_actions, wp_wc_admin_notes, wp_wc_category_lookup, wp_wc_customer_lookup, wp_wc_download_log, wp_wc_order_coupon_lookup, wp_wc_order_product_lookup, wp_wc_order_stats, wp_wc_order_tax_lookup, wp_wc_product_meta_lookup, wp_wc_reserved_stock, wp_wc_tax_rate_classes, wp_wc_webhooks, wp_woocommerce_api_keys, wp_woocommerce_attribute_taxonomies, wp_woocommerce_downloadable_product_permissions, wp_woocommerce_log, wp_woocommerce_order_itemmeta, wp_woocommerce_order_items, wp_woocommerce_payment_tokenmeta, wp_woocommerce_payment_tokens, wp_woocommerce_sessions, wp_woocommerce_shipping_zone_locations, wp_woocommerce_shipping_zone_methods, wp_woocommerce_shipping_zones, wp_woocommerce_tax_rate_locations, wp_woocommerce_tax_rates
# Table Prefix: wp_
# Post Types: revision, attachment, page, post, product, product_variation, starcat_review
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_actionscheduler_actions`
#

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;


#
# Table structure of table `wp_actionscheduler_actions`
#

CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_actions`
#
INSERT INTO `wp_actionscheduler_actions` ( `action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(6, 'action_scheduler/migration_hook', 'complete', '2020-05-21 12:02:14', '2020-05-21 12:02:14', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1590062534;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590062534;s:19:"scheduled_timestamp";i:1590062534;s:9:"timestamp";i:1590062534;}', 1, 1, '2020-05-21 12:02:34', '2020-05-21 12:02:34', 0, NULL),
(7, 'woocommerce_update_marketplace_suggestions', 'complete', '2020-05-21 12:01:26', '2020-05-21 12:01:26', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1590062486;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590062486;s:19:"scheduled_timestamp";i:1590062486;s:9:"timestamp";i:1590062486;}', 0, 1, '2020-05-21 12:02:35', '2020-05-21 12:02:35', 0, NULL),
(8, 'action_scheduler/migration_hook', 'complete', '2020-05-25 06:29:10', '2020-05-25 06:29:10', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1590388150;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590388150;s:19:"scheduled_timestamp";i:1590388150;s:9:"timestamp";i:1590388150;}', 1, 1, '2020-05-25 06:29:35', '2020-05-25 06:29:35', 0, NULL),
(9, 'action_scheduler/migration_hook', 'complete', '2020-05-25 06:30:35', '2020-05-25 06:30:35', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1590388235;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590388235;s:19:"scheduled_timestamp";i:1590388235;s:9:"timestamp";i:1590388235;}', 1, 1, '2020-05-25 06:31:12', '2020-05-25 06:31:12', 0, NULL),
(10, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:08:58', '2020-08-24 05:08:58', '["wc_admin_update_130_remove_dismiss_action_from_tracking_opt_in_note"]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245738;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245738;s:19:"scheduled_timestamp";i:1598245738;s:9:"timestamp";i:1598245738;}', 2, 1, '2020-08-24 05:09:47', '2020-08-24 05:09:47', 0, NULL),
(11, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:08:59', '2020-08-24 05:08:59', '["wc_admin_update_130_db_version"]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245739;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245739;s:19:"scheduled_timestamp";i:1598245739;s:9:"timestamp";i:1598245739;}', 2, 1, '2020-08-24 05:09:58', '2020-08-24 05:09:58', 0, NULL),
(12, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:09:00', '2020-08-24 05:09:00', '["wc_admin_update_140_change_deactivate_plugin_note_type"]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245740;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245740;s:19:"scheduled_timestamp";i:1598245740;s:9:"timestamp";i:1598245740;}', 2, 1, '2020-08-24 05:10:09', '2020-08-24 05:10:09', 0, NULL),
(13, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:09:01', '2020-08-24 05:09:01', '["wc_admin_update_140_db_version"]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245741;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245741;s:19:"scheduled_timestamp";i:1598245741;s:9:"timestamp";i:1598245741;}', 2, 1, '2020-08-24 05:10:21', '2020-08-24 05:10:21', 0, NULL),
(14, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:34', '2020-08-24 05:10:34', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245834;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245834;s:19:"scheduled_timestamp";i:1598245834;s:9:"timestamp";i:1598245834;}', 2, 1, '2020-08-24 05:10:43', '2020-08-24 05:10:43', 0, NULL),
(15, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:35', '2020-08-24 05:10:35', '{"update_callback":"wc_update_440_db_version"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245835;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245835;s:19:"scheduled_timestamp";i:1598245835;s:9:"timestamp";i:1598245835;}', 2, 1, '2020-08-24 05:10:54', '2020-08-24 05:10:54', 0, NULL),
(16, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:43', '2020-08-24 05:10:43', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245843;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245843;s:19:"scheduled_timestamp";i:1598245843;s:9:"timestamp";i:1598245843;}', 2, 1, '2020-08-24 05:11:09', '2020-08-24 05:11:09', 0, NULL),
(17, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:44', '2020-08-24 05:10:44', '{"update_callback":"wc_update_440_db_version"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245844;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245844;s:19:"scheduled_timestamp";i:1598245844;s:9:"timestamp";i:1598245844;}', 2, 1, '2020-08-24 05:11:35', '2020-08-24 05:11:35', 0, NULL),
(18, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:43', '2020-08-24 05:10:43', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245843;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245843;s:19:"scheduled_timestamp";i:1598245843;s:9:"timestamp";i:1598245843;}', 2, 1, '2020-08-24 05:11:20', '2020-08-24 05:11:20', 0, NULL),
(19, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:47', '2020-08-24 05:10:47', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245847;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245847;s:19:"scheduled_timestamp";i:1598245847;s:9:"timestamp";i:1598245847;}', 2, 1, '2020-08-24 05:12:04', '2020-08-24 05:12:04', 0, NULL),
(20, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:48', '2020-08-24 05:10:48', '{"update_callback":"wc_update_440_db_version"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245848;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245848;s:19:"scheduled_timestamp";i:1598245848;s:9:"timestamp";i:1598245848;}', 2, 1, '2020-08-24 05:12:15', '2020-08-24 05:12:15', 0, NULL),
(21, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:53', '2020-08-24 05:10:53', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245853;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245853;s:19:"scheduled_timestamp";i:1598245853;s:9:"timestamp";i:1598245853;}', 2, 1, '2020-08-24 05:12:26', '2020-08-24 05:12:26', 0, NULL),
(22, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:10:54', '2020-08-24 05:10:54', '{"update_callback":"wc_update_440_db_version"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245854;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245854;s:19:"scheduled_timestamp";i:1598245854;s:9:"timestamp";i:1598245854;}', 2, 1, '2020-08-24 05:12:36', '2020-08-24 05:12:36', 0, NULL),
(23, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:11:20', '2020-08-24 05:11:20', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245880;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245880;s:19:"scheduled_timestamp";i:1598245880;s:9:"timestamp";i:1598245880;}', 2, 1, '2020-08-24 05:12:47', '2020-08-24 05:12:47', 0, NULL),
(24, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:12:26', '2020-08-24 05:12:26', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245946;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245946;s:19:"scheduled_timestamp";i:1598245946;s:9:"timestamp";i:1598245946;}', 2, 1, '2020-08-24 05:12:58', '2020-08-24 05:12:58', 0, NULL),
(25, 'woocommerce_run_update_callback', 'complete', '2020-08-24 05:12:58', '2020-08-24 05:12:58', '{"update_callback":"wc_update_440_insert_attribute_terms_for_variable_products"}', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1598245978;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1598245978;s:19:"scheduled_timestamp";i:1598245978;s:9:"timestamp";i:1598245978;}', 2, 1, '2020-08-24 05:13:13', '2020-08-24 05:13:13', 0, NULL) ;

#
# End of data contents of table `wp_actionscheduler_actions`
# --------------------------------------------------------



#
# Delete any existing table `wp_actionscheduler_claims`
#

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;


#
# Table structure of table `wp_actionscheduler_claims`
#

CREATE TABLE `wp_actionscheduler_claims` (
  `claim_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_claims`
#

#
# End of data contents of table `wp_actionscheduler_claims`
# --------------------------------------------------------



#
# Delete any existing table `wp_actionscheduler_groups`
#

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;


#
# Table structure of table `wp_actionscheduler_groups`
#

CREATE TABLE `wp_actionscheduler_groups` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_groups`
#
INSERT INTO `wp_actionscheduler_groups` ( `group_id`, `slug`) VALUES
(1, 'action-scheduler-migration'),
(2, 'woocommerce-db-updates') ;

#
# End of data contents of table `wp_actionscheduler_groups`
# --------------------------------------------------------



#
# Delete any existing table `wp_actionscheduler_logs`
#

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;


#
# Table structure of table `wp_actionscheduler_logs`
#

CREATE TABLE `wp_actionscheduler_logs` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_logs`
#
INSERT INTO `wp_actionscheduler_logs` ( `log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 6, 'action created', '2020-05-21 12:01:14', '2020-05-21 12:01:14'),
(2, 7, 'action created', '2020-05-21 12:01:26', '2020-05-21 12:01:26'),
(3, 6, 'action started via Async Request', '2020-05-21 12:02:34', '2020-05-21 12:02:34'),
(4, 6, 'action complete via Async Request', '2020-05-21 12:02:34', '2020-05-21 12:02:34'),
(5, 7, 'action started via Async Request', '2020-05-21 12:02:34', '2020-05-21 12:02:34'),
(6, 7, 'action complete via Async Request', '2020-05-21 12:02:35', '2020-05-21 12:02:35'),
(7, 8, 'action created', '2020-05-25 06:28:10', '2020-05-25 06:28:10'),
(8, 8, 'action started via WP Cron', '2020-05-25 06:29:35', '2020-05-25 06:29:35'),
(9, 8, 'action complete via WP Cron', '2020-05-25 06:29:35', '2020-05-25 06:29:35'),
(10, 9, 'action created', '2020-05-25 06:29:35', '2020-05-25 06:29:35'),
(11, 9, 'action started via WP Cron', '2020-05-25 06:31:12', '2020-05-25 06:31:12'),
(12, 9, 'action complete via WP Cron', '2020-05-25 06:31:12', '2020-05-25 06:31:12'),
(13, 10, 'action created', '2020-08-24 05:08:58', '2020-08-24 05:08:58'),
(14, 11, 'action created', '2020-08-24 05:08:58', '2020-08-24 05:08:58'),
(15, 12, 'action created', '2020-08-24 05:08:58', '2020-08-24 05:08:58'),
(16, 13, 'action created', '2020-08-24 05:08:58', '2020-08-24 05:08:58'),
(17, 10, 'action started via Admin List Table', '2020-08-24 05:09:46', '2020-08-24 05:09:46'),
(18, 10, 'action complete via Admin List Table', '2020-08-24 05:09:47', '2020-08-24 05:09:47'),
(19, 11, 'action started via Admin List Table', '2020-08-24 05:09:58', '2020-08-24 05:09:58'),
(20, 11, 'action complete via Admin List Table', '2020-08-24 05:09:58', '2020-08-24 05:09:58'),
(21, 12, 'action started via Admin List Table', '2020-08-24 05:10:09', '2020-08-24 05:10:09'),
(22, 12, 'action complete via Admin List Table', '2020-08-24 05:10:09', '2020-08-24 05:10:09'),
(23, 13, 'action started via Admin List Table', '2020-08-24 05:10:21', '2020-08-24 05:10:21'),
(24, 13, 'action complete via Admin List Table', '2020-08-24 05:10:21', '2020-08-24 05:10:21'),
(25, 14, 'action created', '2020-08-24 05:10:34', '2020-08-24 05:10:34'),
(26, 15, 'action created', '2020-08-24 05:10:34', '2020-08-24 05:10:34'),
(27, 16, 'action created', '2020-08-24 05:10:43', '2020-08-24 05:10:43'),
(28, 17, 'action created', '2020-08-24 05:10:43', '2020-08-24 05:10:43'),
(29, 14, 'action started via Admin List Table', '2020-08-24 05:10:43', '2020-08-24 05:10:43'),
(30, 18, 'action created', '2020-08-24 05:10:43', '2020-08-24 05:10:43'),
(31, 14, 'action complete via Admin List Table', '2020-08-24 05:10:43', '2020-08-24 05:10:43'),
(32, 19, 'action created', '2020-08-24 05:10:47', '2020-08-24 05:10:47'),
(33, 20, 'action created', '2020-08-24 05:10:47', '2020-08-24 05:10:47'),
(34, 21, 'action created', '2020-08-24 05:10:53', '2020-08-24 05:10:53'),
(35, 22, 'action created', '2020-08-24 05:10:53', '2020-08-24 05:10:53'),
(36, 15, 'action started via Admin List Table', '2020-08-24 05:10:54', '2020-08-24 05:10:54'),
(37, 15, 'action complete via Admin List Table', '2020-08-24 05:10:54', '2020-08-24 05:10:54'),
(38, 16, 'action started via Admin List Table', '2020-08-24 05:11:08', '2020-08-24 05:11:08'),
(39, 16, 'action complete via Admin List Table', '2020-08-24 05:11:09', '2020-08-24 05:11:09'),
(40, 18, 'action started via Admin List Table', '2020-08-24 05:11:20', '2020-08-24 05:11:20'),
(41, 23, 'action created', '2020-08-24 05:11:20', '2020-08-24 05:11:20'),
(42, 18, 'action complete via Admin List Table', '2020-08-24 05:11:20', '2020-08-24 05:11:20'),
(43, 17, 'action started via Admin List Table', '2020-08-24 05:11:35', '2020-08-24 05:11:35'),
(44, 17, 'action complete via Admin List Table', '2020-08-24 05:11:35', '2020-08-24 05:11:35'),
(45, 19, 'action started via Admin List Table', '2020-08-24 05:12:04', '2020-08-24 05:12:04'),
(46, 19, 'action complete via Admin List Table', '2020-08-24 05:12:04', '2020-08-24 05:12:04'),
(47, 20, 'action started via Admin List Table', '2020-08-24 05:12:15', '2020-08-24 05:12:15'),
(48, 20, 'action complete via Admin List Table', '2020-08-24 05:12:15', '2020-08-24 05:12:15'),
(49, 21, 'action started via Admin List Table', '2020-08-24 05:12:26', '2020-08-24 05:12:26'),
(50, 24, 'action created', '2020-08-24 05:12:26', '2020-08-24 05:12:26'),
(51, 21, 'action complete via Admin List Table', '2020-08-24 05:12:26', '2020-08-24 05:12:26'),
(52, 22, 'action started via Admin List Table', '2020-08-24 05:12:36', '2020-08-24 05:12:36'),
(53, 22, 'action complete via Admin List Table', '2020-08-24 05:12:36', '2020-08-24 05:12:36'),
(54, 23, 'action started via Admin List Table', '2020-08-24 05:12:47', '2020-08-24 05:12:47'),
(55, 23, 'action complete via Admin List Table', '2020-08-24 05:12:47', '2020-08-24 05:12:47'),
(56, 24, 'action started via Admin List Table', '2020-08-24 05:12:58', '2020-08-24 05:12:58'),
(57, 25, 'action created', '2020-08-24 05:12:58', '2020-08-24 05:12:58'),
(58, 24, 'action complete via Admin List Table', '2020-08-24 05:12:58', '2020-08-24 05:12:58'),
(59, 25, 'action started via Admin List Table', '2020-08-24 05:13:13', '2020-08-24 05:13:13'),
(60, 25, 'action complete via Admin List Table', '2020-08-24 05:13:13', '2020-08-24 05:13:13') ;

#
# End of data contents of table `wp_actionscheduler_logs`
# --------------------------------------------------------



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_commentmeta`
#
INSERT INTO `wp_commentmeta` ( `meta_id`, `comment_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'scr_user_review_props', 'a:12:{s:6:"parent";i:0;s:7:"post_id";s:2:"59";s:5:"title";s:8:"good one";s:11:"description";s:22:"super cool review post";s:4:"pros";a:1:{i:0;a:1:{s:4:"item";s:5:"Thumb";}}s:4:"cons";a:1:{i:0;a:1:{s:4:"item";s:4:"Down";}}s:6:"rating";d:90;s:5:"stats";a:1:{s:7:"feature";a:2:{s:9:"stat_name";s:7:"feature";s:6:"rating";s:2:"90";}}s:10:"comment_id";s:9:"undefined";s:10:"methodType";s:4:"POST";s:11:"attachments";a:2:{i:0;i:61;i:1;i:62;}s:5:"votes";a:1:{i:0;a:2:{s:7:"user_id";i:1;s:4:"vote";s:1:"1";}}}') ;

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-05-21 10:02:52', '2020-05-21 10:02:52', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 59, 'admin', 'dev-email@flywheel.local', 'http://127.0.0.1:83', '172.23.0.1', '2020-08-24 05:32:31', '2020-08-24 05:32:31', 'super cool review post', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'review', 0, 1) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=689 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1:83', 'yes'),
(2, 'home', 'http://127.0.0.1:83', 'yes'),
(3, 'blogname', 'Fresh Site', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'dev-email@flywheel.local', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:191:{s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:17:"^wp-sitemap\\.xml$";s:23:"index.php?sitemap=index";s:17:"^wp-sitemap\\.xsl$";s:36:"index.php?sitemap-stylesheet=sitemap";s:23:"^wp-sitemap-index\\.xsl$";s:34:"index.php?sitemap-stylesheet=index";s:48:"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$";s:75:"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]";s:34:"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$";s:47:"index.php?sitemap=$matches[1]&paged=$matches[2]";s:10:"reviews/?$";s:34:"index.php?post_type=starcat_review";s:40:"reviews/feed/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?post_type=starcat_review&feed=$matches[1]";s:35:"reviews/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?post_type=starcat_review&feed=$matches[1]";s:27:"reviews/page/([0-9]{1,})/?$";s:52:"index.php?post_type=starcat_review&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:31:"product-category/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:28:"product-tag/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"product/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"product/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:48:"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:43:"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"product/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"product/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"reviews/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"reviews/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"reviews/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"reviews/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"reviews/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"reviews/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"reviews/([^/]+)/embed/?$";s:47:"index.php?starcat_review=$matches[1]&embed=true";s:28:"reviews/([^/]+)/trackback/?$";s:41:"index.php?starcat_review=$matches[1]&tb=1";s:48:"reviews/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?starcat_review=$matches[1]&feed=$matches[2]";s:43:"reviews/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?starcat_review=$matches[1]&feed=$matches[2]";s:36:"reviews/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?starcat_review=$matches[1]&paged=$matches[2]";s:43:"reviews/([^/]+)/comment-page-([0-9]{1,})/?$";s:54:"index.php?starcat_review=$matches[1]&cpage=$matches[2]";s:33:"reviews/([^/]+)/wc-api(/(.*))?/?$";s:55:"index.php?starcat_review=$matches[1]&wc-api=$matches[3]";s:39:"reviews/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"reviews/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"reviews/([^/]+)(?:/([0-9]+))?/?$";s:53:"index.php?starcat_review=$matches[1]&page=$matches[2]";s:24:"reviews/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"reviews/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"reviews/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"reviews/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"reviews/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"reviews/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:53:"scr_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?scr_category=$matches[1]&feed=$matches[2]";s:48:"scr_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:51:"index.php?scr_category=$matches[1]&feed=$matches[2]";s:29:"scr_category/([^/]+)/embed/?$";s:45:"index.php?scr_category=$matches[1]&embed=true";s:41:"scr_category/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?scr_category=$matches[1]&paged=$matches[2]";s:23:"scr_category/([^/]+)/?$";s:34:"index.php?scr_category=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:13:"favicon\\.ico$";s:19:"index.php?favicon=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:33:"starcat-review/starcat-review.php";i:1;s:41:"starcat-review-cpt/starcat-review-cpt.php";i:2;s:39:"starcat-review-ct/starcat-review-ct.php";i:3;s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";i:4;s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";i:5;s:27:"woocommerce/woocommerce.php";i:6;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '48748', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1605607370', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:114:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"edit_theme_options";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(96, 'fresh_site', '1', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(103, 'cron', 'a:27:{i:1590388447;a:1:{s:26:"action_scheduler_run_queue";a:1:{s:32:"0d04ed39571b55704c122d726248bbac";a:3:{s:8:"schedule";s:12:"every_minute";s:4:"args";a:1:{i:0;s:7:"WP Cron";}s:8:"interval";i:60;}}}i:1590390073;a:1:{s:33:"wc_admin_process_orders_milestone";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590390079;a:1:{s:29:"wc_admin_unsnooze_admin_notes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590390174;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590395183;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"1a89a2a2129300c1da6763ba0380ed1f";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:56;}}}}i:1590395309;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"2937749bdb63b97e582698a4b62671c0";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:57;}}}}i:1590395385;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"86a7658f8bc100e4f407e1e6e1fed875";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:58;}}}}i:1590400973;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590400974;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1590401376;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590401378;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590408074;a:1:{s:14:"wc_admin_daily";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590408437;a:1:{s:31:"fs_data_sync_starcat-reviews-ct";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590427226;a:1:{s:27:"fs_data_sync_starcat-review";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590746574;a:1:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}i:1598245747;a:2:{s:33:"woocommerce_cleanup_personal_data";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1598245748;a:1:{s:30:"generate_category_lookup_table";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1598245797;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:11:"fifteendays";s:4:"args";a:0:{}s:8:"interval";i:1296000;}}}i:1598245802;a:1:{s:28:"wp_update_comment_type_batch";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1598249337;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1598256537;a:1:{s:24:"woocommerce_cleanup_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1598258442;a:1:{s:32:"fs_data_sync_starcat-reviews-cpt";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1598267337;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1598275959;a:1:{s:38:"fs_data_sync_starcat-review-woo-notify";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1598282078;a:1:{s:30:"fs_data_sync_starcat-review-pr";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1598313600;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'nonce_key', '`E90WxKmnT/m=&^Yg<vY3/O67u:NP*P8;_+?r(.m[F8s.VvR8W~im8yJG@@bhoft', 'no'),
(111, 'nonce_salt', '0 bp/=p#(7: md`pBRE)n f9ln;(@!qcvo_]/+lFk^gNN7JLY]jXFRZyS#]3$C5@', 'no'),
(112, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(142, 'recently_activated', 'a:0:{}', 'yes'),
(147, 'fs_active_plugins', 'O:8:"stdClass":3:{s:7:"plugins";a:1:{s:36:"starcat-review/includes/lib/freemius";O:8:"stdClass":4:{s:7:"version";s:7:"2.4.0.1";s:4:"type";s:6:"plugin";s:9:"timestamp";i:1598245737;s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";}}s:7:"abspath";s:14:"/var/www/html/";s:6:"newest";O:8:"stdClass":5:{s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";s:8:"sdk_path";s:36:"starcat-review/includes/lib/freemius";s:7:"version";s:7:"2.4.0.1";s:13:"in_activation";b:0;s:9:"timestamp";i:1598245737;}}', 'yes'),
(148, 'fs_debug_mode', '', 'yes'),
(149, 'fs_accounts', 'a:17:{s:21:"id_slug_type_path_map";a:5:{i:3980;a:3:{s:4:"slug";s:14:"starcat-review";s:4:"type";s:6:"plugin";s:4:"path";s:33:"starcat-review/starcat-review.php";}i:5890;a:3:{s:4:"slug";s:18:"starcat-reviews-ct";s:4:"type";s:6:"plugin";s:4:"path";s:39:"starcat-review-ct/starcat-review-ct.php";}i:6208;a:3:{s:4:"slug";s:17:"starcat-review-pr";s:4:"type";s:6:"plugin";s:4:"path";s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";}i:5122;a:3:{s:4:"slug";s:19:"starcat-reviews-cpt";s:4:"type";s:6:"plugin";s:4:"path";s:41:"starcat-review-cpt/starcat-review-cpt.php";}i:5788;a:3:{s:4:"slug";s:25:"starcat-review-woo-notify";s:4:"type";s:6:"plugin";s:4:"path";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";}}s:11:"plugin_data";a:5:{s:14:"starcat-review";a:27:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:33:"starcat-review/starcat-review.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1590055885;s:16:"sdk_last_version";s:5:"2.3.0";s:11:"sdk_version";s:7:"2.4.0.1";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";s:3:"0.5";s:14:"plugin_version";s:7:"0.6.1.1";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:11:"fresh.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1590055885;s:7:"version";s:3:"0.5";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:1;s:14:"has_trial_plan";b:1;s:22:"install_sync_timestamp";i:1598246798;s:19:"keepalive_timestamp";i:1598246798;s:20:"activation_timestamp";i:1590062227;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:3:"0.5";s:7:"blog_id";i:0;s:11:"sdk_version";s:5:"2.3.0";s:9:"timestamp";i:1590062236;s:2:"on";b:1;}s:14:"sync_timestamp";i:1590385014;s:9:"beta_data";a:2:{s:7:"is_beta";b:0;s:7:"version";s:7:"0.6.1.1";}s:30:"is_extensions_tracking_allowed";b:1;s:16:"last_license_key";s:32:"6fb16adb514336d5e0566f8206c5b94c";s:20:"last_license_user_id";N;s:15:"is_whitelabeled";b:0;s:21:"last_license_user_key";s:32:"d577ede0a5fa77c70b8f9c42d1165124";}s:18:"starcat-reviews-ct";a:20:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:39:"starcat-review-ct/starcat-review-ct.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1590388196;s:16:"sdk_last_version";s:5:"2.3.0";s:11:"sdk_version";s:7:"2.4.0.1";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";s:3:"0.1";s:14:"plugin_version";s:3:"0.2";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:11:"fresh.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1590388196;s:7:"version";s:3:"0.1";}s:17:"was_plugin_loaded";b:1;s:14:"has_trial_plan";b:0;s:22:"install_sync_timestamp";i:1598246163;s:19:"keepalive_timestamp";i:1598246163;s:15:"prev_is_premium";b:1;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:3:"0.1";s:7:"blog_id";i:0;s:11:"sdk_version";s:5:"2.3.0";s:9:"timestamp";i:1590388206;s:2:"on";b:1;}s:30:"is_extensions_tracking_allowed";b:1;}s:17:"starcat-review-pr";a:22:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1598246273;s:17:"was_plugin_loaded";b:1;s:21:"is_plugin_new_install";b:1;s:16:"sdk_last_version";N;s:11:"sdk_version";s:7:"2.4.0.1";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:5:"0.1.2";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:12:"127.0.0.1:83";s:9:"server_ip";s:10:"172.23.0.1";s:9:"is_active";b:1;s:9:"timestamp";i:1598246273;s:7:"version";s:5:"0.1.2";}s:15:"prev_is_premium";b:1;s:30:"is_extensions_tracking_allowed";b:1;s:14:"has_trial_plan";b:0;s:22:"install_sync_timestamp";i:1598246286;s:19:"keepalive_timestamp";i:1598246286;s:15:"is_whitelabeled";b:0;s:20:"activation_timestamp";i:1598246273;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:5:"0.1.2";s:7:"blog_id";i:0;s:11:"sdk_version";s:7:"2.4.0.1";s:9:"timestamp";i:1598246291;s:2:"on";b:1;}}s:19:"starcat-reviews-cpt";a:21:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:41:"starcat-review-cpt/starcat-review-cpt.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1598246312;s:17:"was_plugin_loaded";b:1;s:21:"is_plugin_new_install";b:1;s:16:"sdk_last_version";N;s:11:"sdk_version";s:7:"2.4.0.1";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:5:"0.3.1";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:12:"127.0.0.1:83";s:9:"server_ip";s:10:"172.23.0.1";s:9:"is_active";b:1;s:9:"timestamp";i:1598246312;s:7:"version";s:5:"0.3.1";}s:15:"prev_is_premium";b:1;s:30:"is_extensions_tracking_allowed";b:1;s:22:"install_sync_timestamp";i:1598246592;s:19:"keepalive_timestamp";i:1598246592;s:14:"has_trial_plan";b:1;s:15:"is_whitelabeled";b:0;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:5:"0.3.1";s:7:"blog_id";i:0;s:11:"sdk_version";s:7:"2.4.0.1";s:9:"timestamp";i:1598246597;s:2:"on";b:1;}}s:25:"starcat-review-woo-notify";a:22:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1598246368;s:17:"was_plugin_loaded";b:1;s:21:"is_plugin_new_install";b:1;s:16:"sdk_last_version";N;s:11:"sdk_version";s:7:"2.4.0.1";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:3:"0.2";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:12:"127.0.0.1:83";s:9:"server_ip";s:10:"172.23.0.1";s:9:"is_active";b:1;s:9:"timestamp";i:1598246368;s:7:"version";s:3:"0.2";}s:15:"prev_is_premium";b:1;s:30:"is_extensions_tracking_allowed";b:1;s:14:"has_trial_plan";b:0;s:22:"install_sync_timestamp";i:1598246379;s:19:"keepalive_timestamp";i:1598246379;s:15:"is_whitelabeled";b:0;s:20:"activation_timestamp";i:1598246368;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:3:"0.2";s:7:"blog_id";i:0;s:11:"sdk_version";s:7:"2.4.0.1";s:9:"timestamp";i:1598246385;s:2:"on";b:1;}}}s:13:"file_slug_map";a:6:{s:33:"starcat-review/starcat-review.php";s:14:"starcat-review";s:41:"starcat-review-ct-1/starcat-review-ct.php";s:18:"starcat-reviews-ct";s:39:"starcat-review-ct/starcat-review-ct.php";s:18:"starcat-reviews-ct";s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";s:17:"starcat-review-pr";s:41:"starcat-review-cpt/starcat-review-cpt.php";s:19:"starcat-reviews-cpt";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";s:25:"starcat-review-woo-notify";}s:7:"plugins";a:5:{s:14:"starcat-review";O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";N;s:5:"title";s:14:"Starcat Review";s:4:"slug";s:14:"starcat-review";s:12:"premium_slug";s:22:"starcat-review-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:33:"starcat-review/starcat-review.php";s:7:"version";s:7:"0.6.1.1";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:3:"Pro";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_ad2b6650d9ef2e5df3c203ea9046f";s:10:"secret_key";s:32:"sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;";s:2:"id";s:4:"3980";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:18:"starcat-reviews-ct";O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:39:"Starcat Review - Comparison Table Addon";s:4:"slug";s:18:"starcat-reviews-ct";s:12:"premium_slug";s:26:"starcat-reviews-ct-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:39:"starcat-review-ct/starcat-review-ct.php";s:7:"version";s:3:"0.2";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_3c2fb3e4708761d01d68bae1a5cef";s:10:"secret_key";s:32:"sk_ogM~u#r:^-B=P~7Km=mnr~$6*K-#y";s:2:"id";s:4:"5890";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:17:"starcat-review-pr";O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:36:"Starcat Review - Photo Reviews Addon";s:4:"slug";s:17:"starcat-review-pr";s:12:"premium_slug";s:25:"starcat-review-pr-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";s:7:"version";s:5:"0.1.2";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_2d65437248d1c071675859b79f517";s:10:"secret_key";s:32:"sk_HNY6{TLf.<xoSA[=SA<oih%.jk5v_";s:2:"id";s:4:"6208";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:19:"starcat-reviews-cpt";O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:26:"Starcat Review - CPT Addon";s:4:"slug";s:19:"starcat-reviews-cpt";s:12:"premium_slug";s:27:"starcat-reviews-cpt-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:41:"starcat-review-cpt/starcat-review-cpt.php";s:7:"version";s:5:"0.3.1";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_8fddc58480a7e2a5406422a545c05";s:10:"secret_key";N;s:2:"id";s:4:"5122";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:25:"starcat-review-woo-notify";O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:46:"Starcat Review - Woocommerce Notfication Addon";s:4:"slug";s:25:"starcat-review-woo-notify";s:12:"premium_slug";s:33:"starcat-review-woo-notify-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";s:7:"version";s:3:"0.2";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_e9a5e492ae277b93cc518c49f6533";s:10:"secret_key";s:32:"sk_>}T_4FJi#DZ-b!2MO;15%EQy.k0wD";s:2:"id";s:4:"5788";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:9:"unique_id";s:32:"83c8a28fd18df9977c02dab10759d85a";s:13:"admin_notices";a:4:{s:14:"starcat-review";a:0:{}s:18:"starcat-reviews-ct";a:0:{}s:17:"starcat-review-pr";a:0:{}s:25:"starcat-review-woo-notify";a:0:{}}s:5:"plans";a:5:{s:14:"starcat-review";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:8:"YmFzaWM=";s:5:"title";s:8:"QmFzaWM=";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:0:"";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";s:4:"Nw==";s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:8:"ODIyMA==";s:7:"updated";s:28:"MjAyMC0wNy0xNSAwNToyMzoyOQ==";s:7:"created";s:28:"MjAxOS0xMi0wMiAwNjo0NDo0NA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:8:"ZnJlZQ==";s:5:"title";s:8:"RnJlZQ==";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:8:"MTA3OTU=";s:7:"updated";s:28:"MjAyMC0wNy0yNCAxMTozNjoxMg==";s:7:"created";s:28:"MjAyMC0wNy0yMyAxMTozMDo1Mg==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:18:"starcat-reviews-ct";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"NTg5MA==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"OTY0OQ==";s:7:"updated";N;s:7:"created";s:28:"MjAyMC0wNC0xNiAxNDo1MzoxOQ==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:17:"starcat-review-pr";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"NjIwOA==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"MTAxMzg=";s:7:"updated";N;s:7:"created";s:28:"MjAyMC0wNS0yNiAxMDozMjo1MA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:25:"starcat-review-woo-notify";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"NTc4OA==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"OTQ1Mw==";s:7:"updated";N;s:7:"created";s:28:"MjAyMC0wMy0yNSAwNTowODozOQ==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:19:"starcat-reviews-cpt";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"NTEyMg==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:4:"MQ==";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";s:4:"Nw==";s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"ODI1Mg==";s:7:"updated";s:28:"MjAyMC0wNS0yOCAwNTo0ODo1NQ==";s:7:"created";s:28:"MjAxOS0xMi0wNCAwNTo1NzowMQ==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:14:"active_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1598246592;s:3:"md5";s:32:"571f282de5d3c911e697cbcd8a3f75a4";s:7:"plugins";a:7:{s:33:"starcat-review/starcat-review.php";a:5:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:3:"0.5";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:27:"woocommerce/woocommerce.php";a:5:{s:4:"slug";s:11:"woocommerce";s:7:"version";s:5:"4.1.1";s:5:"title";s:11:"WooCommerce";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:31:"wp-migrate-db/wp-migrate-db.php";a:5:{s:4:"slug";s:13:"wp-migrate-db";s:7:"version";s:6:"1.0.13";s:5:"title";s:13:"WP Migrate DB";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:39:"starcat-review-ct/starcat-review-ct.php";a:5:{s:4:"slug";s:18:"starcat-reviews-ct";s:7:"version";s:3:"0.2";s:5:"title";s:39:"Starcat Review - Comparison Table Addon";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:41:"starcat-review-cpt/starcat-review-cpt.php";a:18:{s:20:"WC requires at least";s:0:"";s:15:"WC tested up to";s:0:"";s:3:"Woo";s:0:"";s:4:"Name";s:26:"Starcat Review - CPT Addon";s:9:"PluginURI";s:21:"https://starcatwp.com";s:7:"Version";s:5:"0.3.1";s:11:"Description";s:57:"Creates a Custom Post Type for your Starcat Review Plugin";s:6:"Author";s:9:"StarcatWP";s:9:"AuthorURI";s:19:"http://helpiewp.com";s:10:"TextDomain";s:18:"starcat-review-cpt";s:10:"DomainPath";s:10:"/languages";s:7:"Network";b:1;s:10:"RequiresWP";s:0:"";s:11:"RequiresPHP";s:0:"";s:5:"Title";s:26:"Starcat Review - CPT Addon";s:10:"AuthorName";s:9:"StarcatWP";s:9:"is_active";b:1;s:4:"slug";s:19:"starcat-reviews-cpt";}s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";a:18:{s:20:"WC requires at least";s:0:"";s:15:"WC tested up to";s:0:"";s:3:"Woo";s:0:"";s:4:"Name";s:36:"Starcat Review - Photo Reviews Addon";s:9:"PluginURI";s:21:"https://starcatwp.com";s:7:"Version";s:5:"0.1.2";s:11:"Description";s:24:"Add photo to your review";s:6:"Author";s:9:"StarcatWP";s:9:"AuthorURI";s:20:"http://starcatwp.com";s:10:"TextDomain";s:17:"starcat-review-pr";s:10:"DomainPath";s:10:"/languages";s:7:"Network";b:0;s:10:"RequiresWP";s:0:"";s:11:"RequiresPHP";s:0:"";s:5:"Title";s:36:"Starcat Review - Photo Reviews Addon";s:10:"AuthorName";s:9:"StarcatWP";s:9:"is_active";b:1;s:4:"slug";s:17:"starcat-review-pr";}s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";a:18:{s:20:"WC requires at least";s:0:"";s:15:"WC tested up to";s:0:"";s:3:"Woo";s:0:"";s:4:"Name";s:46:"Starcat Review - Woocommerce Notfication Addon";s:9:"PluginURI";s:21:"https://starcatwp.com";s:7:"Version";s:3:"0.2";s:11:"Description";s:59:"Send Notification for Purchasing Orders and Product Ratings";s:6:"Author";s:9:"StarcatWP";s:9:"AuthorURI";s:19:"http://helpiewp.com";s:10:"TextDomain";s:27:"starcat-review-notification";s:10:"DomainPath";s:10:"/languages";s:7:"Network";b:1;s:10:"RequiresWP";s:0:"";s:11:"RequiresPHP";s:0:"";s:5:"Title";s:46:"Starcat Review - Woocommerce Notfication Addon";s:10:"AuthorName";s:9:"StarcatWP";s:9:"is_active";b:1;s:4:"slug";s:25:"starcat-review-woo-notify";}}}s:11:"all_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1598246592;s:3:"md5";s:32:"951c915a75a8c924087bd9facc79cbd5";s:7:"plugins";a:9:{s:33:"starcat-review/starcat-review.php";a:6:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:3:"0.5";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;s:7:"Version";s:7:"0.6.1.1";}s:27:"woocommerce/woocommerce.php";a:6:{s:4:"slug";s:11:"woocommerce";s:7:"version";s:5:"4.1.1";s:5:"title";s:11:"WooCommerce";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;s:7:"Version";s:5:"4.4.1";}s:31:"wp-migrate-db/wp-migrate-db.php";a:6:{s:4:"slug";s:13:"wp-migrate-db";s:7:"version";s:6:"1.0.13";s:5:"title";s:13:"WP Migrate DB";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;s:7:"Version";s:6:"1.0.15";}s:19:"akismet/akismet.php";a:5:{s:4:"slug";s:7:"akismet";s:7:"version";s:5:"4.1.6";s:5:"title";s:17:"Akismet Anti-Spam";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:9:"hello.php";a:5:{s:4:"slug";s:11:"hello-dolly";s:7:"version";s:5:"1.7.2";s:5:"title";s:11:"Hello Dolly";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:39:"starcat-review-ct/starcat-review-ct.php";a:5:{s:4:"slug";s:18:"starcat-reviews-ct";s:7:"version";s:3:"0.2";s:5:"title";s:39:"Starcat Review - Comparison Table Addon";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:41:"starcat-review-cpt/starcat-review-cpt.php";a:5:{s:4:"slug";s:18:"starcat-review-cpt";s:7:"version";s:5:"0.3.1";s:5:"title";s:26:"Starcat Review - CPT Addon";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:61:"starcat-review-photo-reviews/starcat-review-photo-reviews.php";a:5:{s:4:"slug";s:28:"starcat-review-photo-reviews";s:7:"version";s:5:"0.1.2";s:5:"title";s:36:"Starcat Review - Photo Reviews Addon";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";a:5:{s:4:"slug";s:25:"starcat-review-woo-notify";s:7:"version";s:3:"0.2";s:5:"title";s:46:"Starcat Review - Woocommerce Notfication Addon";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}}}s:10:"all_themes";O:8:"stdClass":3:{s:9:"timestamp";i:1598246592;s:3:"md5";s:32:"51a30f098c9f8bfe8a6d09183194cf1c";s:6:"themes";a:3:{s:14:"twentynineteen";a:5:{s:4:"slug";s:14:"twentynineteen";s:7:"version";s:3:"1.7";s:5:"title";s:15:"Twenty Nineteen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:15:"twentyseventeen";a:5:{s:4:"slug";s:15:"twentyseventeen";s:7:"version";s:3:"2.4";s:5:"title";s:16:"Twenty Seventeen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:12:"twentytwenty";a:5:{s:4:"slug";s:12:"twentytwenty";s:7:"version";s:3:"1.5";s:5:"title";s:13:"Twenty Twenty";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:5:"sites";a:5:{s:14:"starcat-review";O:7:"FS_Site":26:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:5:"title";s:10:"Fresh Site";s:3:"url";s:19:"http://127.0.0.1:83";s:7:"version";s:7:"0.6.1.1";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:3:"5.5";s:11:"sdk_version";s:7:"2.4.0.1";s:28:"programming_language_version";s:5:"7.4.9";s:7:"plan_id";s:4:"8220";s:10:"license_id";s:6:"318957";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_ce87a1a7f621565a9b353ea4341e0";s:10:"secret_key";s:32:"sk_10(*5=5>4U:2V=-)bN8;~*-F9WDj3";s:2:"id";s:7:"4676617";s:7:"updated";s:19:"2020-08-24 05:26:39";s:7:"created";s:19:"2020-05-21 11:57:09";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:18:"starcat-reviews-ct";O:7:"FS_Site":26:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"1131140";s:5:"title";s:10:"Fresh Site";s:3:"url";s:19:"http://127.0.0.1:83";s:7:"version";s:3:"0.2";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:3:"5.5";s:11:"sdk_version";s:7:"2.4.0.1";s:28:"programming_language_version";s:5:"7.4.9";s:7:"plan_id";s:4:"9649";s:10:"license_id";s:6:"381930";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_eb2fdd1c24fc5c71b784f25c471bf";s:10:"secret_key";s:32:"sk_jS?Dvz<=UynIKR@?1<gc[P}E}1[h{";s:2:"id";s:7:"4703946";s:7:"updated";s:19:"2020-08-24 05:16:05";s:7:"created";s:19:"2020-05-25 06:30:02";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:17:"starcat-review-pr";O:7:"FS_Site":26:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:5:"title";s:10:"Fresh Site";s:3:"url";s:19:"http://127.0.0.1:83";s:7:"version";s:5:"0.1.2";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:3:"5.5";s:11:"sdk_version";s:7:"2.4.0.1";s:28:"programming_language_version";s:5:"7.4.9";s:7:"plan_id";s:5:"10138";s:10:"license_id";s:6:"360147";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_203c071b6f4393d140a596945a9b8";s:10:"secret_key";s:32:"sk_)U]@tK>6-b61>R{46f%2izd.J0-^c";s:2:"id";s:7:"4713492";s:7:"updated";s:19:"2020-08-23 19:03:48";s:7:"created";s:19:"2020-05-26 10:50:46";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:25:"starcat-review-woo-notify";O:7:"FS_Site":26:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:5:"title";s:10:"Fresh Site";s:3:"url";s:19:"http://127.0.0.1:83";s:7:"version";s:3:"0.2";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:3:"5.5";s:11:"sdk_version";s:7:"2.4.0.1";s:28:"programming_language_version";s:5:"7.4.9";s:7:"plan_id";s:4:"9453";s:10:"license_id";s:6:"324121";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_c291f7144899ae4a5e4b2a69318d0";s:10:"secret_key";s:32:"sk_(B4UIQCbVzD*]>$_A6IX_m9cm}_2a";s:2:"id";s:7:"4820376";s:7:"updated";s:19:"2020-08-23 19:00:20";s:7:"created";s:19:"2020-06-09 07:37:09";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:19:"starcat-reviews-cpt";O:7:"FS_Site":26:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:5:"title";s:10:"Fresh Site";s:3:"url";s:19:"http://127.0.0.1:83";s:7:"version";s:5:"0.3.1";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:3:"5.5";s:11:"sdk_version";s:7:"2.4.0.1";s:28:"programming_language_version";s:5:"7.4.9";s:7:"plan_id";s:4:"8252";s:10:"license_id";s:6:"328188";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_49dad514004cc1f907d4c7f1b195c";s:10:"secret_key";s:32:"sk_xZYHZ%_NxXoz!#!tCob4x3W5z?AL>";s:2:"id";s:7:"4703836";s:7:"updated";s:19:"2020-08-24 05:23:13";s:7:"created";s:19:"2020-05-25 06:01:04";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:5:"users";a:1:{i:1131140;O:7:"FS_User":14:{s:5:"email";s:22:"essekiarockz@gmail.com";s:5:"first";s:7:"essekia";s:4:"last";s:4:"Paul";s:11:"is_verified";b:1;s:7:"is_beta";b:1;s:11:"customer_id";s:18:"cus_Ec0muPO1yhakcJ";s:5:"gross";i:0;s:10:"public_key";s:32:"pk_3105e0154533dee39ca36264246cb";s:10:"secret_key";s:32:"sk_G6@FredUE@fnGDDzIEzatFjEuZ@jm";s:2:"id";s:7:"1131140";s:7:"updated";s:19:"2020-04-28 06:31:38";s:7:"created";s:19:"2018-04-26 11:25:56";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:23:"user_id_license_ids_map";a:5:{i:3980;a:1:{i:1131140;a:4:{i:0;i:412534;i:1;i:380280;i:2;i:318957;i:3;i:91267;}}i:5890;a:1:{i:1131140;a:3:{i:0;i:383162;i:1;i:360158;i:2;i:381930;}}i:6208;a:1:{i:1131140;a:3:{i:0;i:383163;i:1;i:379150;i:2;i:360147;}}i:5788;a:1:{i:1131140;a:2:{i:0;i:383165;i:1;i:324121;}}i:5122;a:1:{i:1131140;a:4:{i:0;i:383164;i:1;i:330613;i:2;i:328188;i:3;i:264059;}}}s:12:"all_licenses";a:5:{i:3980;a:4:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:1;s:2:"id";s:6:"412534";s:7:"updated";s:19:"2020-08-24 05:26:39";s:7:"created";s:19:"2020-08-24 05:25:23";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"personal";s:17:"parent_plan_title";s:8:"Personal";s:17:"parent_license_id";s:6:"272391";s:8:"products";N;s:10:"pricing_id";s:4:"7997";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:4;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"380280";s:7:"updated";s:19:"2020-08-24 05:25:23";s:7:"created";s:19:"2020-06-26 07:46:52";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"7999";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-03-30 05:16:54";s:10:"secret_key";s:32:"sk_PiO^mumFrT;<4uK7YJ[jy$wm!DZjF";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"318957";s:7:"updated";s:19:"2020-08-24 05:26:39";s:7:"created";s:19:"2020-03-30 05:16:54";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:3;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"6406";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"5702";s:5:"quota";i:27;s:9:"activated";i:3;s:15:"activated_local";i:20;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_(H7lEoP+P<W5g?P%P#X@%}*j+&e>@";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:5:"91267";s:7:"updated";s:19:"2020-07-07 04:18:46";s:7:"created";s:19:"2019-06-19 06:20:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}i:5890;a:3:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9649";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";s:4:"9683";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383162";s:7:"updated";s:19:"2020-07-17 10:40:16";s:7:"created";s:19:"2020-07-01 13:26:55";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9649";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:4;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"360158";s:7:"updated";s:19:"2020-07-17 12:28:42";s:7:"created";s:19:"2020-05-26 11:31:21";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"3249035";s:7:"plan_id";s:4:"9649";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"9683";s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-06-29 17:00:45";s:10:"secret_key";s:32:"sk_J)t}lYa*TZ-$PLR=fRj50=^jYcL<V";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"381930";s:7:"updated";s:19:"2020-08-15 07:44:46";s:7:"created";s:19:"2020-06-29 17:00:45";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}i:6208;a:3:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";s:5:"10638";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383163";s:7:"updated";s:19:"2020-07-17 10:39:06";s:7:"created";s:19:"2020-07-01 13:27:36";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"379150";s:7:"updated";s:19:"2020-07-17 12:28:42";s:7:"created";s:19:"2020-06-24 12:21:00";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:16:"parent_plan_name";s:8:"personal";s:17:"parent_plan_title";s:8:"Personal";s:17:"parent_license_id";s:6:"272391";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:5;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"360147";s:7:"updated";s:19:"2020-08-20 14:54:54";s:7:"created";s:19:"2020-05-26 11:14:22";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}i:5788;a:2:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383165";s:7:"updated";s:19:"2020-07-01 13:29:05";s:7:"created";s:19:"2020-07-01 13:29:05";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:16:"parent_plan_name";s:8:"personal";s:17:"parent_plan_title";s:8:"Personal";s:17:"parent_license_id";s:6:"272391";s:8:"products";N;s:10:"pricing_id";s:4:"9397";s:5:"quota";i:1;s:9:"activated";i:1;s:15:"activated_local";i:7;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"324121";s:7:"updated";s:19:"2020-07-07 08:25:37";s:7:"created";s:19:"2020-04-07 07:22:18";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}i:5122;a:4:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";s:4:"8108";s:5:"quota";i:50;s:9:"activated";i:3;s:15:"activated_local";i:2;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383164";s:7:"updated";s:19:"2020-08-24 05:23:12";s:7:"created";s:19:"2020-07-01 13:28:44";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"8106";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2020-04-23 11:09:03";s:10:"secret_key";s:32:"sk_Bi5zru;W!#EMtxA3a9ru37F(cUS5D";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"330613";s:7:"updated";s:19:"2020-04-18 14:21:34";s:7:"created";s:19:"2020-04-16 11:09:03";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:1;s:15:"activated_local";i:11;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"328188";s:7:"updated";s:19:"2020-08-24 05:23:13";s:7:"created";s:19:"2020-04-13 06:43:15";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:3;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"8106";s:5:"quota";i:14;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-12-05 06:29:38";s:10:"secret_key";s:32:"sk_bqyiT7hKy.zJXWIXLa_*AorB^yRh4";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"264059";s:7:"updated";s:19:"2020-07-27 03:45:10";s:7:"created";s:19:"2019-12-04 06:29:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"updates";a:1:{i:3980;N;}s:6:"addons";a:1:{i:3980;a:4:{i:0;O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:19:"Starcat Reviews CPT";s:4:"slug";s:23:"starcat-review-cpt-free";s:12:"premium_slug";s:18:"starcat-review-cpt";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:0;s:22:"premium_releases_count";i:5;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5122";s:11:"description";N;s:17:"short_description";s:40:"Adds a custom post type just for reviews";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1313";s:7:"updated";s:19:"2020-04-13 11:25:30";s:7:"created";s:19:"2019-12-23 11:11:28";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_8fddc58480a7e2a5406422a545c05";s:10:"secret_key";N;s:2:"id";s:4:"5122";s:7:"updated";s:19:"2020-08-23 18:59:21";s:7:"created";s:19:"2019-12-04 05:48:38";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:40:"Starcat Reviews Woocommerce Notification";s:4:"slug";s:25:"starcat-review-woo-notify";s:12:"premium_slug";s:33:"starcat-review-woo-notify-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:2;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5788";s:11:"description";N;s:17:"short_description";s:97:"Lets you send notifications with review links when users place an order on your Woocommerce Store";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1546";s:7:"updated";N;s:7:"created";s:19:"2020-04-13 11:26:14";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_e9a5e492ae277b93cc518c49f6533";s:10:"secret_key";N;s:2:"id";s:4:"5788";s:7:"updated";s:19:"2020-08-14 00:41:00";s:7:"created";s:19:"2020-03-25 05:07:42";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:34:"Starcat Reviews - Comparison Table";s:4:"slug";s:17:"starcat-review-ct";s:12:"premium_slug";s:25:"starcat-review-ct-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:2;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5890";s:11:"description";N;s:17:"short_description";N;s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1555";s:7:"updated";N;s:7:"created";s:19:"2020-04-17 13:58:53";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_3c2fb3e4708761d01d68bae1a5cef";s:10:"secret_key";N;s:2:"id";s:4:"5890";s:7:"updated";s:19:"2020-08-04 03:42:50";s:7:"created";s:19:"2020-04-16 14:52:42";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:3;O:9:"FS_Plugin":24:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:30:"Starcat Review - Photo Reviews";s:4:"slug";s:17:"starcat-review-pr";s:12:"premium_slug";s:25:"starcat-review-pr-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:3;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:17:"bundle_public_key";N;s:10:"public_key";s:32:"pk_2d65437248d1c071675859b79f517";s:10:"secret_key";N;s:2:"id";s:4:"6208";s:7:"updated";s:19:"2020-08-22 11:00:25";s:7:"created";s:19:"2020-05-26 10:12:20";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:14:"account_addons";a:1:{i:3980;a:4:{i:0;s:4:"5122";i:1;s:4:"5788";i:2;s:4:"5890";i:3;s:4:"6208";}}}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(150, 'fs_api_cache', 'a:16:{s:74:"get:/v1/users/1131140/plugins/5788/parent_licenses.json?filter=activatable";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:1:{i:0;O:8:"stdClass":27:{s:15:"subscription_id";N;s:12:"next_payment";N;s:17:"parent_license_id";N;s:24:"parent_license_bundle_id";s:4:"5099";s:17:"parent_plan_title";N;s:16:"parent_plan_name";N;s:9:"plugin_id";s:4:"5099";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8331";s:10:"pricing_id";s:4:"8176";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"272391";s:7:"created";s:19:"2019-12-23 04:24:08";s:7:"updated";N;s:14:"children_plans";O:8:"stdClass":3:{s:4:"3980";s:4:"8220";s:4:"5788";s:4:"9453";s:4:"6208";s:5:"10138";}s:11:"plugin_type";s:6:"bundle";s:8:"products";a:3:{i:0;i:3980;i:1;i:5788;i:2;i:6208;}}}}s:7:"created";i:1598246368;s:9:"timestamp";i:1598332768;}s:29:"get:/v1/installs/4820376.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":31:{s:7:"site_id";s:8:"28388562";s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:3:"url";s:19:"http://127.0.0.1:83";s:5:"title";s:10:"Fresh Site";s:7:"version";s:3:"0.2";s:7:"plan_id";s:4:"9453";s:10:"license_id";s:6:"324121";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:15:"subscription_id";N;s:5:"gross";i:0;s:12:"country_code";s:2:"in";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"5.4.2";s:11:"sdk_version";s:5:"2.3.0";s:28:"programming_language_version";s:5:"7.4.8";s:9:"is_active";b:1;s:15:"is_disconnected";b:0;s:10:"is_premium";b:1;s:14:"is_uninstalled";b:0;s:9:"is_locked";b:0;s:6:"source";i:0;s:8:"upgraded";N;s:12:"last_seen_at";s:19:"2020-08-24 05:19:38";s:10:"secret_key";s:32:"sk_(B4UIQCbVzD*]>$_A6IX_m9cm}_2a";s:10:"public_key";s:32:"pk_c291f7144899ae4a5e4b2a69318d0";s:2:"id";s:7:"4820376";s:7:"created";s:19:"2020-06-09 07:37:09";s:7:"updated";s:19:"2020-08-23 19:00:20";}s:7:"created";i:1598246368;s:9:"timestamp";i:1598332768;}s:63:"get:/v1/users/1131140/plugins/5788/plans.json?show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:5:"plans";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"5788";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:2:"id";s:4:"9453";s:7:"updated";N;s:7:"created";s:19:"2020-03-25 05:08:39";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246368;s:9:"timestamp";i:1598332768;}s:65:"get:/v1/users/1131140/plugins/5788/licenses.json?is_enriched=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:2:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383165";s:7:"updated";s:19:"2020-07-01 13:29:05";s:7:"created";s:19:"2020-07-01 13:29:05";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:16:"parent_plan_name";s:8:"personal";s:17:"parent_plan_title";s:8:"Personal";s:17:"parent_license_id";s:6:"272391";s:8:"products";N;s:10:"pricing_id";s:4:"9397";s:5:"quota";i:1;s:9:"activated";i:1;s:15:"activated_local";i:7;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"324121";s:7:"updated";s:19:"2020-07-07 08:25:37";s:7:"created";s:19:"2020-04-07 07:22:18";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246368;s:9:"timestamp";i:1598332768;}s:59:"get:/v1/installs/4820376/licenses/272391/subscriptions.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:13:"subscriptions";a:0:{}}s:7:"created";i:1598246368;s:9:"timestamp";i:1598332768;}s:77:"get:/v1/installs/4676617/addons.json?enriched=true&count=50&show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:7:"plugins";a:4:{i:0;O:8:"stdClass":32:{s:16:"parent_plugin_id";s:4:"3980";s:12:"developer_id";s:4:"3057";s:10:"install_id";s:7:"3535949";s:4:"slug";s:23:"starcat-review-cpt-free";s:5:"title";s:19:"Starcat Reviews CPT";s:11:"environment";i:0;s:4:"icon";N;s:15:"default_plan_id";s:4:"8252";s:5:"plans";i:8252;s:8:"features";N;s:17:"money_back_period";N;s:13:"refund_policy";N;s:24:"annual_renewals_discount";N;s:22:"renewals_discount_type";s:0:"";s:11:"is_released";b:1;s:15:"is_sdk_required";b:1;s:18:"is_pricing_visible";b:1;s:19:"is_wp_org_compliant";b:0;s:6:"is_off";b:0;s:24:"is_only_for_new_installs";b:0;s:14:"installs_limit";N;s:19:"free_releases_count";i:1;s:22:"premium_releases_count";i:5;s:17:"accepted_payments";i:0;s:7:"plan_id";s:1:"0";s:4:"type";s:6:"plugin";s:10:"public_key";s:32:"pk_8fddc58480a7e2a5406422a545c05";s:2:"id";s:4:"5122";s:7:"created";s:19:"2019-12-04 05:48:38";s:7:"updated";s:19:"2020-08-23 18:59:21";s:4:"info";O:8:"stdClass":13:{s:9:"plugin_id";s:4:"5122";s:3:"url";N;s:11:"description";N;s:17:"short_description";s:40:"Adds a custom post type just for reviews";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1313";s:7:"created";s:19:"2019-12-23 11:11:28";s:7:"updated";s:19:"2020-04-13 11:25:30";}s:12:"premium_slug";s:18:"starcat-review-cpt";}i:1;O:8:"stdClass":32:{s:16:"parent_plugin_id";s:4:"3980";s:12:"developer_id";s:4:"3057";s:10:"install_id";s:7:"4195362";s:4:"slug";s:25:"starcat-review-woo-notify";s:5:"title";s:40:"Starcat Reviews Woocommerce Notification";s:11:"environment";i:0;s:4:"icon";N;s:15:"default_plan_id";s:4:"9453";s:5:"plans";i:9453;s:8:"features";N;s:17:"money_back_period";N;s:13:"refund_policy";N;s:24:"annual_renewals_discount";N;s:22:"renewals_discount_type";s:0:"";s:11:"is_released";b:1;s:15:"is_sdk_required";b:1;s:18:"is_pricing_visible";b:1;s:19:"is_wp_org_compliant";b:1;s:6:"is_off";b:0;s:24:"is_only_for_new_installs";b:0;s:14:"installs_limit";N;s:19:"free_releases_count";i:0;s:22:"premium_releases_count";i:2;s:17:"accepted_payments";i:0;s:7:"plan_id";s:1:"0";s:4:"type";s:6:"plugin";s:10:"public_key";s:32:"pk_e9a5e492ae277b93cc518c49f6533";s:2:"id";s:4:"5788";s:7:"created";s:19:"2020-03-25 05:07:42";s:7:"updated";s:19:"2020-08-14 00:41:00";s:4:"info";O:8:"stdClass":13:{s:9:"plugin_id";s:4:"5788";s:3:"url";N;s:11:"description";N;s:17:"short_description";s:97:"Lets you send notifications with review links when users place an order on your Woocommerce Store";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1546";s:7:"created";s:19:"2020-04-13 11:26:14";s:7:"updated";N;}s:12:"premium_slug";s:33:"starcat-review-woo-notify-premium";}i:2;O:8:"stdClass":32:{s:16:"parent_plugin_id";s:4:"3980";s:12:"developer_id";s:4:"3057";s:10:"install_id";s:7:"4378131";s:4:"slug";s:17:"starcat-review-ct";s:5:"title";s:34:"Starcat Reviews - Comparison Table";s:11:"environment";i:0;s:4:"icon";N;s:15:"default_plan_id";s:4:"9649";s:5:"plans";i:9649;s:8:"features";N;s:17:"money_back_period";N;s:13:"refund_policy";N;s:24:"annual_renewals_discount";N;s:22:"renewals_discount_type";s:0:"";s:11:"is_released";b:1;s:15:"is_sdk_required";b:1;s:18:"is_pricing_visible";b:1;s:19:"is_wp_org_compliant";b:1;s:6:"is_off";b:0;s:24:"is_only_for_new_installs";b:0;s:14:"installs_limit";N;s:19:"free_releases_count";i:0;s:22:"premium_releases_count";i:2;s:17:"accepted_payments";i:0;s:7:"plan_id";s:1:"0";s:4:"type";s:6:"plugin";s:10:"public_key";s:32:"pk_3c2fb3e4708761d01d68bae1a5cef";s:2:"id";s:4:"5890";s:7:"created";s:19:"2020-04-16 14:52:42";s:7:"updated";s:19:"2020-08-04 03:42:50";s:4:"info";O:8:"stdClass":13:{s:9:"plugin_id";s:4:"5890";s:3:"url";N;s:11:"description";N;s:17:"short_description";N;s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1555";s:7:"created";s:19:"2020-04-17 13:58:53";s:7:"updated";N;}s:12:"premium_slug";s:25:"starcat-review-ct-premium";}i:3;O:8:"stdClass":31:{s:16:"parent_plugin_id";s:4:"3980";s:12:"developer_id";s:4:"3057";s:10:"install_id";s:7:"4713248";s:4:"slug";s:17:"starcat-review-pr";s:5:"title";s:30:"Starcat Review - Photo Reviews";s:11:"environment";i:0;s:4:"icon";N;s:15:"default_plan_id";s:5:"10138";s:5:"plans";i:10138;s:8:"features";N;s:17:"money_back_period";N;s:13:"refund_policy";N;s:24:"annual_renewals_discount";N;s:22:"renewals_discount_type";s:0:"";s:11:"is_released";b:1;s:15:"is_sdk_required";b:1;s:18:"is_pricing_visible";b:1;s:19:"is_wp_org_compliant";b:1;s:6:"is_off";b:0;s:24:"is_only_for_new_installs";b:0;s:14:"installs_limit";N;s:19:"free_releases_count";i:0;s:22:"premium_releases_count";i:3;s:17:"accepted_payments";i:0;s:7:"plan_id";s:1:"0";s:4:"type";s:6:"plugin";s:10:"public_key";s:32:"pk_2d65437248d1c071675859b79f517";s:2:"id";s:4:"6208";s:7:"created";s:19:"2020-05-26 10:12:20";s:7:"updated";s:19:"2020-08-22 11:00:25";s:12:"premium_slug";s:25:"starcat-review-pr-premium";}}}s:7:"created";i:1598246385;s:9:"timestamp";i:1598332785;}s:71:"get:/v1/plugins/3980/addons/pricing.json?type=visible&show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:6:"addons";a:4:{i:0;O:8:"stdClass":2:{s:2:"id";i:5122;s:5:"plans";a:1:{i:0;O:8:"stdClass":23:{s:9:"plugin_id";s:4:"5122";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:25:"is_block_features_monthly";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";i:7;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:9:"is_hidden";b:0;s:2:"id";s:4:"8252";s:7:"created";s:19:"2019-12-04 05:57:01";s:7:"updated";s:19:"2020-05-28 05:48:55";s:7:"pricing";a:3:{i:0;O:8:"stdClass":10:{s:7:"plan_id";s:4:"8252";s:8:"licenses";i:1;s:13:"monthly_price";N;s:12:"annual_price";d:19.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"8106";s:7:"created";s:19:"2019-12-04 05:57:16";s:7:"updated";s:19:"2020-01-08 10:41:58";s:8:"currency";s:3:"usd";}i:1;O:8:"stdClass":10:{s:7:"plan_id";s:4:"8252";s:8:"licenses";i:5;s:13:"monthly_price";N;s:12:"annual_price";d:39.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"8107";s:7:"created";s:19:"2019-12-04 05:57:18";s:7:"updated";s:19:"2020-01-09 05:12:42";s:8:"currency";s:3:"usd";}i:2;O:8:"stdClass":10:{s:7:"plan_id";s:4:"8252";s:8:"licenses";i:50;s:13:"monthly_price";N;s:12:"annual_price";d:79.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"8108";s:7:"created";s:19:"2019-12-04 05:57:27";s:7:"updated";s:19:"2020-01-09 05:12:45";s:8:"currency";s:3:"usd";}}}}}i:1;O:8:"stdClass":2:{s:2:"id";i:5788;s:5:"plans";a:1:{i:0;O:8:"stdClass":23:{s:9:"plugin_id";s:4:"5788";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:25:"is_block_features_monthly";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:9:"is_hidden";b:0;s:2:"id";s:4:"9453";s:7:"created";s:19:"2020-03-25 05:08:39";s:7:"updated";N;s:7:"pricing";a:1:{i:0;O:8:"stdClass":10:{s:7:"plan_id";s:4:"9453";s:8:"licenses";i:1;s:13:"monthly_price";N;s:12:"annual_price";i:19;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"9397";s:7:"created";s:19:"2020-03-25 05:08:53";s:7:"updated";s:19:"2020-03-25 05:08:54";s:8:"currency";s:3:"usd";}}}}}i:2;O:8:"stdClass":2:{s:2:"id";i:5890;s:5:"plans";a:1:{i:0;O:8:"stdClass":23:{s:9:"plugin_id";s:4:"5890";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:25:"is_block_features_monthly";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:9:"is_hidden";b:0;s:2:"id";s:4:"9649";s:7:"created";s:19:"2020-04-16 14:53:19";s:7:"updated";N;s:7:"pricing";a:3:{i:0;O:8:"stdClass":10:{s:7:"plan_id";s:4:"9649";s:8:"licenses";i:1;s:13:"monthly_price";N;s:12:"annual_price";d:19.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"9681";s:7:"created";s:19:"2020-04-16 15:05:42";s:7:"updated";s:19:"2020-04-16 15:05:44";s:8:"currency";s:3:"usd";}i:1;O:8:"stdClass":10:{s:7:"plan_id";s:4:"9649";s:8:"licenses";i:5;s:13:"monthly_price";N;s:12:"annual_price";d:39.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"9682";s:7:"created";s:19:"2020-04-16 15:06:16";s:7:"updated";s:19:"2020-04-16 15:06:23";s:8:"currency";s:3:"usd";}i:2;O:8:"stdClass":10:{s:7:"plan_id";s:4:"9649";s:8:"licenses";i:50;s:13:"monthly_price";N;s:12:"annual_price";d:69.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:4:"9683";s:7:"created";s:19:"2020-04-16 15:06:27";s:7:"updated";s:19:"2020-04-16 15:06:39";s:8:"currency";s:3:"usd";}}}}}i:3;O:8:"stdClass":2:{s:2:"id";i:6208;s:5:"plans";a:1:{i:0;O:8:"stdClass":23:{s:9:"plugin_id";s:4:"6208";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:25:"is_block_features_monthly";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:9:"is_hidden";b:0;s:2:"id";s:5:"10138";s:7:"created";s:19:"2020-05-26 10:32:50";s:7:"updated";N;s:7:"pricing";a:3:{i:0;O:8:"stdClass":10:{s:7:"plan_id";s:5:"10138";s:8:"licenses";i:1;s:13:"monthly_price";N;s:12:"annual_price";d:19.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:5:"10636";s:7:"created";s:19:"2020-06-25 11:10:47";s:7:"updated";s:19:"2020-06-25 11:11:16";s:8:"currency";s:3:"usd";}i:1;O:8:"stdClass":10:{s:7:"plan_id";s:5:"10138";s:8:"licenses";i:5;s:13:"monthly_price";N;s:12:"annual_price";d:39.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:5:"10637";s:7:"created";s:19:"2020-06-25 11:11:20";s:7:"updated";s:19:"2020-06-25 11:11:24";s:8:"currency";s:3:"usd";}i:2;O:8:"stdClass":10:{s:7:"plan_id";s:5:"10138";s:8:"licenses";i:50;s:13:"monthly_price";N;s:12:"annual_price";d:69.99;s:14:"lifetime_price";N;s:9:"is_hidden";b:0;s:2:"id";s:5:"10638";s:7:"created";s:19:"2020-06-25 11:11:29";s:7:"updated";s:19:"2020-06-25 11:11:37";s:8:"currency";s:3:"usd";}}}}}}}s:7:"created";i:1598247387;s:9:"timestamp";i:1598333787;}s:45:"get:/v1/users/1131140/plugins/5122/plans.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:5:"plans";a:1:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"5122";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";i:7;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:2:"id";s:4:"8252";s:7:"updated";s:19:"2020-05-28 05:48:55";s:7:"created";s:19:"2019-12-04 05:57:01";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246587;s:9:"timestamp";i:1598332987;}s:65:"get:/v1/users/1131140/plugins/5122/licenses.json?is_enriched=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:4:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"328435";s:8:"products";N;s:10:"pricing_id";s:4:"8108";s:5:"quota";i:50;s:9:"activated";i:3;s:15:"activated_local";i:2;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"383164";s:7:"updated";s:19:"2020-08-24 05:23:12";s:7:"created";s:19:"2020-07-01 13:28:44";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"8106";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2020-04-23 11:09:03";s:10:"secret_key";s:32:"sk_Bi5zru;W!#EMtxA3a9ru37F(cUS5D";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"330613";s:7:"updated";s:19:"2020-04-18 14:21:34";s:7:"created";s:19:"2020-04-16 11:09:03";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:1;s:15:"activated_local";i:11;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"328188";s:7:"updated";s:19:"2020-08-24 05:23:13";s:7:"created";s:19:"2020-04-13 06:43:15";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:3;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"8106";s:5:"quota";i:14;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-12-05 06:29:38";s:10:"secret_key";s:32:"sk_bqyiT7hKy.zJXWIXLa_*AorB^yRh4";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"264059";s:7:"updated";s:19:"2020-07-27 03:45:10";s:7:"created";s:19:"2019-12-04 06:29:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246587;s:9:"timestamp";i:1598332987;}s:81:"get:/v1/installs/4676617/updates/latest.json?is_premium=true&type=all&readme=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":17:{s:9:"plugin_id";s:4:"3980";s:12:"developer_id";s:4:"3846";s:4:"slug";N;s:12:"premium_slug";s:14:"starcat-review";s:7:"version";s:7:"0.6.1.1";s:11:"sdk_version";s:7:"2.4.0.1";s:25:"requires_platform_version";s:3:"5.2";s:20:"tested_up_to_version";s:3:"5.5";s:8:"has_free";b:1;s:11:"has_premium";b:1;s:12:"release_mode";s:7:"pending";s:2:"id";s:5:"20642";s:7:"created";s:19:"2020-08-22 11:00:07";s:7:"updated";s:19:"2020-08-22 11:00:58";s:11:"is_released";b:0;s:3:"url";s:386:"https://api.freemius.com/v1/installs/4676617/updates/20642.zip?is_premium=true&authorization=FSLA+4676617%3ApUWBmulud3V9lfsZzcb5jPmSGBrHFXrRrKOCdmdjfF8AELwmNxTBCn9EFmmNhbH8qh1W3IFREhP8gPH_auAb6AM79wZfQYGvkRCMnlg7gADoIQRQfeVovyR4X6UUvllw4vHK918GlJmkjb9hk3j9hY7nZyZl6sXuYvIfFMg_Q3euMpgA2AIxE4HyvuPwTfrU2RVK2GmrkPNzDoly5AWXgaD1l-dCj6hr68MRX4mg_0Pj5Nl6iVdeCQwZspZFC8trIr1D_CyVTLHHX6F5RUlBIg";s:6:"readme";O:8:"stdClass":10:{s:4:"name";s:50:"Starcat Review - WordPress Reviews & Rating Plugin";s:4:"slug";s:14:"starcat-review";s:4:"tags";O:8:"stdClass":6:{s:8:"helpdesk";s:8:"helpdesk";s:7:"support";s:7:"support";s:14:"knowledge base";s:14:"knowledge base";s:8:"customer";s:8:"customer";s:6:"helpie";s:6:"helpie";s:13:"documentation";s:13:"documentation";}s:8:"requires";s:3:"5.2";s:6:"tested";s:3:"5.5";s:10:"stable_tag";s:7:"0.6.1.1";s:8:"sections";O:8:"stdClass":3:{s:11:"description";s:87:"<p>Create Review Posts, add reviews to existing post types and enable user reviews.</p>";s:12:"installation";s:294:"<ol>\n<li>Upload the plugin to your website.</li>\n<li>Activate it.</li>\n<li>Enter the license key you received after the purchase and activate it.</li>\n<li>Done. You can now go to Helpie KB Wiki -> Helpie Settings and check out the settings or learn more at https://helpiewp.com/docs/</li>\n</ol>";s:9:"changelog";s:1431:"<h4>0.6.1.1</h4>\n\n<ul>\n<li>Fix: Starcat Review Photo Reviews add-on not displaying in user review</li>\n<li>Fix: Starcat Review add-ons settings not added in starcat review settings</li>\n<li>House-Keeping: Freemius SDK verion 2.4.0.1 updated</li>\n</ul>\n\n<h4>0.6.1</h4>\n\n<ul>\n<li>Feature: Auto Approve Review settings added </li>\n<li>Feature: Starcat Review Internationalization</li>\n<li>Feature: German Translation ready</li>\n<li>Fix: Non-logged-in users submitted reviews shows author as Anonymous</li>\n<li>General Fixes</li>\n</ul>\n\n<h4>0.6</h4>\n\n<ul>\n<li>Feature: Photo Reviews Addon (sold also as a Bundle)</li>\n<li>Feature: WooCommerce Integration</li>\n<li>General Fixes</li>\n</ul>\n\n<h4>0.5</h4>\n\n<ul>\n<li>Feature: Comparison Table Addon (sold also as a Bundle)</li>\n<li>Fix: Multisite issues</li>\n</ul>\n\n<h4>0.4.1</h4>\n\n<ul>\n<li>Fix: Fixed an issue with non-logged-in user reviews</li>\n</ul>\n\n<h4>0.4</h4>\n\n<ul>\n<li>Feature: Non-logged in user reviews</li>\n<li>Feature: Support for Notification addon (sold via Bundle)</li>\n</ul>\n\n<h4>0.3</h4>\n\n<ul>\n<li>Feature: Sorting and Search for Woocommerce and other CPT User Reviews</li>\n<li>Feature: Google\'s Recaptcha for User Reviews</li>\n<li>Feature: Most Helpful Reviews</li>\n<li>Feature: Option to change color of stars (or other rating icons)</li>\n</ul>\n\n<h4>0.2.2</h4>\n\n<ul>\n<li>Fix: Show CPT Settings in Mutli Site</li>\n</ul>\n\n<h4>0.1</h4>\n\n<ul>\n<li>Initial release</li>\n</ul>";}s:14:"upgrade_notice";b:0;s:7:"version";s:7:"0.6.1.1";s:13:"download_link";s:386:"https://api.freemius.com/v1/installs/4676617/updates/20642.zip?is_premium=true&authorization=FSLA+4676617%3ApUWBmulud3V9lfsZzcb5jPmSGBrHFXrRrKOCdmdjfF8AELwmNxTBCn9EFmmNhbH8qh1W3IFREhP8gPH_auAb6AM79wZfQYGvkRCMnlg7gADoIQRQfeVovyR4X6UUvllw4vHK918GlJmkjb9hk3j9hY7nZyZl6sXuYvIfFMg_Q3euMpgA2AIxE4HyvuPwTfrU2RVK2GmrkPNzDoly5AWXgaD1l-dCj6hr68MRX4mg_0Pj5Nl6iVdeCQwZspZFC8trIr1D_CyVTLHHX6F5RUlBIg";}}s:7:"created";i:1598246597;s:9:"timestamp";i:1598250197;}s:68:"get:/v1/users/1131140/plugins/3980/payments.json?include_addons=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"payments";a:1:{i:0;O:8:"stdClass":25:{s:15:"subscription_id";s:5:"69983";s:5:"gross";d:29.99;s:16:"bound_payment_id";N;s:11:"gateway_fee";d:1.17;s:3:"vat";i:0;s:10:"is_renewal";b:0;s:4:"type";s:7:"payment";s:7:"user_id";s:7:"1131140";s:10:"install_id";s:7:"4347112";s:7:"plan_id";s:4:"8252";s:10:"license_id";s:6:"264059";s:2:"ip";s:14:"162.216.140.19";s:12:"country_code";s:2:"in";s:6:"vat_id";N;s:9:"coupon_id";N;s:12:"user_card_id";s:5:"59025";s:6:"source";i:0;s:9:"plugin_id";s:4:"5122";s:11:"external_id";s:27:"ch_1FlrMkFmXz63vF5vs6rYZigu";s:7:"gateway";s:6:"stripe";s:11:"environment";i:1;s:2:"id";s:6:"146107";s:7:"created";s:19:"2019-12-04 06:29:41";s:7:"updated";s:19:"2020-04-13 06:29:44";s:8:"currency";s:3:"usd";}}}s:7:"created";i:1598246597;s:9:"timestamp";i:1598332997;}s:34:"get:/v1/users/1131140/billing.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":3:{s:4:"path";s:28:":/users/user_id/billing.json";s:5:"error";O:8:"stdClass":5:{s:4:"type";s:12:"ItemNotFound";s:7:"message";s:31:"User_billing 1131140 not found.";s:4:"code";s:22:"user_billing_not_found";s:4:"http";i:404;s:9:"timestamp";s:31:"Mon, 24 Aug 2020 05:23:30 +0000";}s:7:"request";O:8:"stdClass":2:{s:11:"sdk_version";s:7:"2.4.0.1";s:7:"user_id";s:7:"1131140";}}s:7:"created";i:1598246597;s:9:"timestamp";i:1598289797;}s:63:"get:/v1/users/1131140/plugins/3980/plans.json?show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:5:"plans";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:5:"basic";s:5:"title";s:5:"Basic";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";i:7;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:0;s:2:"id";s:4:"8220";s:7:"updated";s:19:"2020-07-15 05:23:29";s:7:"created";s:19:"2019-12-02 06:44:44";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:4:"free";s:5:"title";s:4:"Free";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:0;s:2:"id";s:5:"10795";s:7:"updated";s:19:"2020-07-24 11:36:12";s:7:"created";s:19:"2020-07-23 11:30:52";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246794;s:9:"timestamp";i:1598333194;}s:65:"get:/v1/users/1131140/plugins/3980/licenses.json?is_enriched=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:4:{i:0;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:8:"products";N;s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:1;s:2:"id";s:6:"412534";s:7:"updated";s:19:"2020-08-24 05:26:39";s:7:"created";s:19:"2020-08-24 05:25:23";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"personal";s:17:"parent_plan_title";s:8:"Personal";s:17:"parent_license_id";s:6:"272391";s:8:"products";N;s:10:"pricing_id";s:4:"7997";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:4;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"380280";s:7:"updated";s:19:"2020-08-24 05:25:23";s:7:"created";s:19:"2020-06-26 07:46:52";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"7999";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-03-30 05:16:54";s:10:"secret_key";s:32:"sk_PiO^mumFrT;<4uK7YJ[jy$wm!DZjF";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"318957";s:7:"updated";s:19:"2020-08-24 05:26:39";s:7:"created";s:19:"2020-03-30 05:16:54";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:3;O:17:"FS_Plugin_License":22:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"6406";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:8:"products";N;s:10:"pricing_id";s:4:"5702";s:5:"quota";i:27;s:9:"activated";i:3;s:15:"activated_local";i:20;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_(H7lEoP+P<W5g?P%P#X@%}*j+&e>@";s:15:"is_whitelabeled";b:0;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:5:"91267";s:7:"updated";s:19:"2020-07-07 04:18:46";s:7:"created";s:19:"2019-06-19 06:20:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1598246794;s:9:"timestamp";i:1598333194;}s:59:"get:/v1/installs/4676617/licenses/318957/subscriptions.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:13:"subscriptions";a:0:{}}s:7:"created";i:1598246794;s:9:"timestamp";i:1598333194;}s:47:"get:/v1/users/1131140/licenses.json?type=active";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:19:{i:0;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"2442";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"3767";s:10:"pricing_id";s:4:"7167";s:5:"quota";i:100;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-07-22 04:54:20";s:10:"secret_key";s:32:"sk_y*Cl:^hKh[:JzSz3b)%Z9O~&F:[xW";s:17:"is_free_localhost";b:0;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"394568";s:7:"created";s:19:"2020-07-22 04:54:20";s:7:"updated";s:19:"2020-07-22 04:54:39";}i:1;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:10:"pricing_id";N;s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"383165";s:7:"created";s:19:"2020-07-01 13:29:05";s:7:"updated";s:19:"2020-07-01 13:29:05";}i:2;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:10:"pricing_id";s:4:"8108";s:5:"quota";i:50;s:9:"activated";i:3;s:15:"activated_local";i:2;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"383164";s:7:"created";s:19:"2020-07-01 13:28:44";s:7:"updated";s:19:"2020-08-24 05:23:12";}i:3;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:10:"pricing_id";s:5:"10638";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"383163";s:7:"created";s:19:"2020-07-01 13:27:36";s:7:"updated";s:19:"2020-07-17 10:39:06";}i:4;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9649";s:10:"pricing_id";s:4:"9683";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2021-04-13 14:17:21";s:10:"secret_key";s:32:"sk_A{<Z]Y!MIv~..F=B#A9yS~h>F]L]*";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"383162";s:7:"created";s:19:"2020-07-01 13:26:55";s:7:"updated";s:19:"2020-07-17 10:40:16";}i:5;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:10:"pricing_id";s:4:"7997";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:4;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"380280";s:7:"created";s:19:"2020-06-26 07:46:52";s:7:"updated";s:19:"2020-08-24 05:25:23";}i:6;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"379150";s:7:"created";s:19:"2020-06-24 12:21:00";s:7:"updated";s:19:"2020-07-17 12:28:42";}i:7;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5890";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9649";s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:0;s:15:"activated_local";i:4;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"360158";s:7:"created";s:19:"2020-05-26 11:31:21";s:7:"updated";s:19:"2020-07-17 12:28:42";}i:8;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"6208";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:5:"10138";s:10:"pricing_id";N;s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:5;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"360147";s:7:"created";s:19:"2020-05-26 11:14:22";s:7:"updated";s:19:"2020-08-20 14:54:54";}i:9;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:1;s:15:"activated_local";i:11;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"328188";s:7:"created";s:19:"2020-04-13 06:43:15";s:7:"updated";s:19:"2020-08-24 05:23:13";}i:10;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5788";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"9453";s:10:"pricing_id";s:4:"9397";s:5:"quota";i:1;s:9:"activated";i:1;s:15:"activated_local";i:7;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"324121";s:7:"created";s:19:"2020-04-07 07:22:18";s:7:"updated";s:19:"2020-07-07 08:25:37";}i:11;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:10:"pricing_id";s:4:"7999";s:5:"quota";i:50;s:9:"activated";i:2;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-03-30 05:16:54";s:10:"secret_key";s:32:"sk_PiO^mumFrT;<4uK7YJ[jy$wm!DZjF";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"318957";s:7:"created";s:19:"2020-03-30 05:16:54";s:7:"updated";s:19:"2020-08-24 05:26:39";}i:12;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5099";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8331";s:10:"pricing_id";s:4:"8176";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-12-23 04:24:08";s:10:"secret_key";s:32:"sk_+BJ.rz!FT=MNQW)QdZw0Zu1Mp!08d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:6:"272391";s:7:"created";s:19:"2019-12-23 04:24:08";s:7:"updated";N;}i:13;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"5122";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8252";s:10:"pricing_id";s:4:"8106";s:5:"quota";i:14;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-12-05 06:29:38";s:10:"secret_key";s:32:"sk_bqyiT7hKy.zJXWIXLa_*AorB^yRh4";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"264059";s:7:"created";s:19:"2019-12-04 06:29:40";s:7:"updated";s:19:"2020-07-27 03:45:10";}i:14;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3014";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"4858";s:10:"pricing_id";s:4:"4015";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-11-14 11:39:02";s:10:"secret_key";s:32:"sk_^L;:WxKFtuP9<aPzNN8bAl(0>xJi5";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"250030";s:7:"created";s:19:"2019-11-07 05:39:03";s:7:"updated";s:19:"2019-11-14 06:42:56";}i:15;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3014";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"4858";s:10:"pricing_id";s:4:"4015";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-11-14 10:50:21";s:10:"secret_key";s:32:"sk_?zr^B]~P_.XP:2geKqAz!I82>P+v!";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"250020";s:7:"created";s:19:"2019-11-07 04:50:23";s:7:"updated";s:19:"2019-11-14 05:53:17";}i:16;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3014";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"4858";s:10:"pricing_id";s:4:"4015";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:0;s:10:"expiration";s:19:"2020-11-14 10:37:10";s:10:"secret_key";s:32:"sk_%aLL){vP0$D]z!CQ[hKgY<6i&P?P:";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:6:"250017";s:7:"created";s:19:"2019-11-07 04:37:11";s:7:"updated";s:19:"2019-11-14 05:53:12";}i:17;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"6406";s:10:"pricing_id";s:4:"5702";s:5:"quota";i:27;s:9:"activated";i:3;s:15:"activated_local";i:20;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_(H7lEoP+P<W5g?P%P#X@%}*j+&e>@";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:5:"91267";s:7:"created";s:19:"2019-06-19 06:20:40";s:7:"updated";s:19:"2020-07-07 04:18:46";}i:18;O:8:"stdClass":18:{s:9:"plugin_id";s:4:"3014";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"4858";s:10:"pricing_id";s:4:"4017";s:5:"quota";N;s:9:"activated";i:15;s:15:"activated_local";i:29;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_XC6An[[^bhH8%^yld_nX6~?ub[u~Q";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:15:"is_whitelabeled";b:0;s:11:"environment";i:0;s:6:"source";i:0;s:2:"id";s:5:"73151";s:7:"created";s:19:"2019-05-20 04:43:07";s:7:"updated";s:19:"2020-08-18 05:31:28";}}}s:7:"created";i:1598247387;s:9:"timestamp";i:1598333787;}}', 'no'),
(151, 'fs_gdpr', 'a:1:{s:2:"u1";a:2:{s:8:"required";b:0;s:18:"show_opt_in_notice";b:0;}}', 'yes'),
(154, 'scr_options', 'a:65:{s:24:"review_enable_post-types";a:3:{i:0;s:4:"post";i:1;s:7:"product";i:2;s:14:"starcat_review";}s:20:"enable-author-review";s:1:"1";s:16:"enable-pros-cons";s:1:"1";s:16:"stat-singularity";s:6:"single";s:12:"global_stats";a:1:{i:0;a:1:{s:9:"stat_name";s:7:"Feature";}}s:10:"stats-type";s:4:"star";s:17:"stats-source-type";s:4:"icon";s:23:"stats-show-rating-label";s:1:"1";s:11:"stats-icons";s:4:"star";s:17:"stats-icons-color";s:7:"#e7711b";s:23:"stats-icons-label-color";s:7:"#0274be";s:12:"stats-images";a:2:{s:5:"image";a:8:{s:3:"url";s:84:"http://127.0.0.1:83/wp-content/plugins/starcat-review/includes/assets/img/tomato.png";s:2:"id";s:0:"";s:5:"width";s:0:"";s:6:"height";s:0:"";s:9:"thumbnail";s:84:"http://127.0.0.1:83/wp-content/plugins/starcat-review/includes/assets/img/tomato.png";s:3:"alt";s:0:"";s:5:"title";s:0:"";s:11:"description";s:0:"";}s:13:"image-outline";a:8:{s:3:"url";s:92:"http://127.0.0.1:83/wp-content/plugins/starcat-review/includes/assets/img/tomato-outline.png";s:2:"id";s:0:"";s:5:"width";s:0:"";s:6:"height";s:0:"";s:9:"thumbnail";s:92:"http://127.0.0.1:83/wp-content/plugins/starcat-review/includes/assets/img/tomato-outline.png";s:3:"alt";s:0:"";s:5:"title";s:0:"";s:11:"description";s:0:"";}}s:17:"stats-stars-limit";s:1:"5";s:11:"stats-steps";s:4:"half";s:13:"stats-animate";s:0:"";s:22:"stats-no-rated-message";s:17:"Not Rated Yet !!!";s:13:"mp_meta_title";s:7:"Reviews";s:19:"mp_meta_description";s:22:"These are your reviews";s:7:"mp_slug";s:7:"reviews";s:18:"mp_template_layout";s:10:"full-width";s:19:"mp_components_order";a:2:{s:19:"mp_category_listing";s:1:"1";s:17:"mp_review_listing";s:1:"1";}s:11:"mp_cl_title";s:17:"Review Categories";s:17:"mp_cl_description";s:1:"1";s:10:"mp_cl_cols";s:1:"2";s:11:"mp_rl_title";s:14:"Review Listing";s:12:"mp_rl_sortby";s:6:"recent";s:10:"mp_rl_cols";s:1:"3";s:18:"cp_template_layout";s:10:"full-width";s:11:"cp_controls";s:1:"1";s:9:"cp_search";s:1:"1";s:9:"cp_sortBy";s:1:"1";s:17:"cp_posts_per_page";s:1:"9";s:17:"cp_default_sortBy";s:6:"recent";s:14:"cp_num_of_cols";s:1:"3";s:18:"sp_template_layout";s:10:"full-width";s:16:"sp_show_controls";s:1:"1";s:21:"sp_rating_combination";s:8:"combined";s:17:"ur_who_can_review";s:9:"logged_in";s:15:"ur_auto_approve";s:0:"";s:45:"ur_allow_same_user_can_leave_multiple_reviews";s:0:"";s:18:"ur_show_list_title";s:1:"1";s:13:"ur_list_title";s:12:"User Reviews";s:16:"ur_enable_voting";s:1:"1";s:18:"ur_show_form_title";s:1:"1";s:13:"ur_form_title";s:14:"Leave a Review";s:13:"ur_show_title";s:1:"1";s:13:"ur_show_stats";s:1:"1";s:19:"ur_show_description";s:1:"1";s:15:"ur_show_captcha";s:0:"";s:18:"recaptcha_site_key";s:0:"";s:20:"recaptcha_secret_key";s:0:"";s:9:"pr_enable";s:1:"1";s:16:"pr_require_photo";s:1:"1";s:13:"pr_photo_size";s:4:"2000";s:17:"pr_photo_quantity";s:1:"5";s:15:"ns_from_address";s:24:"dev-email@flywheel.local";s:10:"ns_subject";s:42:"Thank you for Purchasing from {{Sitename}}";s:10:"ns_content";s:116:"Thank you for purchasing from Starcat Dev. If you liked your product, please leave a review: {{product_review_link}}";s:13:"ns_disclaimer";s:0:"";s:16:"ns_time_schedule";a:3:{i:0;a:2:{s:5:"value";s:2:"24";s:4:"unit";s:5:"hours";}i:1;a:2:{s:5:"value";s:1:"1";s:4:"unit";s:4:"days";}i:2;a:2:{s:5:"value";s:1:"3";s:4:"unit";s:4:"days";}}s:16:"stats-subheading";s:0:"";s:13:"mp_cl_heading";s:0:"";s:13:"mp_rl_heading";s:0:"";s:22:"cp_controls_subheading";s:0:"";s:29:"cp_listing_options_subheading";s:0:"";}', 'yes'),
(155, 'slug_upgrades', 'a:1:{s:3:"0.2";b:1;}', 'yes'),
(156, 'SCR_VERSION', '0.5', 'yes'),
(174, 'action_scheduler_hybrid_store_demarkation', '5', 'yes'),
(175, 'schema-ActionScheduler_StoreSchema', '3.0.1590062467', 'yes'),
(176, 'schema-ActionScheduler_LoggerSchema', '2.0.1590062467', 'yes'),
(179, 'woocommerce_store_address', '', 'yes'),
(180, 'woocommerce_store_address_2', '', 'yes'),
(181, 'woocommerce_store_city', '', 'yes'),
(182, 'woocommerce_default_country', 'GB', 'yes'),
(183, 'woocommerce_store_postcode', '', 'yes'),
(184, 'woocommerce_allowed_countries', 'all', 'yes'),
(185, 'woocommerce_all_except_countries', '', 'yes'),
(186, 'woocommerce_specific_allowed_countries', '', 'yes'),
(187, 'woocommerce_ship_to_countries', '', 'yes'),
(188, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(189, 'woocommerce_default_customer_address', 'base', 'yes'),
(190, 'woocommerce_calc_taxes', 'no', 'yes'),
(191, 'woocommerce_enable_coupons', 'yes', 'yes'),
(192, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(193, 'woocommerce_currency', 'GBP', 'yes'),
(194, 'woocommerce_currency_pos', 'left', 'yes'),
(195, 'woocommerce_price_thousand_sep', ',', 'yes'),
(196, 'woocommerce_price_decimal_sep', '.', 'yes'),
(197, 'woocommerce_price_num_decimals', '2', 'yes'),
(198, 'woocommerce_shop_page_id', '', 'yes'),
(199, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(200, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(201, 'woocommerce_placeholder_image', '7', 'yes'),
(202, 'woocommerce_weight_unit', 'kg', 'yes'),
(203, 'woocommerce_dimension_unit', 'cm', 'yes'),
(204, 'woocommerce_enable_reviews', 'yes', 'yes'),
(205, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(206, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(207, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(208, 'woocommerce_review_rating_required', 'yes', 'no'),
(209, 'woocommerce_manage_stock', 'yes', 'yes'),
(210, 'woocommerce_hold_stock_minutes', '60', 'no'),
(211, 'woocommerce_notify_low_stock', 'yes', 'no'),
(212, 'woocommerce_notify_no_stock', 'yes', 'no'),
(213, 'woocommerce_stock_email_recipient', 'dev-email@flywheel.local', 'no'),
(214, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(215, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(216, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(217, 'woocommerce_stock_format', '', 'yes'),
(218, 'woocommerce_file_download_method', 'force', 'no'),
(219, 'woocommerce_downloads_require_login', 'no', 'no'),
(220, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(221, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(222, 'woocommerce_prices_include_tax', 'no', 'yes'),
(223, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(224, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(225, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(226, 'woocommerce_tax_classes', '', 'yes'),
(227, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(228, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(229, 'woocommerce_price_display_suffix', '', 'yes'),
(230, 'woocommerce_tax_total_display', 'itemized', 'no'),
(231, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(232, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(233, 'woocommerce_ship_to_destination', 'billing', 'no'),
(234, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(235, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(236, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(237, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(238, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(239, 'woocommerce_registration_generate_username', 'yes', 'no'),
(240, 'woocommerce_registration_generate_password', 'yes', 'no'),
(241, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(242, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(243, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(244, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(245, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(246, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(247, 'woocommerce_trash_pending_orders', '', 'no'),
(248, 'woocommerce_trash_failed_orders', '', 'no'),
(249, 'woocommerce_trash_cancelled_orders', '', 'no'),
(250, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(251, 'woocommerce_email_from_name', 'Fresh Site', 'no'),
(252, 'woocommerce_email_from_address', 'dev-email@flywheel.local', 'no'),
(253, 'woocommerce_email_header_image', '', 'no') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(254, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(255, 'woocommerce_email_base_color', '#96588a', 'no'),
(256, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(257, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(258, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(259, 'woocommerce_cart_page_id', '', 'no'),
(260, 'woocommerce_checkout_page_id', '', 'no'),
(261, 'woocommerce_myaccount_page_id', '', 'no'),
(262, 'woocommerce_terms_page_id', '', 'no'),
(263, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(264, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(265, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(266, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(267, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(268, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(269, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(270, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(271, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(272, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(273, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(274, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(275, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(276, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(277, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(278, 'woocommerce_api_enabled', 'no', 'yes'),
(279, 'woocommerce_allow_tracking', 'no', 'no'),
(280, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(281, 'woocommerce_single_image_width', '600', 'yes'),
(282, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(283, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(284, 'woocommerce_demo_store', 'no', 'no'),
(285, 'woocommerce_permalinks', 'a:5:{s:12:"product_base";s:7:"product";s:13:"category_base";s:16:"product-category";s:8:"tag_base";s:11:"product-tag";s:14:"attribute_base";s:0:"";s:22:"use_verbose_page_rules";b:0;}', 'yes'),
(286, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(287, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(290, 'default_product_cat', '15', 'yes'),
(291, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:"no_secure_connection";}', 'yes'),
(298, 'action_scheduler_lock_async-request-runner', '1598247407', 'yes'),
(299, 'theme_mods_twentytwenty', 'a:2:{s:16:"background_color";s:3:"fff";s:18:"custom_css_post_id";i:-1;}', 'yes'),
(300, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:"database_prefix";s:32:"VYNNkrJOJsYAuDY50VfAlVgEQJeVN4Oz";}', 'yes'),
(302, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(303, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(304, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(305, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(306, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(307, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(308, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(309, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(310, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(311, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(312, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(313, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(314, 'woocommerce_onboarding_opt_in', 'no', 'yes'),
(318, 'woocommerce_admin_install_timestamp', '1590062474', 'yes'),
(322, 'woocommerce_admin_last_orders_milestone', '0', 'yes'),
(323, 'woocommerce_onboarding_profile', 'a:1:{s:9:"completed";b:1;}', 'yes'),
(325, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(358, 'product_cat_children', 'a:1:{i:16;a:3:{i:0;i:17;i:1;i:18;i:2;i:19;}}', 'yes'),
(366, 'pa_size_children', 'a:0:{}', 'yes'),
(368, 'woocommerce_marketplace_suggestions', 'a:2:{s:11:"suggestions";a:26:{i:0;a:4:{s:4:"slug";s:28:"product-edit-meta-tab-header";s:7:"context";s:28:"product-edit-meta-tab-header";s:5:"title";s:22:"Recommended extensions";s:13:"allow-dismiss";b:0;}i:1;a:6:{s:4:"slug";s:39:"product-edit-meta-tab-footer-browse-all";s:7:"context";s:28:"product-edit-meta-tab-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:2;a:9:{s:4:"slug";s:46:"product-edit-mailchimp-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-mailchimp";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/mailchimp-for-memberships.svg";s:5:"title";s:25:"Mailchimp for Memberships";s:4:"copy";s:79:"Completely automate your email lists by syncing membership changes to Mailchimp";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/mailchimp-woocommerce-memberships/";}i:3;a:9:{s:4:"slug";s:19:"product-edit-addons";s:7:"product";s:26:"woocommerce-product-addons";s:14:"show-if-active";a:2:{i:0;s:25:"woocommerce-subscriptions";i:1;s:20:"woocommerce-bookings";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-add-ons.svg";s:5:"title";s:15:"Product Add-Ons";s:4:"copy";s:93:"Offer add-ons like gift wrapping, special messages or other special options for your products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-add-ons/";}i:4;a:9:{s:4:"slug";s:46:"product-edit-woocommerce-subscriptions-gifting";s:7:"product";s:33:"woocommerce-subscriptions-gifting";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/gifting-for-subscriptions.svg";s:5:"title";s:25:"Gifting for Subscriptions";s:4:"copy";s:70:"Let customers buy subscriptions for others - they\'re the ultimate gift";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/woocommerce-subscriptions-gifting/";}i:5;a:9:{s:4:"slug";s:42:"product-edit-teams-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-for-teams";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:112:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/teams-for-memberships.svg";s:5:"title";s:21:"Teams for Memberships";s:4:"copy";s:123:"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/teams-woocommerce-memberships/";}i:6;a:8:{s:4:"slug";s:29:"product-edit-variation-images";s:7:"product";s:39:"woocommerce-additional-variation-images";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/additional-variation-images.svg";s:5:"title";s:27:"Additional Variation Images";s:4:"copy";s:72:"Showcase your products in the best light with a image for each variation";s:11:"button-text";s:10:"Learn More";s:3:"url";s:73:"https://woocommerce.com/products/woocommerce-additional-variation-images/";}i:7;a:9:{s:4:"slug";s:47:"product-edit-woocommerce-subscription-downloads";s:7:"product";s:34:"woocommerce-subscription-downloads";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:113:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscription-downloads.svg";s:5:"title";s:22:"Subscription Downloads";s:4:"copy";s:57:"Give customers special downloads with their subscriptions";s:11:"button-text";s:10:"Learn More";s:3:"url";s:68:"https://woocommerce.com/products/woocommerce-subscription-downloads/";}i:8;a:8:{s:4:"slug";s:31:"product-edit-min-max-quantities";s:7:"product";s:30:"woocommerce-min-max-quantities";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:109:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/min-max-quantities.svg";s:5:"title";s:18:"Min/Max Quantities";s:4:"copy";s:81:"Specify minimum and maximum allowed product quantities for orders to be completed";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/min-max-quantities/";}i:9;a:8:{s:4:"slug";s:28:"product-edit-name-your-price";s:7:"product";s:27:"woocommerce-name-your-price";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/name-your-price.svg";s:5:"title";s:15:"Name Your Price";s:4:"copy";s:70:"Let customers pay what they want - useful for donations, tips and more";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/name-your-price/";}i:10;a:8:{s:4:"slug";s:42:"product-edit-woocommerce-one-page-checkout";s:7:"product";s:29:"woocommerce-one-page-checkout";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/one-page-checkout.svg";s:5:"title";s:17:"One Page Checkout";s:4:"copy";s:92:"Don\'t make customers click around - let them choose products, checkout & pay all on one page";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/woocommerce-one-page-checkout/";}i:11;a:4:{s:4:"slug";s:19:"orders-empty-header";s:7:"context";s:24:"orders-list-empty-header";s:5:"title";s:20:"Tools for your store";s:13:"allow-dismiss";b:0;}i:12;a:6:{s:4:"slug";s:30:"orders-empty-footer-browse-all";s:7:"context";s:24:"orders-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:13;a:8:{s:4:"slug";s:19:"orders-empty-zapier";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:18:"woocommerce-zapier";s:4:"icon";s:97:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/zapier.svg";s:5:"title";s:6:"Zapier";s:4:"copy";s:88:"Save time and increase productivity by connecting your store to more than 1000+ services";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/woocommerce-zapier/";}i:14;a:8:{s:4:"slug";s:30:"orders-empty-shipment-tracking";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:29:"woocommerce-shipment-tracking";s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipment-tracking.svg";s:5:"title";s:17:"Shipment Tracking";s:4:"copy";s:86:"Let customers know when their orders will arrive by adding shipment tracking to emails";s:11:"button-text";s:10:"Learn More";s:3:"url";s:51:"https://woocommerce.com/products/shipment-tracking/";}i:15;a:8:{s:4:"slug";s:32:"orders-empty-table-rate-shipping";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:31:"woocommerce-table-rate-shipping";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/table-rate-shipping.svg";s:5:"title";s:19:"Table Rate Shipping";s:4:"copy";s:122:"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/table-rate-shipping/";}i:16;a:8:{s:4:"slug";s:40:"orders-empty-shipping-carrier-extensions";s:7:"context";s:22:"orders-list-empty-body";s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipping-carrier-extensions.svg";s:5:"title";s:27:"Shipping Carrier Extensions";s:4:"copy";s:116:"Show live rates from FedEx, UPS, USPS and more directly on your store - never under or overcharge for shipping again";s:11:"button-text";s:13:"Find Carriers";s:8:"promoted";s:26:"category-shipping-carriers";s:3:"url";s:99:"https://woocommerce.com/product-category/woocommerce-extensions/shipping-methods/shipping-carriers/";}i:17;a:8:{s:4:"slug";s:32:"orders-empty-google-product-feed";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:25:"woocommerce-product-feeds";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/google-product-feed.svg";s:5:"title";s:19:"Google Product Feed";s:4:"copy";s:76:"Increase sales by letting customers find you when they\'re shopping on Google";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/google-product-feed/";}i:18;a:4:{s:4:"slug";s:35:"products-empty-header-product-types";s:7:"context";s:26:"products-list-empty-header";s:5:"title";s:23:"Other types of products";s:13:"allow-dismiss";b:0;}i:19;a:6:{s:4:"slug";s:32:"products-empty-footer-browse-all";s:7:"context";s:26:"products-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:20;a:8:{s:4:"slug";s:30:"products-empty-product-vendors";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-vendors";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-vendors.svg";s:5:"title";s:15:"Product Vendors";s:4:"copy";s:47:"Turn your store into a multi-vendor marketplace";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-vendors/";}i:21;a:8:{s:4:"slug";s:26:"products-empty-memberships";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:23:"woocommerce-memberships";s:4:"icon";s:102:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/memberships.svg";s:5:"title";s:11:"Memberships";s:4:"copy";s:76:"Give members access to restricted content or products, for a fee or for free";s:11:"button-text";s:10:"Learn More";s:3:"url";s:57:"https://woocommerce.com/products/woocommerce-memberships/";}i:22;a:9:{s:4:"slug";s:35:"products-empty-woocommerce-deposits";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-deposits";s:14:"show-if-active";a:1:{i:0;s:20:"woocommerce-bookings";}s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/deposits.svg";s:5:"title";s:8:"Deposits";s:4:"copy";s:75:"Make it easier for customers to pay by offering a deposit or a payment plan";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-deposits/";}i:23;a:8:{s:4:"slug";s:40:"products-empty-woocommerce-subscriptions";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:25:"woocommerce-subscriptions";s:4:"icon";s:104:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscriptions.svg";s:5:"title";s:13:"Subscriptions";s:4:"copy";s:97:"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis";s:11:"button-text";s:10:"Learn More";s:3:"url";s:59:"https://woocommerce.com/products/woocommerce-subscriptions/";}i:24;a:8:{s:4:"slug";s:35:"products-empty-woocommerce-bookings";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-bookings";s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/bookings.svg";s:5:"title";s:8:"Bookings";s:4:"copy";s:99:"Allow customers to book appointments, make reservations or rent equipment without leaving your site";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-bookings/";}i:25;a:8:{s:4:"slug";s:30:"products-empty-product-bundles";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-bundles";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-bundles.svg";s:5:"title";s:15:"Product Bundles";s:4:"copy";s:49:"Offer customizable bundles and assembled products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-bundles/";}}s:7:"updated";i:1590062554;}', 'no'),
(385, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1598247390;}', 'no'),
(470, 'action_scheduler_migration_status', 'complete', 'yes'),
(486, 'woocommerce_schema_version', '430', 'yes'),
(487, 'woocommerce_version', '4.4.1', 'yes'),
(490, 'wc_remote_inbox_notifications_specs', 'a:3:{s:37:"ecomm-need-help-setting-up-your-store";O:8:"stdClass":8:{s:4:"slug";s:37:"ecomm-need-help-setting-up-your-store";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:32:"Need help setting up your Store?";s:7:"content";s:350:"Schedule a free 30-min <a href="https://wordpress.com/support/concierge-support/">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:16:"set-up-concierge";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:21:"Schedule free session";}}s:3:"url";s:34:"https://wordpress.com/me/concierge";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:1:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:3:{i:0;s:35:"woocommerce-shipping-australia-post";i:1;s:32:"woocommerce-shipping-canada-post";i:2;s:30:"woocommerce-shipping-royalmail";}}}}s:20:"woocommerce-services";O:8:"stdClass":8:{s:4:"slug";s:20:"woocommerce-services";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:20:"WooCommerce Services";s:7:"content";s:249:"WooCommerce Services helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:10:"learn-more";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:76:"https://docs.woocommerce.com/document/woocommerce-services/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:10:"unactioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:1:{i:0;s:20:"woocommerce-services";}}i:1;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:"<";s:4:"days";i:2;}}}s:32:"ecomm-unique-shopping-experience";O:8:"stdClass":8:{s:4:"slug";s:32:"ecomm-unique-shopping-experience";s:4:"type";s:4:"info";s:6:"status";s:10:"unactioned";s:12:"is_snoozable";i:0;s:6:"source";s:15:"woocommerce.com";s:7:"locales";a:1:{i:0;O:8:"stdClass":3:{s:6:"locale";s:5:"en_US";s:5:"title";s:53:"For a shopping experience as unique as your customers";s:7:"content";s:274:"Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.";}}s:7:"actions";a:1:{i:0;O:8:"stdClass":6:{s:4:"name";s:43:"learn-more-ecomm-unique-shopping-experience";s:7:"locales";a:1:{i:0;O:8:"stdClass":2:{s:6:"locale";s:5:"en_US";s:5:"label";s:10:"Learn more";}}s:3:"url";s:71:"https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox";s:18:"url_is_admin_query";b:0;s:10:"is_primary";b:1;s:6:"status";s:8:"actioned";}}s:5:"rules";a:2:{i:0;O:8:"stdClass":2:{s:4:"type";s:17:"plugins_activated";s:7:"plugins";a:3:{i:0;s:35:"woocommerce-shipping-australia-post";i:1;s:32:"woocommerce-shipping-canada-post";i:2;s:30:"woocommerce-shipping-royalmail";}}i:1;O:8:"stdClass":3:{s:4:"type";s:18:"wcadmin_active_for";s:9:"operation";s:1:"<";s:4:"days";i:2;}}}}', 'yes'),
(491, 'wc_remote_inbox_notifications_stored_state', 'O:8:"stdClass":2:{s:22:"there_were_no_products";b:0;s:22:"there_are_now_products";b:1;}', 'yes'),
(492, 'woocommerce_task_list_hidden', 'yes', 'yes'),
(505, 'disallowed_keys', '', 'no'),
(506, 'comment_previously_approved', '1', 'yes'),
(507, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(508, 'finished_updating_comment_type', '0', 'yes'),
(509, 'db_upgraded', '', 'yes'),
(528, 'wc_blocks_db_schema_version', '260', 'yes'),
(548, 'can_compress_scripts', '0', 'no'),
(597, 'woocommerce_admin_version', '1.4.0', 'yes'),
(661, 'woocommerce_db_version', '4.4.1', 'yes'),
(676, 'scr_notification_schedule', 'a:0:{}', 'yes'),
(681, 'widget_scr-listing', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(682, 'widget_scr-comparison-table', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(685, 'scr_category_children', 'a:0:{}', 'yes') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(7, 7, '_wp_attached_file', 'woocommerce-placeholder.png'),
(8, 7, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:1200;s:4:"file";s:27:"woocommerce-placeholder.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:35:"woocommerce-placeholder-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:37:"woocommerce-placeholder-1024x1024.png";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:35:"woocommerce-placeholder-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:35:"woocommerce-placeholder-768x768.png";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(11, 9, '_sku', 'woo-vneck-tee'),
(12, 9, 'total_sales', '0'),
(13, 9, '_tax_status', 'taxable'),
(14, 9, '_tax_class', ''),
(15, 9, '_manage_stock', 'no'),
(16, 9, '_backorders', 'no'),
(17, 9, '_sold_individually', 'no'),
(18, 9, '_virtual', 'no'),
(19, 9, '_downloadable', 'no'),
(20, 9, '_download_limit', '0'),
(21, 9, '_download_expiry', '0'),
(22, 9, '_stock', NULL),
(23, 9, '_stock_status', 'instock'),
(24, 9, '_wc_average_rating', '0'),
(25, 9, '_wc_review_count', '0'),
(26, 9, '_product_version', '4.1.1'),
(28, 10, '_sku', 'woo-hoodie'),
(29, 10, 'total_sales', '0'),
(30, 10, '_tax_status', 'taxable'),
(31, 10, '_tax_class', ''),
(32, 10, '_manage_stock', 'no'),
(33, 10, '_backorders', 'no'),
(34, 10, '_sold_individually', 'no'),
(35, 10, '_virtual', 'no'),
(36, 10, '_downloadable', 'no'),
(37, 10, '_download_limit', '0'),
(38, 10, '_download_expiry', '0'),
(39, 10, '_stock', NULL),
(40, 10, '_stock_status', 'instock'),
(41, 10, '_wc_average_rating', '0'),
(42, 10, '_wc_review_count', '0'),
(43, 10, '_product_version', '4.1.1'),
(45, 11, '_sku', 'woo-hoodie-with-logo'),
(46, 11, 'total_sales', '0'),
(47, 11, '_tax_status', 'taxable'),
(48, 11, '_tax_class', ''),
(49, 11, '_manage_stock', 'no'),
(50, 11, '_backorders', 'no'),
(51, 11, '_sold_individually', 'no'),
(52, 11, '_virtual', 'no'),
(53, 11, '_downloadable', 'no'),
(54, 11, '_download_limit', '0'),
(55, 11, '_download_expiry', '0'),
(56, 11, '_stock', NULL),
(57, 11, '_stock_status', 'instock'),
(58, 11, '_wc_average_rating', '0'),
(59, 11, '_wc_review_count', '0'),
(60, 11, '_product_version', '4.1.1'),
(62, 12, '_sku', 'woo-tshirt'),
(63, 12, 'total_sales', '0'),
(64, 12, '_tax_status', 'taxable'),
(65, 12, '_tax_class', ''),
(66, 12, '_manage_stock', 'no'),
(67, 12, '_backorders', 'no'),
(68, 12, '_sold_individually', 'no'),
(69, 12, '_virtual', 'no'),
(70, 12, '_downloadable', 'no'),
(71, 12, '_download_limit', '0'),
(72, 12, '_download_expiry', '0'),
(73, 12, '_stock', NULL),
(74, 12, '_stock_status', 'instock'),
(75, 12, '_wc_average_rating', '0'),
(76, 12, '_wc_review_count', '0'),
(77, 12, '_product_version', '4.1.1'),
(79, 13, '_sku', 'woo-beanie'),
(80, 13, 'total_sales', '0'),
(81, 13, '_tax_status', 'taxable'),
(82, 13, '_tax_class', ''),
(83, 13, '_manage_stock', 'no'),
(84, 13, '_backorders', 'no'),
(85, 13, '_sold_individually', 'no'),
(86, 13, '_virtual', 'no'),
(87, 13, '_downloadable', 'no'),
(88, 13, '_download_limit', '0'),
(89, 13, '_download_expiry', '0'),
(90, 13, '_stock', NULL),
(91, 13, '_stock_status', 'instock'),
(92, 13, '_wc_average_rating', '0'),
(93, 13, '_wc_review_count', '0'),
(94, 13, '_product_version', '4.1.1'),
(96, 14, '_sku', 'woo-belt'),
(97, 14, 'total_sales', '0'),
(98, 14, '_tax_status', 'taxable'),
(99, 14, '_tax_class', ''),
(100, 14, '_manage_stock', 'no'),
(101, 14, '_backorders', 'no'),
(102, 14, '_sold_individually', 'no'),
(103, 14, '_virtual', 'no'),
(104, 14, '_downloadable', 'no'),
(105, 14, '_download_limit', '0'),
(106, 14, '_download_expiry', '0'),
(107, 14, '_stock', NULL),
(108, 14, '_stock_status', 'instock'),
(109, 14, '_wc_average_rating', '0'),
(110, 14, '_wc_review_count', '0'),
(111, 14, '_product_version', '4.1.1') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(113, 15, '_sku', 'woo-cap'),
(114, 15, 'total_sales', '0'),
(115, 15, '_tax_status', 'taxable'),
(116, 15, '_tax_class', ''),
(117, 15, '_manage_stock', 'no'),
(118, 15, '_backorders', 'no'),
(119, 15, '_sold_individually', 'no'),
(120, 15, '_virtual', 'no'),
(121, 15, '_downloadable', 'no'),
(122, 15, '_download_limit', '0'),
(123, 15, '_download_expiry', '0'),
(124, 15, '_stock', NULL),
(125, 15, '_stock_status', 'instock'),
(126, 15, '_wc_average_rating', '0'),
(127, 15, '_wc_review_count', '0'),
(128, 15, '_product_version', '4.1.1'),
(130, 16, '_sku', 'woo-sunglasses'),
(131, 16, 'total_sales', '0'),
(132, 16, '_tax_status', 'taxable'),
(133, 16, '_tax_class', ''),
(134, 16, '_manage_stock', 'no'),
(135, 16, '_backorders', 'no'),
(136, 16, '_sold_individually', 'no'),
(137, 16, '_virtual', 'no'),
(138, 16, '_downloadable', 'no'),
(139, 16, '_download_limit', '0'),
(140, 16, '_download_expiry', '0'),
(141, 16, '_stock', NULL),
(142, 16, '_stock_status', 'instock'),
(143, 16, '_wc_average_rating', '0'),
(144, 16, '_wc_review_count', '0'),
(145, 16, '_product_version', '4.1.1'),
(147, 17, '_sku', 'woo-hoodie-with-pocket'),
(148, 17, 'total_sales', '0'),
(149, 17, '_tax_status', 'taxable'),
(150, 17, '_tax_class', ''),
(151, 17, '_manage_stock', 'no'),
(152, 17, '_backorders', 'no'),
(153, 17, '_sold_individually', 'no'),
(154, 17, '_virtual', 'no'),
(155, 17, '_downloadable', 'no'),
(156, 17, '_download_limit', '0'),
(157, 17, '_download_expiry', '0'),
(158, 17, '_stock', NULL),
(159, 17, '_stock_status', 'instock'),
(160, 17, '_wc_average_rating', '0'),
(161, 17, '_wc_review_count', '0'),
(162, 17, '_product_version', '4.1.1'),
(164, 18, '_sku', 'woo-hoodie-with-zipper'),
(165, 18, 'total_sales', '0'),
(166, 18, '_tax_status', 'taxable'),
(167, 18, '_tax_class', ''),
(168, 18, '_manage_stock', 'no'),
(169, 18, '_backorders', 'no'),
(170, 18, '_sold_individually', 'no'),
(171, 18, '_virtual', 'no'),
(172, 18, '_downloadable', 'no'),
(173, 18, '_download_limit', '0'),
(174, 18, '_download_expiry', '0'),
(175, 18, '_stock', NULL),
(176, 18, '_stock_status', 'instock'),
(177, 18, '_wc_average_rating', '0'),
(178, 18, '_wc_review_count', '0'),
(179, 18, '_product_version', '4.1.1'),
(181, 19, '_sku', 'woo-long-sleeve-tee'),
(182, 19, 'total_sales', '0'),
(183, 19, '_tax_status', 'taxable'),
(184, 19, '_tax_class', ''),
(185, 19, '_manage_stock', 'no'),
(186, 19, '_backorders', 'no'),
(187, 19, '_sold_individually', 'no'),
(188, 19, '_virtual', 'no'),
(189, 19, '_downloadable', 'no'),
(190, 19, '_download_limit', '0'),
(191, 19, '_download_expiry', '0'),
(192, 19, '_stock', NULL),
(193, 19, '_stock_status', 'instock'),
(194, 19, '_wc_average_rating', '0'),
(195, 19, '_wc_review_count', '0'),
(196, 19, '_product_version', '4.1.1'),
(198, 20, '_sku', 'woo-polo'),
(199, 20, 'total_sales', '0'),
(200, 20, '_tax_status', 'taxable'),
(201, 20, '_tax_class', ''),
(202, 20, '_manage_stock', 'no'),
(203, 20, '_backorders', 'no'),
(204, 20, '_sold_individually', 'no'),
(205, 20, '_virtual', 'no'),
(206, 20, '_downloadable', 'no'),
(207, 20, '_download_limit', '0'),
(208, 20, '_download_expiry', '0'),
(209, 20, '_stock', NULL),
(210, 20, '_stock_status', 'instock'),
(211, 20, '_wc_average_rating', '0'),
(212, 20, '_wc_review_count', '0'),
(213, 20, '_product_version', '4.1.1'),
(215, 21, '_sku', 'woo-album'),
(216, 21, 'total_sales', '0'),
(217, 21, '_tax_status', 'taxable'),
(218, 21, '_tax_class', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(219, 21, '_manage_stock', 'no'),
(220, 21, '_backorders', 'no'),
(221, 21, '_sold_individually', 'no'),
(222, 21, '_virtual', 'yes'),
(223, 21, '_downloadable', 'yes'),
(224, 21, '_download_limit', '1'),
(225, 21, '_download_expiry', '1'),
(226, 21, '_stock', NULL),
(227, 21, '_stock_status', 'instock'),
(228, 21, '_wc_average_rating', '0'),
(229, 21, '_wc_review_count', '0'),
(230, 21, '_product_version', '4.1.1'),
(232, 22, '_sku', 'woo-single'),
(233, 22, 'total_sales', '0'),
(234, 22, '_tax_status', 'taxable'),
(235, 22, '_tax_class', ''),
(236, 22, '_manage_stock', 'no'),
(237, 22, '_backorders', 'no'),
(238, 22, '_sold_individually', 'no'),
(239, 22, '_virtual', 'yes'),
(240, 22, '_downloadable', 'yes'),
(241, 22, '_download_limit', '1'),
(242, 22, '_download_expiry', '1'),
(243, 22, '_stock', NULL),
(244, 22, '_stock_status', 'instock'),
(245, 22, '_wc_average_rating', '0'),
(246, 22, '_wc_review_count', '0'),
(247, 22, '_product_version', '4.1.1'),
(249, 23, '_sku', 'woo-vneck-tee-red'),
(250, 23, 'total_sales', '0'),
(251, 23, '_tax_status', 'taxable'),
(252, 23, '_tax_class', ''),
(253, 23, '_manage_stock', 'no'),
(254, 23, '_backorders', 'no'),
(255, 23, '_sold_individually', 'no'),
(256, 23, '_virtual', 'no'),
(257, 23, '_downloadable', 'no'),
(258, 23, '_download_limit', '0'),
(259, 23, '_download_expiry', '0'),
(260, 23, '_stock', NULL),
(261, 23, '_stock_status', 'instock'),
(262, 23, '_wc_average_rating', '0'),
(263, 23, '_wc_review_count', '0'),
(264, 23, '_product_version', '4.1.1'),
(266, 24, '_sku', 'woo-vneck-tee-green'),
(267, 24, 'total_sales', '0'),
(268, 24, '_tax_status', 'taxable'),
(269, 24, '_tax_class', ''),
(270, 24, '_manage_stock', 'no'),
(271, 24, '_backorders', 'no'),
(272, 24, '_sold_individually', 'no'),
(273, 24, '_virtual', 'no'),
(274, 24, '_downloadable', 'no'),
(275, 24, '_download_limit', '0'),
(276, 24, '_download_expiry', '0'),
(277, 24, '_stock', NULL),
(278, 24, '_stock_status', 'instock'),
(279, 24, '_wc_average_rating', '0'),
(280, 24, '_wc_review_count', '0'),
(281, 24, '_product_version', '4.1.1'),
(283, 25, '_sku', 'woo-vneck-tee-blue'),
(284, 25, 'total_sales', '0'),
(285, 25, '_tax_status', 'taxable'),
(286, 25, '_tax_class', ''),
(287, 25, '_manage_stock', 'no'),
(288, 25, '_backorders', 'no'),
(289, 25, '_sold_individually', 'no'),
(290, 25, '_virtual', 'no'),
(291, 25, '_downloadable', 'no'),
(292, 25, '_download_limit', '0'),
(293, 25, '_download_expiry', '0'),
(294, 25, '_stock', NULL),
(295, 25, '_stock_status', 'instock'),
(296, 25, '_wc_average_rating', '0'),
(297, 25, '_wc_review_count', '0'),
(298, 25, '_product_version', '4.1.1'),
(300, 26, '_sku', 'woo-hoodie-red'),
(301, 26, 'total_sales', '0'),
(302, 26, '_tax_status', 'taxable'),
(303, 26, '_tax_class', ''),
(304, 26, '_manage_stock', 'no'),
(305, 26, '_backorders', 'no'),
(306, 26, '_sold_individually', 'no'),
(307, 26, '_virtual', 'no'),
(308, 26, '_downloadable', 'no'),
(309, 26, '_download_limit', '0'),
(310, 26, '_download_expiry', '0'),
(311, 26, '_stock', NULL),
(312, 26, '_stock_status', 'instock'),
(313, 26, '_wc_average_rating', '0'),
(314, 26, '_wc_review_count', '0'),
(315, 26, '_product_version', '4.1.1'),
(317, 27, '_sku', 'woo-hoodie-green'),
(318, 27, 'total_sales', '0'),
(319, 27, '_tax_status', 'taxable'),
(320, 27, '_tax_class', ''),
(321, 27, '_manage_stock', 'no'),
(322, 27, '_backorders', 'no'),
(323, 27, '_sold_individually', 'no'),
(324, 27, '_virtual', 'no') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(325, 27, '_downloadable', 'no'),
(326, 27, '_download_limit', '0'),
(327, 27, '_download_expiry', '0'),
(328, 27, '_stock', NULL),
(329, 27, '_stock_status', 'instock'),
(330, 27, '_wc_average_rating', '0'),
(331, 27, '_wc_review_count', '0'),
(332, 27, '_product_version', '4.1.1'),
(334, 28, '_sku', 'woo-hoodie-blue'),
(335, 28, 'total_sales', '0'),
(336, 28, '_tax_status', 'taxable'),
(337, 28, '_tax_class', ''),
(338, 28, '_manage_stock', 'no'),
(339, 28, '_backorders', 'no'),
(340, 28, '_sold_individually', 'no'),
(341, 28, '_virtual', 'no'),
(342, 28, '_downloadable', 'no'),
(343, 28, '_download_limit', '0'),
(344, 28, '_download_expiry', '0'),
(345, 28, '_stock', NULL),
(346, 28, '_stock_status', 'instock'),
(347, 28, '_wc_average_rating', '0'),
(348, 28, '_wc_review_count', '0'),
(349, 28, '_product_version', '4.1.1'),
(351, 29, '_sku', 'Woo-tshirt-logo'),
(352, 29, 'total_sales', '0'),
(353, 29, '_tax_status', 'taxable'),
(354, 29, '_tax_class', ''),
(355, 29, '_manage_stock', 'no'),
(356, 29, '_backorders', 'no'),
(357, 29, '_sold_individually', 'no'),
(358, 29, '_virtual', 'no'),
(359, 29, '_downloadable', 'no'),
(360, 29, '_download_limit', '0'),
(361, 29, '_download_expiry', '0'),
(362, 29, '_stock', NULL),
(363, 29, '_stock_status', 'instock'),
(364, 29, '_wc_average_rating', '0'),
(365, 29, '_wc_review_count', '0'),
(366, 29, '_product_version', '4.1.1'),
(368, 30, '_sku', 'Woo-beanie-logo'),
(369, 30, 'total_sales', '0'),
(370, 30, '_tax_status', 'taxable'),
(371, 30, '_tax_class', ''),
(372, 30, '_manage_stock', 'no'),
(373, 30, '_backorders', 'no'),
(374, 30, '_sold_individually', 'no'),
(375, 30, '_virtual', 'no'),
(376, 30, '_downloadable', 'no'),
(377, 30, '_download_limit', '0'),
(378, 30, '_download_expiry', '0'),
(379, 30, '_stock', NULL),
(380, 30, '_stock_status', 'instock'),
(381, 30, '_wc_average_rating', '0'),
(382, 30, '_wc_review_count', '0'),
(383, 30, '_product_version', '4.1.1'),
(385, 31, '_sku', 'logo-collection'),
(386, 31, 'total_sales', '0'),
(387, 31, '_tax_status', 'taxable'),
(388, 31, '_tax_class', ''),
(389, 31, '_manage_stock', 'no'),
(390, 31, '_backorders', 'no'),
(391, 31, '_sold_individually', 'no'),
(392, 31, '_virtual', 'no'),
(393, 31, '_downloadable', 'no'),
(394, 31, '_download_limit', '0'),
(395, 31, '_download_expiry', '0'),
(396, 31, '_stock', NULL),
(397, 31, '_stock_status', 'instock'),
(398, 31, '_wc_average_rating', '0'),
(399, 31, '_wc_review_count', '0'),
(400, 31, '_product_version', '4.1.1'),
(402, 32, '_sku', 'wp-pennant'),
(403, 32, 'total_sales', '0'),
(404, 32, '_tax_status', 'taxable'),
(405, 32, '_tax_class', ''),
(406, 32, '_manage_stock', 'no'),
(407, 32, '_backorders', 'no'),
(408, 32, '_sold_individually', 'no'),
(409, 32, '_virtual', 'no'),
(410, 32, '_downloadable', 'no'),
(411, 32, '_download_limit', '0'),
(412, 32, '_download_expiry', '0'),
(413, 32, '_stock', NULL),
(414, 32, '_stock_status', 'instock'),
(415, 32, '_wc_average_rating', '0'),
(416, 32, '_wc_review_count', '0'),
(417, 32, '_product_version', '4.1.1'),
(419, 33, '_sku', 'woo-hoodie-blue-logo'),
(420, 33, 'total_sales', '0'),
(421, 33, '_tax_status', 'taxable'),
(422, 33, '_tax_class', ''),
(423, 33, '_manage_stock', 'no'),
(424, 33, '_backorders', 'no'),
(425, 33, '_sold_individually', 'no'),
(426, 33, '_virtual', 'no'),
(427, 33, '_downloadable', 'no'),
(428, 33, '_download_limit', '0'),
(429, 33, '_download_expiry', '0'),
(430, 33, '_stock', NULL) ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(431, 33, '_stock_status', 'instock'),
(432, 33, '_wc_average_rating', '0'),
(433, 33, '_wc_review_count', '0'),
(434, 33, '_product_version', '4.1.1'),
(436, 34, '_wp_attached_file', '2020/05/vneck-tee-2.jpg'),
(437, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:23:"2020/05/vneck-tee-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:23:"vneck-tee-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:23:"vneck-tee-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:23:"vneck-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:23:"vneck-tee-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"vneck-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"vneck-tee-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(438, 34, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vneck-tee-2.jpg'),
(439, 35, '_wp_attached_file', '2020/05/vnech-tee-green-1.jpg'),
(440, 35, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:29:"2020/05/vnech-tee-green-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:29:"vnech-tee-green-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"vnech-tee-green-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:29:"vnech-tee-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:29:"vnech-tee-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:29:"vnech-tee-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:29:"vnech-tee-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(441, 35, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-green-1.jpg'),
(442, 36, '_wp_attached_file', '2020/05/vnech-tee-blue-1.jpg'),
(443, 36, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:28:"2020/05/vnech-tee-blue-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:28:"vnech-tee-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(444, 36, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-blue-1.jpg'),
(445, 9, '_wpcom_is_markdown', '1'),
(446, 9, '_wp_old_slug', 'import-placeholder-for-44'),
(447, 9, '_product_image_gallery', '35,36'),
(448, 9, '_thumbnail_id', '34'),
(449, 9, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:7:"pa_size";a:6:{s:4:"name";s:7:"pa_size";s:5:"value";s:0:"";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}}'),
(450, 37, '_wp_attached_file', '2020/05/hoodie-2.jpg'),
(451, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/05/hoodie-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"hoodie-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"hoodie-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"hoodie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"hoodie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"hoodie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"hoodie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(452, 37, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-2.jpg'),
(453, 38, '_wp_attached_file', '2020/05/hoodie-blue-1.jpg'),
(454, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:25:"2020/05/hoodie-blue-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:25:"hoodie-blue-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:25:"hoodie-blue-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:25:"hoodie-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:25:"hoodie-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:25:"hoodie-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:25:"hoodie-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(455, 38, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-blue-1.jpg'),
(456, 39, '_wp_attached_file', '2020/05/hoodie-green-1.jpg'),
(457, 39, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:26:"2020/05/hoodie-green-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:26:"hoodie-green-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"hoodie-green-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:26:"hoodie-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:26:"hoodie-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:26:"hoodie-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:26:"hoodie-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(458, 39, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-green-1.jpg'),
(459, 40, '_wp_attached_file', '2020/05/hoodie-with-logo-2.jpg'),
(460, 40, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:30:"2020/05/hoodie-with-logo-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:30:"hoodie-with-logo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(461, 40, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-logo-2.jpg'),
(462, 10, '_wpcom_is_markdown', '1'),
(463, 10, '_wp_old_slug', 'import-placeholder-for-45'),
(464, 10, '_product_image_gallery', '38,39,40'),
(465, 10, '_thumbnail_id', '37'),
(466, 10, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:4:"logo";a:6:{s:4:"name";s:4:"Logo";s:5:"value";s:8:"Yes | No";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"0";}}'),
(467, 11, '_wpcom_is_markdown', '1'),
(468, 11, '_wp_old_slug', 'import-placeholder-for-46'),
(469, 11, '_regular_price', '45'),
(470, 11, '_thumbnail_id', '40'),
(471, 11, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(472, 11, '_price', '45'),
(473, 41, '_wp_attached_file', '2020/05/tshirt-2.jpg'),
(474, 41, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/05/tshirt-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"tshirt-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"tshirt-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"tshirt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"tshirt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"tshirt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"tshirt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(475, 41, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/tshirt-2.jpg'),
(476, 12, '_wpcom_is_markdown', '1'),
(477, 12, '_wp_old_slug', 'import-placeholder-for-47'),
(478, 12, '_regular_price', '18'),
(479, 12, '_thumbnail_id', '41'),
(480, 12, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(481, 12, '_price', '18'),
(482, 42, '_wp_attached_file', '2020/05/beanie-2.jpg'),
(483, 42, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/05/beanie-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"beanie-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"beanie-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"beanie-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"beanie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"beanie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"beanie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"beanie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"beanie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"beanie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(484, 42, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-2.jpg'),
(485, 13, '_wpcom_is_markdown', '1'),
(486, 13, '_wp_old_slug', 'import-placeholder-for-48'),
(487, 13, '_regular_price', '20'),
(488, 13, '_sale_price', '18'),
(489, 13, '_thumbnail_id', '42'),
(490, 13, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(491, 13, '_price', '18'),
(492, 43, '_wp_attached_file', '2020/05/belt-2.jpg'),
(493, 43, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:18:"2020/05/belt-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"belt-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"belt-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"belt-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"belt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"belt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"belt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"belt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"belt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"belt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(494, 43, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/belt-2.jpg'),
(495, 14, '_wpcom_is_markdown', '1'),
(496, 14, '_wp_old_slug', 'import-placeholder-for-58'),
(497, 14, '_regular_price', '65'),
(498, 14, '_sale_price', '55'),
(499, 14, '_thumbnail_id', '43'),
(500, 14, '_price', '55'),
(501, 44, '_wp_attached_file', '2020/05/cap-2.jpg'),
(502, 44, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:17:"2020/05/cap-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:17:"cap-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:17:"cap-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:17:"cap-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:17:"cap-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:17:"cap-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:17:"cap-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:17:"cap-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:17:"cap-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"cap-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(503, 44, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/cap-2.jpg'),
(504, 15, '_wpcom_is_markdown', '1'),
(505, 15, '_wp_old_slug', 'import-placeholder-for-60'),
(506, 15, '_regular_price', '18'),
(507, 15, '_sale_price', '16'),
(508, 15, '_thumbnail_id', '44'),
(509, 15, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(510, 15, '_price', '16'),
(511, 45, '_wp_attached_file', '2020/05/sunglasses-2.jpg'),
(512, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:24:"2020/05/sunglasses-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:24:"sunglasses-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:24:"sunglasses-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:24:"sunglasses-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:24:"sunglasses-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:24:"sunglasses-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:24:"sunglasses-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(513, 45, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/sunglasses-2.jpg'),
(514, 16, '_wpcom_is_markdown', '1'),
(515, 16, '_wp_old_slug', 'import-placeholder-for-62'),
(516, 16, '_regular_price', '90'),
(517, 16, '_thumbnail_id', '45'),
(518, 16, '_price', '90'),
(519, 46, '_wp_attached_file', '2020/05/hoodie-with-pocket-2.jpg'),
(520, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:32:"2020/05/hoodie-with-pocket-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"hoodie-with-pocket-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(521, 46, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-pocket-2.jpg'),
(522, 17, '_wpcom_is_markdown', '1'),
(523, 17, '_wp_old_slug', 'import-placeholder-for-64'),
(524, 17, '_regular_price', '45'),
(525, 17, '_sale_price', '35'),
(526, 17, '_thumbnail_id', '46'),
(527, 17, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(528, 17, '_price', '35'),
(529, 47, '_wp_attached_file', '2020/05/hoodie-with-zipper-2.jpg'),
(530, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:32:"2020/05/hoodie-with-zipper-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"hoodie-with-zipper-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(531, 47, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-zipper-2.jpg') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(532, 18, '_wpcom_is_markdown', '1'),
(533, 18, '_wp_old_slug', 'import-placeholder-for-66'),
(534, 18, '_regular_price', '45'),
(535, 18, '_thumbnail_id', '47'),
(536, 18, '_price', '45'),
(537, 48, '_wp_attached_file', '2020/05/long-sleeve-tee-2.jpg'),
(538, 48, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:29:"2020/05/long-sleeve-tee-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:29:"long-sleeve-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(539, 48, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/long-sleeve-tee-2.jpg'),
(540, 19, '_wpcom_is_markdown', '1'),
(541, 19, '_wp_old_slug', 'import-placeholder-for-68'),
(542, 19, '_regular_price', '25'),
(543, 19, '_thumbnail_id', '48'),
(544, 19, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(545, 19, '_price', '25'),
(546, 49, '_wp_attached_file', '2020/05/polo-2.jpg'),
(547, 49, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:18:"2020/05/polo-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"polo-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"polo-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"polo-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"polo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"polo-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"polo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"polo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"polo-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"polo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(548, 49, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/polo-2.jpg'),
(549, 20, '_wpcom_is_markdown', '1'),
(550, 20, '_wp_old_slug', 'import-placeholder-for-70'),
(551, 20, '_regular_price', '20'),
(552, 20, '_thumbnail_id', '49'),
(553, 20, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(554, 20, '_price', '20'),
(555, 50, '_wp_attached_file', '2020/05/album-1.jpg'),
(556, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:19:"2020/05/album-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:19:"album-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:19:"album-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:19:"album-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:19:"album-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:19:"album-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:19:"album-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"album-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"album-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:19:"album-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(557, 50, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/album-1.jpg'),
(558, 21, '_wpcom_is_markdown', '1'),
(559, 21, '_wp_old_slug', 'import-placeholder-for-73'),
(560, 21, '_regular_price', '15'),
(561, 21, '_thumbnail_id', '50'),
(562, 21, '_downloadable_files', 'a:2:{s:36:"466f0eae-23a5-4e7b-a5b0-349d7a69bcc2";a:3:{s:2:"id";s:36:"466f0eae-23a5-4e7b-a5b0-349d7a69bcc2";s:4:"name";s:8:"Single 1";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}s:36:"47c0f4dc-3e08-431f-a13e-bda17e78e101";a:3:{s:2:"id";s:36:"47c0f4dc-3e08-431f-a13e-bda17e78e101";s:4:"name";s:8:"Single 2";s:4:"file";s:84:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/album.jpg";}}'),
(563, 21, '_price', '15'),
(564, 51, '_wp_attached_file', '2020/05/single-1.jpg'),
(565, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:20:"2020/05/single-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"single-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"single-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"single-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"single-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"single-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"single-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"single-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"single-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"single-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(566, 51, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/single-1.jpg'),
(567, 22, '_wpcom_is_markdown', '1'),
(568, 22, '_wp_old_slug', 'import-placeholder-for-75'),
(569, 22, '_regular_price', '3'),
(570, 22, '_sale_price', '2'),
(571, 22, '_thumbnail_id', '51'),
(572, 22, '_downloadable_files', 'a:1:{s:36:"50dd3af0-032b-4861-9289-28d919190c3f";a:3:{s:2:"id";s:36:"50dd3af0-032b-4861-9289-28d919190c3f";s:4:"name";s:6:"Single";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}}'),
(573, 22, '_price', '2'),
(574, 23, '_wpcom_is_markdown', ''),
(575, 23, '_wp_old_slug', 'import-placeholder-for-76'),
(576, 23, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(577, 23, '_regular_price', '20'),
(578, 23, '_thumbnail_id', '34'),
(579, 23, 'attribute_pa_color', 'red'),
(580, 23, 'attribute_pa_size', ''),
(581, 23, '_price', '20'),
(582, 24, '_wpcom_is_markdown', ''),
(583, 24, '_wp_old_slug', 'import-placeholder-for-77'),
(584, 24, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(585, 24, '_regular_price', '20'),
(586, 24, '_thumbnail_id', '35'),
(587, 24, 'attribute_pa_color', 'green'),
(588, 24, 'attribute_pa_size', ''),
(589, 24, '_price', '20'),
(590, 25, '_wpcom_is_markdown', ''),
(591, 25, '_wp_old_slug', 'import-placeholder-for-78'),
(592, 25, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(593, 25, '_regular_price', '15'),
(594, 25, '_thumbnail_id', '36'),
(595, 25, 'attribute_pa_color', 'blue'),
(596, 25, 'attribute_pa_size', ''),
(597, 25, '_price', '15'),
(598, 9, '_price', '15'),
(599, 9, '_price', '20'),
(600, 26, '_wpcom_is_markdown', ''),
(601, 26, '_wp_old_slug', 'import-placeholder-for-79'),
(602, 26, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(603, 26, '_regular_price', '45'),
(604, 26, '_sale_price', '42'),
(605, 26, '_thumbnail_id', '37'),
(606, 26, 'attribute_pa_color', 'red'),
(607, 26, 'attribute_logo', 'No'),
(608, 26, '_price', '42'),
(609, 27, '_wpcom_is_markdown', ''),
(610, 27, '_wp_old_slug', 'import-placeholder-for-80'),
(611, 27, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(612, 27, '_regular_price', '45'),
(613, 27, '_thumbnail_id', '39'),
(614, 27, 'attribute_pa_color', 'green'),
(615, 27, 'attribute_logo', 'No'),
(616, 27, '_price', '45'),
(617, 28, '_wpcom_is_markdown', ''),
(618, 28, '_wp_old_slug', 'import-placeholder-for-81'),
(619, 28, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(620, 28, '_regular_price', '45'),
(621, 28, '_thumbnail_id', '38'),
(622, 28, 'attribute_pa_color', 'blue'),
(623, 28, 'attribute_logo', 'No'),
(624, 28, '_price', '45'),
(625, 52, '_wp_attached_file', '2020/05/t-shirt-with-logo-1.jpg'),
(626, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:31:"2020/05/t-shirt-with-logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:31:"t-shirt-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(627, 52, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/t-shirt-with-logo-1.jpg'),
(628, 29, '_wpcom_is_markdown', '1'),
(629, 29, '_wp_old_slug', 'import-placeholder-for-83'),
(630, 29, '_regular_price', '18'),
(631, 29, '_thumbnail_id', '52') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(632, 29, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(633, 29, '_price', '18'),
(634, 53, '_wp_attached_file', '2020/05/beanie-with-logo-1.jpg'),
(635, 53, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:30:"2020/05/beanie-with-logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:30:"beanie-with-logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"beanie-with-logo-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:30:"beanie-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:30:"beanie-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:30:"beanie-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:30:"beanie-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(636, 53, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-with-logo-1.jpg'),
(637, 30, '_wpcom_is_markdown', '1'),
(638, 30, '_wp_old_slug', 'import-placeholder-for-85'),
(639, 30, '_regular_price', '20'),
(640, 30, '_sale_price', '18'),
(641, 30, '_thumbnail_id', '53'),
(642, 30, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(643, 30, '_price', '18'),
(644, 54, '_wp_attached_file', '2020/05/logo-1.jpg'),
(645, 54, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:799;s:4:"file";s:18:"2020/05/logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"logo-1-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"logo-1-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"logo-1-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(646, 54, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/logo-1.jpg'),
(647, 31, '_wpcom_is_markdown', '1'),
(648, 31, '_wp_old_slug', 'import-placeholder-for-87'),
(649, 31, '_children', 'a:3:{i:0;i:11;i:1;i:12;i:2;i:13;}'),
(650, 31, '_product_image_gallery', '53,52,40'),
(651, 31, '_thumbnail_id', '54'),
(652, 31, '_price', '18'),
(653, 31, '_price', '45'),
(654, 55, '_wp_attached_file', '2020/05/pennant-1.jpg'),
(655, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:21:"2020/05/pennant-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:21:"pennant-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:21:"pennant-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"pennant-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:21:"pennant-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:21:"pennant-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:21:"pennant-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:21:"pennant-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:21:"pennant-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"pennant-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(656, 55, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/pennant-1.jpg'),
(657, 32, '_wpcom_is_markdown', '1'),
(658, 32, '_wp_old_slug', 'import-placeholder-for-89'),
(659, 32, '_regular_price', '11.05'),
(660, 32, '_thumbnail_id', '55'),
(661, 32, '_product_url', 'https://mercantile.wordpress.org/product/wordpress-pennant/'),
(662, 32, '_button_text', 'Buy on the WordPress swag store!'),
(663, 32, '_price', '11.05'),
(664, 33, '_wpcom_is_markdown', ''),
(665, 33, '_wp_old_slug', 'import-placeholder-for-90'),
(666, 33, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(667, 33, '_regular_price', '45'),
(668, 33, '_thumbnail_id', '40'),
(669, 33, 'attribute_pa_color', 'blue'),
(670, 33, 'attribute_logo', 'Yes'),
(671, 33, '_price', '45'),
(672, 10, '_price', '42'),
(673, 10, '_price', '45'),
(676, 57, '_wp_attached_file', '2020/05/starcat-review-ct.zip'),
(677, 57, '_wp_attachment_context', 'upgrader'),
(680, 59, '_edit_lock', '1598247390:1'),
(681, 61, '_wp_attached_file', '2020/08/download.png'),
(682, 61, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:20:"2020/08/download.png";s:5:"sizes";a:12:{s:6:"medium";a:4:{s:4:"file";s:20:"download-300x169.png";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:21:"download-1024x576.png";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"download-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:20:"download-768x432.png";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:9:"image/png";}s:9:"1536x1536";a:4:{s:4:"file";s:21:"download-1536x864.png";s:5:"width";i:1536;s:6:"height";i:864;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:21:"download-1200x675.png";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:9:"image/png";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"download-450x450.png";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:9:"image/png";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"download-600x338.png";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:9:"image/png";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"download-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"download-450x450.png";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:20:"download-600x338.png";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"download-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(683, 62, '_wp_attached_file', '2020/08/git-add-collaburators.png'),
(684, 62, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:33:"2020/08/git-add-collaburators.png";s:5:"sizes";a:12:{s:6:"medium";a:4:{s:4:"file";s:33:"git-add-collaburators-300x169.png";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:34:"git-add-collaburators-1024x576.png";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:33:"git-add-collaburators-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:33:"git-add-collaburators-768x432.png";s:5:"width";i:768;s:6:"height";i:432;s:9:"mime-type";s:9:"image/png";}s:9:"1536x1536";a:4:{s:4:"file";s:34:"git-add-collaburators-1536x864.png";s:5:"width";i:1536;s:6:"height";i:864;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:34:"git-add-collaburators-1200x675.png";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:9:"image/png";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:33:"git-add-collaburators-450x450.png";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:9:"image/png";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:33:"git-add-collaburators-600x338.png";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:9:"image/png";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:33:"git-add-collaburators-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}s:12:"shop_catalog";a:4:{s:4:"file";s:33:"git-add-collaburators-450x450.png";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:9:"image/png";}s:11:"shop_single";a:4:{s:4:"file";s:33:"git-add-collaburators-600x338.png";s:5:"width";i:600;s:6:"height";i:338;s:9:"mime-type";s:9:"image/png";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:33:"git-add-collaburators-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-05-21 10:02:52', '2020-05-21 10:02:52', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-05-21 10:02:52', '2020-05-21 10:02:52', '', 0, 'http://127.0.0.1:83/?p=1', 0, 'post', '', 1),
(2, 1, '2020-05-21 10:02:52', '2020-05-21 10:02:52', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://127.0.0.1:83/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-05-21 10:02:52', '2020-05-21 10:02:52', '', 0, 'http://127.0.0.1:83/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-05-21 10:02:52', '2020-05-21 10:02:52', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://127.0.0.1:83.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-05-21 10:02:52', '2020-05-21 10:02:52', '', 0, 'http://127.0.0.1:83/?page_id=3', 0, 'page', '', 0),
(4, 1, '2020-05-21 10:09:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-05-21 10:09:38', '0000-00-00 00:00:00', '', 0, 'http://127.0.0.1:83/?p=4', 0, 'post', '', 0),
(7, 1, '2020-05-21 12:01:11', '2020-05-21 12:01:11', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-05-21 12:01:11', '2020-05-21 12:01:11', '', 0, 'http://127.0.0.1:83/wp-content/uploads/2020/05/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(9, 1, '2020-05-21 12:02:11', '2020-05-21 12:02:11', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'V-Neck T-Shirt', 'This is a variable product.', 'publish', 'open', 'closed', '', 'v-neck-t-shirt', '', '', '2020-05-21 12:03:02', '2020-05-21 12:03:02', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-44/', 0, 'product', '', 0),
(10, 1, '2020-05-21 12:02:12', '2020-05-21 12:02:12', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie', 'This is a variable product.', 'publish', 'open', 'closed', '', 'hoodie', '', '', '2020-05-21 12:03:12', '2020-05-21 12:03:12', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-45/', 0, 'product', '', 0),
(11, 1, '2020-05-21 12:02:12', '2020-05-21 12:02:12', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2020-05-21 12:02:34', '2020-05-21 12:02:34', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-46/', 0, 'product', '', 0),
(12, 1, '2020-05-21 12:02:12', '2020-05-21 12:02:12', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt', '', '', '2020-05-21 12:02:37', '2020-05-21 12:02:37', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-47/', 0, 'product', '', 0),
(13, 1, '2020-05-21 12:02:13', '2020-05-21 12:02:13', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie', '', '', '2020-05-21 12:02:39', '2020-05-21 12:02:39', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-48/', 0, 'product', '', 0),
(14, 1, '2020-05-21 12:02:13', '2020-05-21 12:02:13', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Belt', 'This is a simple product.', 'publish', 'open', 'closed', '', 'belt', '', '', '2020-05-21 12:02:44', '2020-05-21 12:02:44', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-58/', 0, 'product', '', 0),
(15, 1, '2020-05-21 12:02:13', '2020-05-21 12:02:13', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Cap', 'This is a simple product.', 'publish', 'open', 'closed', '', 'cap', '', '', '2020-05-21 12:02:46', '2020-05-21 12:02:46', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-60/', 0, 'product', '', 0),
(16, 1, '2020-05-21 12:02:14', '2020-05-21 12:02:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Sunglasses', 'This is a simple product.', 'publish', 'open', 'closed', '', 'sunglasses', '', '', '2020-05-21 12:02:48', '2020-05-21 12:02:48', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-62/', 0, 'product', '', 0),
(17, 1, '2020-05-21 12:02:14', '2020-05-21 12:02:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Pocket', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-pocket', '', '', '2020-05-21 12:02:50', '2020-05-21 12:02:50', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-64/', 0, 'product', '', 0),
(18, 1, '2020-05-21 12:02:14', '2020-05-21 12:02:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Zipper', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-zipper', '', '', '2020-05-21 12:02:52', '2020-05-21 12:02:52', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-66/', 0, 'product', '', 0),
(19, 1, '2020-05-21 12:02:14', '2020-05-21 12:02:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Long Sleeve Tee', 'This is a simple product.', 'publish', 'open', 'closed', '', 'long-sleeve-tee', '', '', '2020-05-21 12:02:54', '2020-05-21 12:02:54', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-68/', 0, 'product', '', 0),
(20, 1, '2020-05-21 12:02:15', '2020-05-21 12:02:15', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Polo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'polo', '', '', '2020-05-21 12:02:56', '2020-05-21 12:02:56', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-70/', 0, 'product', '', 0),
(21, 1, '2020-05-21 12:02:15', '2020-05-21 12:02:15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Album', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'album', '', '', '2020-05-21 12:02:58', '2020-05-21 12:02:58', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-73/', 0, 'product', '', 0),
(22, 1, '2020-05-21 12:02:15', '2020-05-21 12:02:15', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Single', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'single', '', '', '2020-05-21 12:03:01', '2020-05-21 12:03:01', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-75/', 0, 'product', '', 0),
(23, 1, '2020-05-21 12:02:16', '2020-05-21 12:02:16', '', 'V-Neck T-Shirt - Red', 'Color: Red', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-red', '', '', '2020-05-21 12:03:01', '2020-05-21 12:03:01', '', 9, 'http://127.0.0.1:83/product/import-placeholder-for-76/', 0, 'product_variation', '', 0),
(24, 1, '2020-05-21 12:02:16', '2020-05-21 12:02:16', '', 'V-Neck T-Shirt - Green', 'Color: Green', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-green', '', '', '2020-05-21 12:03:01', '2020-05-21 12:03:01', '', 9, 'http://127.0.0.1:83/product/import-placeholder-for-77/', 0, 'product_variation', '', 0),
(25, 1, '2020-05-21 12:02:16', '2020-05-21 12:02:16', '', 'V-Neck T-Shirt - Blue', 'Color: Blue', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-blue', '', '', '2020-05-21 12:03:01', '2020-05-21 12:03:01', '', 9, 'http://127.0.0.1:83/product/import-placeholder-for-78/', 0, 'product_variation', '', 0),
(26, 1, '2020-05-21 12:02:17', '2020-05-21 12:02:17', '', 'Hoodie - Red, No', 'Color: Red, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-red-no', '', '', '2020-05-21 12:03:02', '2020-05-21 12:03:02', '', 10, 'http://127.0.0.1:83/product/import-placeholder-for-79/', 1, 'product_variation', '', 0),
(27, 1, '2020-05-21 12:02:17', '2020-05-21 12:02:17', '', 'Hoodie - Green, No', 'Color: Green, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-green-no', '', '', '2020-05-21 12:03:02', '2020-05-21 12:03:02', '', 10, 'http://127.0.0.1:83/product/import-placeholder-for-80/', 2, 'product_variation', '', 0),
(28, 1, '2020-05-21 12:02:17', '2020-05-21 12:02:17', '', 'Hoodie - Blue, No', 'Color: Blue, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-blue-no', '', '', '2020-05-21 12:03:03', '2020-05-21 12:03:03', '', 10, 'http://127.0.0.1:83/product/import-placeholder-for-81/', 3, 'product_variation', '', 0),
(29, 1, '2020-05-21 12:02:17', '2020-05-21 12:02:17', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt-with-logo', '', '', '2020-05-21 12:03:05', '2020-05-21 12:03:05', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-83/', 0, 'product', '', 0),
(30, 1, '2020-05-21 12:02:18', '2020-05-21 12:02:18', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie-with-logo', '', '', '2020-05-21 12:03:07', '2020-05-21 12:03:07', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-85/', 0, 'product', '', 0),
(31, 1, '2020-05-21 12:02:18', '2020-05-21 12:02:18', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Logo Collection', 'This is a grouped product.', 'publish', 'open', 'closed', '', 'logo-collection', '', '', '2020-05-21 12:03:09', '2020-05-21 12:03:09', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-87/', 0, 'product', '', 0),
(32, 1, '2020-05-21 12:02:18', '2020-05-21 12:02:18', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'WordPress Pennant', 'This is an external product.', 'publish', 'open', 'closed', '', 'wordpress-pennant', '', '', '2020-05-21 12:03:11', '2020-05-21 12:03:11', '', 0, 'http://127.0.0.1:83/product/import-placeholder-for-89/', 0, 'product', '', 0),
(33, 1, '2020-05-21 12:02:18', '2020-05-21 12:02:18', '', 'Hoodie - Blue, Yes', 'Color: Blue, Logo: Yes', 'publish', 'closed', 'closed', '', 'hoodie-blue-yes', '', '', '2020-05-21 12:03:11', '2020-05-21 12:03:11', '', 10, 'http://127.0.0.1:83/product/import-placeholder-for-90/', 0, 'product_variation', '', 0),
(34, 1, '2020-05-21 12:02:20', '2020-05-21 12:02:20', '', 'vneck-tee-2.jpg', '', 'inherit', 'open', 'closed', '', 'vneck-tee-2-jpg', '', '', '2020-05-21 12:02:20', '2020-05-21 12:02:20', '', 9, 'http://127.0.0.1:83/wp-content/uploads/2020/05/vneck-tee-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2020-05-21 12:02:23', '2020-05-21 12:02:23', '', 'vnech-tee-green-1.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-green-1-jpg', '', '', '2020-05-21 12:02:23', '2020-05-21 12:02:23', '', 9, 'http://127.0.0.1:83/wp-content/uploads/2020/05/vnech-tee-green-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2020-05-21 12:02:25', '2020-05-21 12:02:25', '', 'vnech-tee-blue-1.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-blue-1-jpg', '', '', '2020-05-21 12:02:25', '2020-05-21 12:02:25', '', 9, 'http://127.0.0.1:83/wp-content/uploads/2020/05/vnech-tee-blue-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 1, '2020-05-21 12:02:28', '2020-05-21 12:02:28', '', 'hoodie-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-2-jpg', '', '', '2020-05-21 12:02:28', '2020-05-21 12:02:28', '', 10, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2020-05-21 12:02:29', '2020-05-21 12:02:29', '', 'hoodie-blue-1.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-blue-1-jpg', '', '', '2020-05-21 12:02:29', '2020-05-21 12:02:29', '', 10, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-blue-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2020-05-21 12:02:31', '2020-05-21 12:02:31', '', 'hoodie-green-1.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-green-1-jpg', '', '', '2020-05-21 12:02:31', '2020-05-21 12:02:31', '', 10, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-green-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2020-05-21 12:02:33', '2020-05-21 12:02:33', '', 'hoodie-with-logo-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-logo-2-jpg', '', '', '2020-05-21 12:02:33', '2020-05-21 12:02:33', '', 10, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-with-logo-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2020-05-21 12:02:36', '2020-05-21 12:02:36', '', 'tshirt-2.jpg', '', 'inherit', 'open', 'closed', '', 'tshirt-2-jpg', '', '', '2020-05-21 12:02:36', '2020-05-21 12:02:36', '', 12, 'http://127.0.0.1:83/wp-content/uploads/2020/05/tshirt-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2020-05-21 12:02:38', '2020-05-21 12:02:38', '', 'beanie-2.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-2-jpg', '', '', '2020-05-21 12:02:38', '2020-05-21 12:02:38', '', 13, 'http://127.0.0.1:83/wp-content/uploads/2020/05/beanie-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2020-05-21 12:02:43', '2020-05-21 12:02:43', '', 'belt-2.jpg', '', 'inherit', 'open', 'closed', '', 'belt-2-jpg', '', '', '2020-05-21 12:02:43', '2020-05-21 12:02:43', '', 14, 'http://127.0.0.1:83/wp-content/uploads/2020/05/belt-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-05-21 12:02:45', '2020-05-21 12:02:45', '', 'cap-2.jpg', '', 'inherit', 'open', 'closed', '', 'cap-2-jpg', '', '', '2020-05-21 12:02:45', '2020-05-21 12:02:45', '', 15, 'http://127.0.0.1:83/wp-content/uploads/2020/05/cap-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(45, 1, '2020-05-21 12:02:47', '2020-05-21 12:02:47', '', 'sunglasses-2.jpg', '', 'inherit', 'open', 'closed', '', 'sunglasses-2-jpg', '', '', '2020-05-21 12:02:47', '2020-05-21 12:02:47', '', 16, 'http://127.0.0.1:83/wp-content/uploads/2020/05/sunglasses-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2020-05-21 12:02:49', '2020-05-21 12:02:49', '', 'hoodie-with-pocket-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-pocket-2-jpg', '', '', '2020-05-21 12:02:49', '2020-05-21 12:02:49', '', 17, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-with-pocket-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2020-05-21 12:02:51', '2020-05-21 12:02:51', '', 'hoodie-with-zipper-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-zipper-2-jpg', '', '', '2020-05-21 12:02:51', '2020-05-21 12:02:51', '', 18, 'http://127.0.0.1:83/wp-content/uploads/2020/05/hoodie-with-zipper-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2020-05-21 12:02:53', '2020-05-21 12:02:53', '', 'long-sleeve-tee-2.jpg', '', 'inherit', 'open', 'closed', '', 'long-sleeve-tee-2-jpg', '', '', '2020-05-21 12:02:53', '2020-05-21 12:02:53', '', 19, 'http://127.0.0.1:83/wp-content/uploads/2020/05/long-sleeve-tee-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2020-05-21 12:02:55', '2020-05-21 12:02:55', '', 'polo-2.jpg', '', 'inherit', 'open', 'closed', '', 'polo-2-jpg', '', '', '2020-05-21 12:02:55', '2020-05-21 12:02:55', '', 20, 'http://127.0.0.1:83/wp-content/uploads/2020/05/polo-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2020-05-21 12:02:58', '2020-05-21 12:02:58', '', 'album-1.jpg', '', 'inherit', 'open', 'closed', '', 'album-1-jpg', '', '', '2020-05-21 12:02:58', '2020-05-21 12:02:58', '', 21, 'http://127.0.0.1:83/wp-content/uploads/2020/05/album-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2020-05-21 12:03:00', '2020-05-21 12:03:00', '', 'single-1.jpg', '', 'inherit', 'open', 'closed', '', 'single-1-jpg', '', '', '2020-05-21 12:03:00', '2020-05-21 12:03:00', '', 22, 'http://127.0.0.1:83/wp-content/uploads/2020/05/single-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2020-05-21 12:03:04', '2020-05-21 12:03:04', '', 't-shirt-with-logo-1.jpg', '', 'inherit', 'open', 'closed', '', 't-shirt-with-logo-1-jpg', '', '', '2020-05-21 12:03:04', '2020-05-21 12:03:04', '', 29, 'http://127.0.0.1:83/wp-content/uploads/2020/05/t-shirt-with-logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2020-05-21 12:03:06', '2020-05-21 12:03:06', '', 'beanie-with-logo-1.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-with-logo-1-jpg', '', '', '2020-05-21 12:03:06', '2020-05-21 12:03:06', '', 30, 'http://127.0.0.1:83/wp-content/uploads/2020/05/beanie-with-logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2020-05-21 12:03:08', '2020-05-21 12:03:08', '', 'logo-1.jpg', '', 'inherit', 'open', 'closed', '', 'logo-1-jpg', '', '', '2020-05-21 12:03:08', '2020-05-21 12:03:08', '', 31, 'http://127.0.0.1:83/wp-content/uploads/2020/05/logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(55, 1, '2020-05-21 12:03:10', '2020-05-21 12:03:10', '', 'pennant-1.jpg', '', 'inherit', 'open', 'closed', '', 'pennant-1-jpg', '', '', '2020-05-21 12:03:10', '2020-05-21 12:03:10', '', 32, 'http://127.0.0.1:83/wp-content/uploads/2020/05/pennant-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2020-05-25 06:28:29', '2020-05-25 06:28:29', 'http://127.0.0.1:83/wp-content/uploads/2020/05/starcat-review-ct.zip', 'starcat-review-ct.zip', '', 'private', 'open', 'closed', '', 'starcat-review-ct-zip', '', '', '2020-05-25 06:28:29', '2020-05-25 06:28:29', '', 0, 'http://127.0.0.1:83/wp-content/uploads/2020/05/starcat-review-ct.zip', 0, 'attachment', '', 0),
(59, 1, '2020-08-24 05:30:54', '2020-08-24 05:30:54', '<!-- wp:paragraph -->\n<p>Improved review post content</p>\n<!-- /wp:paragraph -->', 'First Review Post', '', 'publish', 'open', 'closed', '', 'first-review-post', '', '', '2020-08-24 05:30:54', '2020-08-24 05:30:54', '', 0, 'http://127.0.0.1:83/?post_type=starcat_review&#038;p=59', 0, 'starcat_review', '', 1),
(60, 1, '2020-08-24 05:30:54', '2020-08-24 05:30:54', '<!-- wp:paragraph -->\n<p>Improved review post content</p>\n<!-- /wp:paragraph -->', 'First Review Post', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2020-08-24 05:30:54', '2020-08-24 05:30:54', '', 59, 'http://127.0.0.1:83/59-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2020-08-24 05:32:31', '2020-08-24 05:32:31', '', 'download', '', 'inherit', 'open', 'closed', '', 'download', '', '', '2020-08-24 05:32:31', '2020-08-24 05:32:31', '', 59, 'http://127.0.0.1:83/wp-content/uploads/2020/08/download.png', 0, 'attachment', 'image/png', 0),
(62, 1, '2020-08-24 05:32:32', '2020-08-24 05:32:32', '', 'git-add-collaburators', '', 'inherit', 'open', 'closed', '', 'git-add-collaburators', '', '', '2020-08-24 05:32:32', '2020-08-24 05:32:32', '', 59, 'http://127.0.0.1:83/wp-content/uploads/2020/08/git-add-collaburators.png', 0, 'attachment', 'image/png', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(9, 4, 0),
(9, 8, 0),
(9, 17, 0),
(9, 22, 0),
(9, 23, 0),
(9, 24, 0),
(9, 25, 0),
(9, 26, 0),
(9, 27, 0),
(10, 4, 0),
(10, 18, 0),
(10, 22, 0),
(10, 23, 0),
(10, 24, 0),
(11, 2, 0),
(11, 18, 0),
(11, 22, 0),
(12, 2, 0),
(12, 17, 0),
(12, 28, 0),
(13, 2, 0),
(13, 19, 0),
(13, 24, 0),
(14, 2, 0),
(14, 19, 0),
(15, 2, 0),
(15, 8, 0),
(15, 19, 0),
(15, 29, 0),
(16, 2, 0),
(16, 8, 0),
(16, 19, 0),
(17, 2, 0),
(17, 6, 0),
(17, 7, 0),
(17, 8, 0),
(17, 18, 0),
(17, 28, 0),
(18, 2, 0),
(18, 8, 0),
(18, 18, 0),
(19, 2, 0),
(19, 17, 0),
(19, 23, 0),
(20, 2, 0),
(20, 17, 0),
(20, 22, 0),
(21, 2, 0),
(21, 20, 0),
(22, 2, 0),
(22, 20, 0),
(23, 15, 0),
(23, 24, 0),
(24, 15, 0),
(24, 23, 0),
(25, 15, 0),
(25, 22, 0),
(26, 15, 0),
(26, 24, 0),
(27, 15, 0),
(27, 23, 0),
(28, 15, 0),
(28, 22, 0),
(29, 2, 0),
(29, 17, 0),
(29, 28, 0),
(30, 2, 0),
(30, 19, 0),
(30, 24, 0),
(31, 3, 0),
(31, 16, 0),
(32, 5, 0),
(32, 21, 0),
(33, 15, 0),
(33, 22, 0),
(59, 30, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 14),
(3, 3, 'product_type', '', 0, 1),
(4, 4, 'product_type', '', 0, 2),
(5, 5, 'product_type', '', 0, 1),
(6, 6, 'product_visibility', '', 0, 1),
(7, 7, 'product_visibility', '', 0, 1),
(8, 8, 'product_visibility', '', 0, 5),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 0),
(16, 16, 'product_cat', '', 0, 1),
(17, 17, 'product_cat', '', 16, 5),
(18, 18, 'product_cat', '', 16, 4),
(19, 19, 'product_cat', '', 16, 5),
(20, 20, 'product_cat', '', 0, 2),
(21, 21, 'product_cat', '', 0, 1),
(22, 22, 'pa_color', '', 0, 4),
(23, 23, 'pa_color', '', 0, 3),
(24, 24, 'pa_color', '', 0, 4),
(25, 25, 'pa_size', '', 0, 1),
(26, 26, 'pa_size', '', 0, 1),
(27, 27, 'pa_size', '', 0, 1),
(28, 28, 'pa_color', '', 0, 3),
(29, 29, 'pa_color', '', 0, 1),
(30, 30, 'scr_category', '', 0, 1) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_termmeta`
#

DROP TABLE IF EXISTS `wp_termmeta`;


#
# Table structure of table `wp_termmeta`
#

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_termmeta`
#
INSERT INTO `wp_termmeta` ( `meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 15, 'product_count_product_cat', '0'),
(2, 16, 'order', '0'),
(3, 17, 'order', '0'),
(4, 18, 'order', '0'),
(5, 19, 'order', '0'),
(6, 20, 'order', '0'),
(7, 21, 'order', '0'),
(8, 17, 'product_count_product_cat', '5'),
(9, 16, 'product_count_product_cat', '14'),
(10, 22, 'order_pa_color', '0'),
(11, 23, 'order_pa_color', '0'),
(12, 24, 'order_pa_color', '0'),
(13, 25, 'order_pa_size', '0'),
(14, 26, 'order_pa_size', '0'),
(15, 27, 'order_pa_size', '0'),
(16, 18, 'product_count_product_cat', '3'),
(17, 28, 'order_pa_color', '0'),
(18, 19, 'product_count_product_cat', '5'),
(19, 29, 'order_pa_color', '0'),
(20, 20, 'product_count_product_cat', '2'),
(21, 21, 'product_count_product_cat', '1') ;

#
# End of data contents of table `wp_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Uncategorized', 'uncategorized', 0),
(16, 'Clothing', 'clothing', 0),
(17, 'Tshirts', 'tshirts', 0),
(18, 'Hoodies', 'hoodies', 0),
(19, 'Accessories', 'accessories', 0),
(20, 'Music', 'music', 0),
(21, 'Decor', 'decor', 0),
(22, 'Blue', 'blue', 0),
(23, 'Green', 'green', 0),
(24, 'Red', 'red', 0),
(25, 'Large', 'large', 0),
(26, 'Medium', 'medium', 0),
(27, 'Small', 'small', 0),
(28, 'Gray', 'gray', 0),
(29, 'Yellow', 'yellow', 0),
(30, 'Assumption', 'assumption', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:"21b9bf3466b114166097a119b7967959e6df9d8e4d0ce74f6eb9a517c51c437b";a:4:{s:10:"expiration";i:1598418538;s:2:"ip";s:10:"172.23.0.1";s:2:"ua";s:18:"Symfony BrowserKit";s:5:"login";i:1598245738;}s:64:"e8d4ca785817a0523486af5bdcbbd12583082f536dd82acd4e79c47e7e3dcc14";a:4:{s:10:"expiration";i:1599455346;s:2:"ip";s:10:"172.23.0.1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36";s:5:"login";i:1598245746;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, '_woocommerce_tracks_anon_id', 'woo:Yt43Z+YK5QipqszSlQEeaJBP'),
(19, 1, 'wc_last_active', '1598227200'),
(20, 1, 'wp_woocommerce_product_import_mapping', 'a:51:{i:0;s:2:"id";i:1;s:4:"type";i:2;s:3:"sku";i:3;s:4:"name";i:4;s:9:"published";i:5;s:8:"featured";i:6;s:18:"catalog_visibility";i:7;s:17:"short_description";i:8;s:11:"description";i:9;s:17:"date_on_sale_from";i:10;s:15:"date_on_sale_to";i:11;s:10:"tax_status";i:12;s:9:"tax_class";i:13;s:12:"stock_status";i:14;s:14:"stock_quantity";i:15;s:10:"backorders";i:16;s:17:"sold_individually";i:17;s:0:"";i:18;s:0:"";i:19;s:0:"";i:20;s:0:"";i:21;s:15:"reviews_allowed";i:22;s:13:"purchase_note";i:23;s:10:"sale_price";i:24;s:13:"regular_price";i:25;s:12:"category_ids";i:26;s:7:"tag_ids";i:27;s:17:"shipping_class_id";i:28;s:6:"images";i:29;s:14:"download_limit";i:30;s:15:"download_expiry";i:31;s:9:"parent_id";i:32;s:16:"grouped_products";i:33;s:10:"upsell_ids";i:34;s:14:"cross_sell_ids";i:35;s:11:"product_url";i:36;s:11:"button_text";i:37;s:10:"menu_order";i:38;s:16:"attributes:name1";i:39;s:17:"attributes:value1";i:40;s:19:"attributes:visible1";i:41;s:20:"attributes:taxonomy1";i:42;s:16:"attributes:name2";i:43;s:17:"attributes:value2";i:44;s:19:"attributes:visible2";i:45;s:20:"attributes:taxonomy2";i:46;s:23:"meta:_wpcom_is_markdown";i:47;s:15:"downloads:name1";i:48;s:14:"downloads:url1";i:49;s:15:"downloads:name2";i:50;s:14:"downloads:url2";}'),
(21, 1, 'wp_product_import_error_log', 'a:0:{}'),
(22, 1, 'dismissed_no_secure_connection_notice', '1'),
(23, 1, '_order_count', '0'),
(27, 1, 'community-events-location', 'a:1:{s:2:"ip";s:10:"172.23.0.0";}'),
(28, 1, 'dismissed_update_notice', '1') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B.4KLebcWrJiJCDZDUZ4zZLNe17hgF1', 'admin', 'dev-email@flywheel.local', 'http://127.0.0.1:83', '2020-05-21 10:02:52', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_admin_note_actions`
#

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;


#
# Table structure of table `wp_wc_admin_note_actions`
#

CREATE TABLE `wp_wc_admin_note_actions` (
  `action_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_note_actions`
#
INSERT INTO `wp_wc_admin_note_actions` ( `action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`, `actioned_text`) VALUES
(3, 3, 'connect', 'Connect', '?page=wc-addons&section=helper', 'unactioned', 0, ''),
(5, 5, 'learn-more', 'Learn more', 'https://woocommerce.com/mobile/', 'actioned', 0, ''),
(6, 6, 'learn-more', 'Learn more', 'https://woocommerce.com/products/facebook/', 'unactioned', 0, ''),
(7, 6, 'install-now', 'Install now', '', 'unactioned', 1, ''),
(31, 7, 'update-db_done', 'Thanks!', 'http://127.0.0.1:83/wp-admin/admin.php?page=wc-status&tab=action-scheduler&s=woocommerce_run_update&status=pending&do_update_woocommerce=true&wc-hide-notice=update&_wc_notice_nonce=693e280986', 'actioned', 1, '') ;

#
# End of data contents of table `wp_wc_admin_note_actions`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_admin_notes`
#

DROP TABLE IF EXISTS `wp_wc_admin_notes`;


#
# Table structure of table `wp_wc_admin_notes`
#

CREATE TABLE `wp_wc_admin_notes` (
  `note_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'info',
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  `layout` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_notes`
#
INSERT INTO `wp_wc_admin_notes` ( `note_id`, `name`, `type`, `locale`, `title`, `content`, `icon`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`, `layout`, `image`, `is_deleted`) VALUES
(3, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-21 12:01:14', NULL, 0, '', NULL, 0),
(5, 'wc-admin-mobile-app', 'info', 'en_US', 'Install Woo mobile app', 'Install the WooCommerce mobile app to manage orders, receive sales notifications, and view key metrics — wherever you are.', 'phone', '{}', 'unactioned', 'woocommerce-admin', '2020-05-25 05:37:17', NULL, 0, '', NULL, 0),
(6, 'wc-admin-facebook-extension', 'info', 'en_US', 'Market on Facebook', 'Grow your business by targeting the right people and driving sales with Facebook. You can install this free extension now.', 'thumbs-up', '{}', 'unactioned', 'woocommerce-admin', '2020-05-25 05:37:17', NULL, 0, '', NULL, 0),
(7, 'wc-update-db-reminder', 'update', 'en_US', 'WooCommerce database update done', 'WooCommerce database update complete. Thank you for updating to the latest version!', 'info', '{}', 'actioned', 'woocommerce-core', '2020-08-24 05:09:18', NULL, 0, 'plain', '', 0) ;

#
# End of data contents of table `wp_wc_admin_notes`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_category_lookup`
#

DROP TABLE IF EXISTS `wp_wc_category_lookup`;


#
# Table structure of table `wp_wc_category_lookup`
#

CREATE TABLE `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_category_lookup`
#
INSERT INTO `wp_wc_category_lookup` ( `category_tree_id`, `category_id`) VALUES
(15, 15) ;

#
# End of data contents of table `wp_wc_category_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_customer_lookup`
#

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;


#
# Table structure of table `wp_wc_customer_lookup`
#

CREATE TABLE `wp_wc_customer_lookup` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_customer_lookup`
#

#
# End of data contents of table `wp_wc_customer_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_download_log`
#

DROP TABLE IF EXISTS `wp_wc_download_log`;


#
# Table structure of table `wp_wc_download_log`
#

CREATE TABLE `wp_wc_download_log` (
  `download_log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_download_log`
#

#
# End of data contents of table `wp_wc_download_log`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_order_coupon_lookup`
#

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;


#
# Table structure of table `wp_wc_order_coupon_lookup`
#

CREATE TABLE `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_order_coupon_lookup`
#

#
# End of data contents of table `wp_wc_order_coupon_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_order_product_lookup`
#

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;


#
# Table structure of table `wp_wc_order_product_lookup`
#

CREATE TABLE `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `variation_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_order_product_lookup`
#

#
# End of data contents of table `wp_wc_order_product_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_order_stats`
#

DROP TABLE IF EXISTS `wp_wc_order_stats`;


#
# Table structure of table `wp_wc_order_stats`
#

CREATE TABLE `wp_wc_order_stats` (
  `order_id` bigint(20) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_order_stats`
#

#
# End of data contents of table `wp_wc_order_stats`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_order_tax_lookup`
#

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;


#
# Table structure of table `wp_wc_order_tax_lookup`
#

CREATE TABLE `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) unsigned NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_order_tax_lookup`
#

#
# End of data contents of table `wp_wc_order_tax_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_product_meta_lookup`
#

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;


#
# Table structure of table `wp_wc_product_meta_lookup`
#

CREATE TABLE `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint(20) DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_product_meta_lookup`
#
INSERT INTO `wp_wc_product_meta_lookup` ( `product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(9, 'woo-vneck-tee', 0, 0, '15.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(10, 'woo-hoodie', 0, 0, '42.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(11, 'woo-hoodie-with-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(12, 'woo-tshirt', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(13, 'woo-beanie', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(14, 'woo-belt', 0, 0, '55.0000', '55.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(15, 'woo-cap', 0, 0, '16.0000', '16.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(16, 'woo-sunglasses', 0, 0, '90.0000', '90.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(17, 'woo-hoodie-with-pocket', 0, 0, '35.0000', '35.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(18, 'woo-hoodie-with-zipper', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(19, 'woo-long-sleeve-tee', 0, 0, '25.0000', '25.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(20, 'woo-polo', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(21, 'woo-album', 1, 1, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(22, 'woo-single', 1, 1, '2.0000', '2.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(23, 'woo-vneck-tee-red', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(24, 'woo-vneck-tee-green', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(25, 'woo-vneck-tee-blue', 0, 0, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(26, 'woo-hoodie-red', 0, 0, '42.0000', '42.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(27, 'woo-hoodie-green', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(28, 'woo-hoodie-blue', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(29, 'Woo-tshirt-logo', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(30, 'Woo-beanie-logo', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(31, 'logo-collection', 0, 0, '18.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(32, 'wp-pennant', 0, 0, '11.0500', '11.0500', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(33, 'woo-hoodie-blue-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '') ;

#
# End of data contents of table `wp_wc_product_meta_lookup`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_reserved_stock`
#

DROP TABLE IF EXISTS `wp_wc_reserved_stock`;


#
# Table structure of table `wp_wc_reserved_stock`
#

CREATE TABLE `wp_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_reserved_stock`
#

#
# End of data contents of table `wp_wc_reserved_stock`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_tax_rate_classes`
#

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;


#
# Table structure of table `wp_wc_tax_rate_classes`
#

CREATE TABLE `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_tax_rate_classes`
#
INSERT INTO `wp_wc_tax_rate_classes` ( `tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate') ;

#
# End of data contents of table `wp_wc_tax_rate_classes`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_webhooks`
#

DROP TABLE IF EXISTS `wp_wc_webhooks`;


#
# Table structure of table `wp_wc_webhooks`
#

CREATE TABLE `wp_wc_webhooks` (
  `webhook_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_webhooks`
#

#
# End of data contents of table `wp_wc_webhooks`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_api_keys`
#

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;


#
# Table structure of table `wp_woocommerce_api_keys`
#

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_api_keys`
#

#
# End of data contents of table `wp_woocommerce_api_keys`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_attribute_taxonomies`
#

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;


#
# Table structure of table `wp_woocommerce_attribute_taxonomies`
#

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_attribute_taxonomies`
#
INSERT INTO `wp_woocommerce_attribute_taxonomies` ( `attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'color', 'Color', 'select', 'menu_order', 0),
(2, 'size', 'Size', 'select', 'menu_order', 0) ;

#
# End of data contents of table `wp_woocommerce_attribute_taxonomies`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_downloadable_product_permissions`
#

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;


#
# Table structure of table `wp_woocommerce_downloadable_product_permissions`
#

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_downloadable_product_permissions`
#

#
# End of data contents of table `wp_woocommerce_downloadable_product_permissions`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_log`
#

DROP TABLE IF EXISTS `wp_woocommerce_log`;


#
# Table structure of table `wp_woocommerce_log`
#

CREATE TABLE `wp_woocommerce_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_log`
#

#
# End of data contents of table `wp_woocommerce_log`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_order_itemmeta`
#

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;


#
# Table structure of table `wp_woocommerce_order_itemmeta`
#

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_order_itemmeta`
#

#
# End of data contents of table `wp_woocommerce_order_itemmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_order_items`
#

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;


#
# Table structure of table `wp_woocommerce_order_items`
#

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_order_items`
#

#
# End of data contents of table `wp_woocommerce_order_items`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_payment_tokenmeta`
#

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;


#
# Table structure of table `wp_woocommerce_payment_tokenmeta`
#

CREATE TABLE `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_payment_tokenmeta`
#

#
# End of data contents of table `wp_woocommerce_payment_tokenmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_payment_tokens`
#

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;


#
# Table structure of table `wp_woocommerce_payment_tokens`
#

CREATE TABLE `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_payment_tokens`
#

#
# End of data contents of table `wp_woocommerce_payment_tokens`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_sessions`
#

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;


#
# Table structure of table `wp_woocommerce_sessions`
#

CREATE TABLE `wp_woocommerce_sessions` (
  `session_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_sessions`
#
INSERT INTO `wp_woocommerce_sessions` ( `session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(2, '1', 'a:7:{s:4:"cart";s:6:"a:0:{}";s:11:"cart_totals";s:367:"a:15:{s:8:"subtotal";i:0;s:12:"subtotal_tax";i:0;s:14:"shipping_total";i:0;s:12:"shipping_tax";i:0;s:14:"shipping_taxes";a:0:{}s:14:"discount_total";i:0;s:12:"discount_tax";i:0;s:19:"cart_contents_total";i:0;s:17:"cart_contents_tax";i:0;s:19:"cart_contents_taxes";a:0:{}s:9:"fee_total";i:0;s:7:"fee_tax";i:0;s:9:"fee_taxes";a:0:{}s:5:"total";i:0;s:9:"total_tax";i:0;}";s:15:"applied_coupons";s:6:"a:0:{}";s:22:"coupon_discount_totals";s:6:"a:0:{}";s:26:"coupon_discount_tax_totals";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:8:"customer";s:712:"a:26:{s:2:"id";s:1:"1";s:13:"date_modified";s:0:"";s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:2:"GB";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:2:"GB";s:13:"is_vat_exempt";s:0:"";s:19:"calculated_shipping";s:0:"";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:24:"dev-email@flywheel.local";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1590557842) ;

#
# End of data contents of table `wp_woocommerce_sessions`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_shipping_zone_locations`
#

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;


#
# Table structure of table `wp_woocommerce_shipping_zone_locations`
#

CREATE TABLE `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) unsigned NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_shipping_zone_locations`
#

#
# End of data contents of table `wp_woocommerce_shipping_zone_locations`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_shipping_zone_methods`
#

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;


#
# Table structure of table `wp_woocommerce_shipping_zone_methods`
#

CREATE TABLE `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint(20) unsigned NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_shipping_zone_methods`
#

#
# End of data contents of table `wp_woocommerce_shipping_zone_methods`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_shipping_zones`
#

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;


#
# Table structure of table `wp_woocommerce_shipping_zones`
#

CREATE TABLE `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_shipping_zones`
#

#
# End of data contents of table `wp_woocommerce_shipping_zones`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_tax_rate_locations`
#

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;


#
# Table structure of table `wp_woocommerce_tax_rate_locations`
#

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint(20) unsigned NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_tax_rate_locations`
#

#
# End of data contents of table `wp_woocommerce_tax_rate_locations`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_tax_rates`
#

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;


#
# Table structure of table `wp_woocommerce_tax_rates`
#

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) unsigned NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) unsigned NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_tax_rates`
#

#
# End of data contents of table `wp_woocommerce_tax_rates`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

ALTER TABLE `wp_wc_download_log`
  ADD CONSTRAINT `fk_wp_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `wp_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
