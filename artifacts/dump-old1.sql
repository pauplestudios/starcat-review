# WordPress MySQL database migration
#
# Generated: Tuesday 31. March 2020 11:42 UTC
# Hostname: localhost
# Database: `local`
# URL: //127.0.0.1:81
# Path: C:\\Users\\admin\\Local Sites\\starcattest\\app\\public
# Tables: wp_actionscheduler_actions, wp_actionscheduler_claims, wp_actionscheduler_groups, wp_actionscheduler_logs, wp_commentmeta, wp_comments, wp_links, wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users, wp_wc_admin_note_actions, wp_wc_admin_notes, wp_wc_category_lookup, wp_wc_customer_lookup, wp_wc_download_log, wp_wc_order_coupon_lookup, wp_wc_order_product_lookup, wp_wc_order_stats, wp_wc_order_tax_lookup, wp_wc_product_meta_lookup, wp_wc_tax_rate_classes, wp_wc_webhooks, wp_woocommerce_api_keys, wp_woocommerce_attribute_taxonomies, wp_woocommerce_downloadable_product_permissions, wp_woocommerce_log, wp_woocommerce_order_itemmeta, wp_woocommerce_order_items, wp_woocommerce_payment_tokenmeta, wp_woocommerce_payment_tokens, wp_woocommerce_sessions, wp_woocommerce_shipping_zone_locations, wp_woocommerce_shipping_zone_methods, wp_woocommerce_shipping_zones, wp_woocommerce_tax_rate_locations, wp_woocommerce_tax_rates
# Table Prefix: wp_
# Post Types: revision, attachment, page, post, product, product_variation
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_actions`
#
INSERT INTO `wp_actionscheduler_actions` ( `action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(6, 'action_scheduler/migration_hook', 'complete', '2020-03-31 11:17:39', '2020-03-31 11:17:39', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1585653459;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1585653459;s:19:"scheduled_timestamp";i:1585653459;s:9:"timestamp";i:1585653459;}', 1, 1, '2020-03-31 11:17:41', '2020-03-31 11:17:41', 0, NULL),
(7, 'action_scheduler/migration_hook', 'complete', '2020-03-31 11:17:41', '2020-03-31 11:17:41', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1585653461;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1585653461;s:19:"scheduled_timestamp";i:1585653461;s:9:"timestamp";i:1585653461;}', 1, 1, '2020-03-31 11:17:46', '2020-03-31 11:17:46', 0, NULL),
(8, 'woocommerce_update_marketplace_suggestions', 'complete', '2020-03-31 11:31:22', '2020-03-31 11:31:22', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1585654282;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1585654282;s:19:"scheduled_timestamp";i:1585654282;s:9:"timestamp";i:1585654282;}', 0, 1, '2020-03-31 11:31:35', '2020-03-31 11:31:35', 0, NULL),
(9, 'action_scheduler/migration_hook', 'complete', '2020-03-31 11:34:01', '2020-03-31 11:34:01', '[]', 'O:30:"ActionScheduler_SimpleSchedule":4:{s:22:"\0*\0scheduled_timestamp";i:1585654441;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1585654441;s:19:"scheduled_timestamp";i:1585654441;s:9:"timestamp";i:1585654441;}', 1, 1, '2020-03-31 11:34:55', '2020-03-31 11:34:55', 0, NULL) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_groups`
#
INSERT INTO `wp_actionscheduler_groups` ( `group_id`, `slug`) VALUES
(1, 'action-scheduler-migration') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_logs`
#
INSERT INTO `wp_actionscheduler_logs` ( `log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 6, 'action created', '2020-03-31 11:17:39', '2020-03-31 11:17:39'),
(2, 6, 'action started via Async Request', '2020-03-31 11:17:41', '2020-03-31 11:17:41'),
(3, 6, 'action complete via Async Request', '2020-03-31 11:17:41', '2020-03-31 11:17:41'),
(4, 7, 'action created', '2020-03-31 11:17:41', '2020-03-31 11:17:41'),
(5, 7, 'action started via Async Request', '2020-03-31 11:17:46', '2020-03-31 11:17:46'),
(6, 7, 'action complete via Async Request', '2020-03-31 11:17:46', '2020-03-31 11:17:46'),
(7, 8, 'action created', '2020-03-31 11:31:22', '2020-03-31 11:31:22'),
(8, 8, 'action started via WP Cron', '2020-03-31 11:31:35', '2020-03-31 11:31:35'),
(9, 8, 'action complete via WP Cron', '2020-03-31 11:31:35', '2020-03-31 11:31:35'),
(10, 9, 'action created', '2020-03-31 11:34:01', '2020-03-31 11:34:01'),
(11, 9, 'action started via WP Cron', '2020-03-31 11:34:55', '2020-03-31 11:34:55'),
(12, 9, 'action complete via WP Cron', '2020-03-31 11:34:55', '2020-03-31 11:34:55') ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_commentmeta`
#

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
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-03-31 11:14:46', '2020-03-31 11:14:46', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1:81', 'yes'),
(2, 'home', 'http://127.0.0.1:81', 'yes'),
(3, 'blogname', 'Starcat-Test', 'yes'),
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
(29, 'rewrite_rules', 'a:154:{s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:31:"product-category/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:28:"product-tag/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"product/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"product/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:48:"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:43:"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"product/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"product/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:33:"starcat-review/starcat-review.php";i:1;s:27:"woocommerce/woocommerce.php";i:2;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentytwenty', 'yes'),
(41, 'stylesheet', 'twentytwenty', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '45805', 'yes'),
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
(81, 'uninstall_plugins', 'a:1:{s:45:"woocommerce-services/woocommerce-services.php";a:2:{i:0;s:17:"WC_Connect_Loader";i:1;s:16:"plugin_uninstall";}}', 'no'),
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
(93, 'admin_email_lifespan', '1601205284', 'yes'),
(94, 'initial_db_version', '45805', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:114:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"edit_theme_options";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(96, 'fresh_site', '1', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(103, 'cron', 'a:19:{i:1585655013;a:1:{s:26:"action_scheduler_run_queue";a:1:{s:32:"0d04ed39571b55704c122d726248bbac";a:3:{s:8:"schedule";s:12:"every_minute";s:4:"args";a:1:{i:0;s:7:"WP Cron";}s:8:"interval";i:60;}}}i:1585656888;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1585657058;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1585657059;a:1:{s:33:"wc_admin_process_orders_milestone";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1585657066;a:1:{s:29:"wc_admin_unsnooze_admin_notes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1585661667;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"a05c27d65e3068dce804d1d1ad40def4";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:54;}}}}i:1585664258;a:1:{s:24:"woocommerce_cleanup_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585675058;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1585696100;a:1:{s:27:"fs_data_sync_starcat-review";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585696488;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1585699200;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585739687;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585739703;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585739706;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585739860;a:1:{s:14:"wc_admin_daily";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585739868;a:2:{s:33:"woocommerce_cleanup_personal_data";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1585740699;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"686c8315be36c96dc00d0d7ed3656b43";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:6;}}}}i:1586949518;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:11:"fifteendays";s:4:"args";a:0:{}s:8:"interval";i:1296000;}}}s:7:"version";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'nonce_key', 's| [=n.^}(-FX * ;u4=/rdAfmB1vZ4.RsdXf$>=9,|x>c:>+%q|<PYqnu;1NSW7', 'no'),
(111, 'nonce_salt', 'D^F51hO?wb0.Y^#8J%8?q0B*14/$EJORT_- 5XT#+(^;8bT_@Ie=#oGyRxKh |Wo', 'no'),
(112, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(140, 'can_compress_scripts', '1', 'no'),
(143, 'recently_activated', 'a:2:{s:45:"woocommerce-services/woocommerce-services.php";i:1585654443;s:19:"jetpack/jetpack.php";i:1585654441;}', 'yes'),
(148, 'action_scheduler_hybrid_store_demarkation', '5', 'yes'),
(149, 'schema-ActionScheduler_StoreSchema', '3.0.1585653453', 'yes'),
(150, 'schema-ActionScheduler_LoggerSchema', '2.0.1585653453', 'yes'),
(153, 'woocommerce_store_address', '', 'yes'),
(154, 'woocommerce_store_address_2', '', 'yes'),
(155, 'woocommerce_store_city', '', 'yes'),
(156, 'woocommerce_default_country', 'GB', 'yes'),
(157, 'woocommerce_store_postcode', '', 'yes'),
(158, 'woocommerce_allowed_countries', 'all', 'yes'),
(159, 'woocommerce_all_except_countries', '', 'yes'),
(160, 'woocommerce_specific_allowed_countries', '', 'yes'),
(161, 'woocommerce_ship_to_countries', '', 'yes'),
(162, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(163, 'woocommerce_default_customer_address', 'base', 'yes'),
(164, 'woocommerce_calc_taxes', 'no', 'yes'),
(165, 'woocommerce_enable_coupons', 'yes', 'yes'),
(166, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(167, 'woocommerce_currency', 'GBP', 'yes'),
(168, 'woocommerce_currency_pos', 'left', 'yes'),
(169, 'woocommerce_price_thousand_sep', ',', 'yes'),
(170, 'woocommerce_price_decimal_sep', '.', 'yes'),
(171, 'woocommerce_price_num_decimals', '2', 'yes'),
(172, 'woocommerce_shop_page_id', '', 'yes'),
(173, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(174, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(175, 'woocommerce_placeholder_image', '5', 'yes'),
(176, 'woocommerce_weight_unit', 'kg', 'yes'),
(177, 'woocommerce_dimension_unit', 'cm', 'yes'),
(178, 'woocommerce_enable_reviews', 'yes', 'yes'),
(179, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(180, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(181, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(182, 'woocommerce_review_rating_required', 'yes', 'no'),
(183, 'woocommerce_manage_stock', 'yes', 'yes'),
(184, 'woocommerce_hold_stock_minutes', '60', 'no'),
(185, 'woocommerce_notify_low_stock', 'yes', 'no'),
(186, 'woocommerce_notify_no_stock', 'yes', 'no'),
(187, 'woocommerce_stock_email_recipient', 'dev-email@flywheel.local', 'no'),
(188, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(189, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(190, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(191, 'woocommerce_stock_format', '', 'yes'),
(192, 'woocommerce_file_download_method', 'force', 'no'),
(193, 'woocommerce_downloads_require_login', 'no', 'no'),
(194, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(195, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(196, 'woocommerce_prices_include_tax', 'no', 'yes'),
(197, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(198, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(199, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(200, 'woocommerce_tax_classes', '', 'yes'),
(201, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(202, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(203, 'woocommerce_price_display_suffix', '', 'yes'),
(204, 'woocommerce_tax_total_display', 'itemized', 'no'),
(205, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(206, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(207, 'woocommerce_ship_to_destination', 'billing', 'no'),
(208, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(209, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(210, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(211, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(212, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(213, 'woocommerce_registration_generate_username', 'yes', 'no'),
(214, 'woocommerce_registration_generate_password', 'yes', 'no'),
(215, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(216, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(217, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(218, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(219, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(220, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(221, 'woocommerce_trash_pending_orders', '', 'no'),
(222, 'woocommerce_trash_failed_orders', '', 'no'),
(223, 'woocommerce_trash_cancelled_orders', '', 'no'),
(224, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(225, 'woocommerce_email_from_name', 'Starcat-Test', 'no'),
(226, 'woocommerce_email_from_address', 'dev-email@flywheel.local', 'no'),
(227, 'woocommerce_email_header_image', '', 'no'),
(228, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(229, 'woocommerce_email_base_color', '#96588a', 'no'),
(230, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(231, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(232, 'woocommerce_email_text_color', '#3c3c3c', 'no') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(233, 'woocommerce_cart_page_id', '', 'no'),
(234, 'woocommerce_checkout_page_id', '', 'no'),
(235, 'woocommerce_myaccount_page_id', '', 'no'),
(236, 'woocommerce_terms_page_id', '', 'no'),
(237, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(238, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(239, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(240, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(241, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(242, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(243, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(244, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(245, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(246, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(247, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(248, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(249, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(250, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(251, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(252, 'woocommerce_api_enabled', 'no', 'yes'),
(253, 'woocommerce_allow_tracking', 'no', 'no'),
(254, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(255, 'woocommerce_single_image_width', '600', 'yes'),
(256, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(257, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(258, 'woocommerce_demo_store', 'no', 'no'),
(259, 'woocommerce_permalinks', 'a:5:{s:12:"product_base";s:7:"product";s:13:"category_base";s:16:"product-category";s:8:"tag_base";s:11:"product-tag";s:14:"attribute_base";s:0:"";s:22:"use_verbose_page_rules";b:0;}', 'yes'),
(260, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(261, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(264, 'default_product_cat', '15', 'yes'),
(265, 'woocommerce_admin_notices', 'a:1:{i:0;s:7:"install";}', 'yes'),
(268, 'woocommerce_version', '4.0.1', 'yes'),
(269, 'woocommerce_db_version', '4.0.1', 'yes'),
(270, 'action_scheduler_lock_async-request-runner', '1585655017', 'yes'),
(271, 'theme_mods_twentytwenty', 'a:2:{s:16:"background_color";s:3:"fff";s:18:"custom_css_post_id";i:-1;}', 'yes'),
(272, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:"database_prefix";s:32:"9nBcuz7WUHXuwVCwV0mZeSXcoLcPbWfP";}', 'yes'),
(274, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(275, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(276, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(277, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(278, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(279, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(280, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(281, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(282, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(283, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(284, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(285, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(286, 'woocommerce_onboarding_opt_in', 'yes', 'yes'),
(291, 'woocommerce_admin_version', '1.0.3', 'yes'),
(292, 'woocommerce_admin_install_timestamp', '1585653460', 'yes'),
(297, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(298, 'woocommerce_setup_ab_wc_admin_onboarding', 'b', 'yes'),
(299, 'woocommerce_admin_last_orders_milestone', '0', 'yes'),
(300, 'woocommerce_onboarding_profile', 'a:2:{s:9:"completed";b:1;s:7:"plugins";s:9:"installed";}', 'yes'),
(332, 'jetpack_activated', '1', 'yes'),
(335, 'jetpack_activation_source', 'a:2:{i:0;s:7:"unknown";i:1;N;}', 'yes'),
(337, 'jetpack_options', 'a:2:{s:7:"version";s:14:"8.3:1585654267";s:11:"old_version";s:14:"8.3:1585654267";}', 'yes'),
(342, 'wc_connect_options', 'a:1:{s:12:"tos_accepted";b:1;}', 'yes'),
(347, 'jetpack_available_modules', 'a:1:{s:3:"8.3";a:41:{s:8:"carousel";s:3:"1.5";s:13:"comment-likes";s:3:"5.1";s:8:"comments";s:3:"1.4";s:12:"contact-form";s:3:"1.3";s:9:"copy-post";s:3:"7.0";s:20:"custom-content-types";s:3:"3.1";s:10:"custom-css";s:3:"1.7";s:21:"enhanced-distribution";s:3:"1.2";s:16:"google-analytics";s:3:"4.5";s:19:"gravatar-hovercards";s:3:"1.1";s:15:"infinite-scroll";s:3:"2.0";s:8:"json-api";s:3:"1.9";s:5:"latex";s:3:"1.1";s:11:"lazy-images";s:5:"5.6.0";s:5:"likes";s:3:"2.2";s:8:"markdown";s:3:"2.8";s:9:"masterbar";s:3:"4.8";s:7:"monitor";s:3:"2.6";s:5:"notes";s:3:"1.9";s:10:"photon-cdn";s:3:"6.6";s:6:"photon";s:3:"2.0";s:13:"post-by-email";s:3:"2.0";s:7:"protect";s:3:"3.4";s:9:"publicize";s:3:"2.0";s:13:"related-posts";s:3:"2.9";s:6:"search";s:3:"5.0";s:9:"seo-tools";s:3:"4.4";s:10:"sharedaddy";s:3:"1.1";s:10:"shortcodes";s:3:"1.1";s:10:"shortlinks";s:3:"1.1";s:8:"sitemaps";s:3:"3.9";s:3:"sso";s:3:"2.6";s:5:"stats";s:3:"1.1";s:13:"subscriptions";s:3:"1.2";s:13:"tiled-gallery";s:3:"2.1";s:10:"vaultpress";s:5:"0:1.2";s:18:"verification-tools";s:3:"3.0";s:10:"videopress";s:3:"2.5";s:17:"widget-visibility";s:3:"2.4";s:7:"widgets";s:3:"1.2";s:7:"wordads";s:5:"4.5.0";}}', 'yes'),
(351, 'do_activate', '0', 'yes'),
(356, 'jetpack_log', 'a:2:{i:0;a:4:{s:4:"time";i:1585654272;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"register";}i:1;a:4:{s:4:"time";i:1585654389;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"register";}}', 'no'),
(357, 'jetpack_tos_agreed', '1', 'yes'),
(360, 'sharing-options', 'a:1:{s:6:"global";a:5:{s:12:"button_style";s:9:"icon-text";s:13:"sharing_label";s:11:"Share this:";s:10:"open_links";s:4:"same";s:4:"show";a:2:{i:0;s:4:"post";i:1;s:4:"page";}s:6:"custom";a:0:{}}}', 'yes'),
(361, 'stats_options', 'a:7:{s:9:"admin_bar";b:1;s:5:"roles";a:1:{i:0;s:13:"administrator";}s:11:"count_roles";a:0:{}s:7:"blog_id";b:0;s:12:"do_not_track";b:1;s:10:"hide_smile";b:1;s:7:"version";s:1:"9";}', 'yes'),
(363, 'woocommerce_marketplace_suggestions', 'a:2:{s:11:"suggestions";a:28:{i:0;a:4:{s:4:"slug";s:28:"product-edit-meta-tab-header";s:7:"context";s:28:"product-edit-meta-tab-header";s:5:"title";s:22:"Recommended extensions";s:13:"allow-dismiss";b:0;}i:1;a:6:{s:4:"slug";s:39:"product-edit-meta-tab-footer-browse-all";s:7:"context";s:28:"product-edit-meta-tab-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:2;a:9:{s:4:"slug";s:46:"product-edit-mailchimp-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-mailchimp";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/mailchimp-for-memberships.svg";s:5:"title";s:25:"Mailchimp for Memberships";s:4:"copy";s:79:"Completely automate your email lists by syncing membership changes to Mailchimp";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/mailchimp-woocommerce-memberships/";}i:3;a:9:{s:4:"slug";s:19:"product-edit-addons";s:7:"product";s:26:"woocommerce-product-addons";s:14:"show-if-active";a:2:{i:0;s:25:"woocommerce-subscriptions";i:1;s:20:"woocommerce-bookings";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-add-ons.svg";s:5:"title";s:15:"Product Add-Ons";s:4:"copy";s:93:"Offer add-ons like gift wrapping, special messages or other special options for your products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-add-ons/";}i:4;a:9:{s:4:"slug";s:46:"product-edit-woocommerce-subscriptions-gifting";s:7:"product";s:33:"woocommerce-subscriptions-gifting";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/gifting-for-subscriptions.svg";s:5:"title";s:25:"Gifting for Subscriptions";s:4:"copy";s:70:"Let customers buy subscriptions for others - they\'re the ultimate gift";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/woocommerce-subscriptions-gifting/";}i:5;a:9:{s:4:"slug";s:42:"product-edit-teams-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-for-teams";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:112:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/teams-for-memberships.svg";s:5:"title";s:21:"Teams for Memberships";s:4:"copy";s:123:"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/teams-woocommerce-memberships/";}i:6;a:8:{s:4:"slug";s:29:"product-edit-variation-images";s:7:"product";s:39:"woocommerce-additional-variation-images";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/additional-variation-images.svg";s:5:"title";s:27:"Additional Variation Images";s:4:"copy";s:72:"Showcase your products in the best light with a image for each variation";s:11:"button-text";s:10:"Learn More";s:3:"url";s:73:"https://woocommerce.com/products/woocommerce-additional-variation-images/";}i:7;a:9:{s:4:"slug";s:47:"product-edit-woocommerce-subscription-downloads";s:7:"product";s:34:"woocommerce-subscription-downloads";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:113:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscription-downloads.svg";s:5:"title";s:22:"Subscription Downloads";s:4:"copy";s:57:"Give customers special downloads with their subscriptions";s:11:"button-text";s:10:"Learn More";s:3:"url";s:68:"https://woocommerce.com/products/woocommerce-subscription-downloads/";}i:8;a:8:{s:4:"slug";s:31:"product-edit-min-max-quantities";s:7:"product";s:30:"woocommerce-min-max-quantities";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:109:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/min-max-quantities.svg";s:5:"title";s:18:"Min/Max Quantities";s:4:"copy";s:81:"Specify minimum and maximum allowed product quantities for orders to be completed";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/min-max-quantities/";}i:9;a:8:{s:4:"slug";s:28:"product-edit-name-your-price";s:7:"product";s:27:"woocommerce-name-your-price";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/name-your-price.svg";s:5:"title";s:15:"Name Your Price";s:4:"copy";s:70:"Let customers pay what they want - useful for donations, tips and more";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/name-your-price/";}i:10;a:8:{s:4:"slug";s:42:"product-edit-woocommerce-one-page-checkout";s:7:"product";s:29:"woocommerce-one-page-checkout";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/one-page-checkout.svg";s:5:"title";s:17:"One Page Checkout";s:4:"copy";s:92:"Don\'t make customers click around - let them choose products, checkout & pay all on one page";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/woocommerce-one-page-checkout/";}i:11;a:4:{s:4:"slug";s:19:"orders-empty-header";s:7:"context";s:24:"orders-list-empty-header";s:5:"title";s:20:"Tools for your store";s:13:"allow-dismiss";b:0;}i:12;a:6:{s:4:"slug";s:30:"orders-empty-footer-browse-all";s:7:"context";s:24:"orders-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:13;a:8:{s:4:"slug";s:19:"orders-empty-zapier";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:18:"woocommerce-zapier";s:4:"icon";s:97:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/zapier.svg";s:5:"title";s:6:"Zapier";s:4:"copy";s:88:"Save time and increase productivity by connecting your store to more than 1000+ services";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/woocommerce-zapier/";}i:14;a:8:{s:4:"slug";s:30:"orders-empty-shipment-tracking";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:29:"woocommerce-shipment-tracking";s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipment-tracking.svg";s:5:"title";s:17:"Shipment Tracking";s:4:"copy";s:86:"Let customers know when their orders will arrive by adding shipment tracking to emails";s:11:"button-text";s:10:"Learn More";s:3:"url";s:51:"https://woocommerce.com/products/shipment-tracking/";}i:15;a:8:{s:4:"slug";s:32:"orders-empty-table-rate-shipping";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:31:"woocommerce-table-rate-shipping";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/table-rate-shipping.svg";s:5:"title";s:19:"Table Rate Shipping";s:4:"copy";s:122:"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/table-rate-shipping/";}i:16;a:8:{s:4:"slug";s:40:"orders-empty-shipping-carrier-extensions";s:7:"context";s:22:"orders-list-empty-body";s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipping-carrier-extensions.svg";s:5:"title";s:27:"Shipping Carrier Extensions";s:4:"copy";s:116:"Show live rates from FedEx, UPS, USPS and more directly on your store - never under or overcharge for shipping again";s:11:"button-text";s:13:"Find Carriers";s:8:"promoted";s:26:"category-shipping-carriers";s:3:"url";s:99:"https://woocommerce.com/product-category/woocommerce-extensions/shipping-methods/shipping-carriers/";}i:17;a:8:{s:4:"slug";s:32:"orders-empty-google-product-feed";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:25:"woocommerce-product-feeds";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/google-product-feed.svg";s:5:"title";s:19:"Google Product Feed";s:4:"copy";s:76:"Increase sales by letting customers find you when they\'re shopping on Google";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/google-product-feed/";}i:18;a:8:{s:4:"slug";s:27:"orders-empty-stripe-payment";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:26:"woocommerce-gateway-stripe";s:4:"icon";s:105:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/stripe-payment.svg";s:5:"title";s:6:"Stripe";s:4:"copy";s:132:"The complete payments platform engineered for growth. Millions around the globe use Stripe to start, run and scale their businesses.";s:11:"button-text";s:10:"Learn More";s:3:"url";s:40:"https://woocommerce.com/products/stripe/";}i:19;a:4:{s:4:"slug";s:35:"products-empty-header-product-types";s:7:"context";s:26:"products-list-empty-header";s:5:"title";s:23:"Other types of products";s:13:"allow-dismiss";b:0;}i:20;a:6:{s:4:"slug";s:32:"products-empty-footer-browse-all";s:7:"context";s:26:"products-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:21;a:8:{s:4:"slug";s:30:"products-empty-product-vendors";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-vendors";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-vendors.svg";s:5:"title";s:15:"Product Vendors";s:4:"copy";s:47:"Turn your store into a multi-vendor marketplace";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-vendors/";}i:22;a:8:{s:4:"slug";s:26:"products-empty-memberships";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:23:"woocommerce-memberships";s:4:"icon";s:102:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/memberships.svg";s:5:"title";s:11:"Memberships";s:4:"copy";s:76:"Give members access to restricted content or products, for a fee or for free";s:11:"button-text";s:10:"Learn More";s:3:"url";s:57:"https://woocommerce.com/products/woocommerce-memberships/";}i:23;a:9:{s:4:"slug";s:35:"products-empty-woocommerce-deposits";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-deposits";s:14:"show-if-active";a:1:{i:0;s:20:"woocommerce-bookings";}s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/deposits.svg";s:5:"title";s:8:"Deposits";s:4:"copy";s:75:"Make it easier for customers to pay by offering a deposit or a payment plan";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-deposits/";}i:24;a:8:{s:4:"slug";s:40:"products-empty-woocommerce-subscriptions";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:25:"woocommerce-subscriptions";s:4:"icon";s:104:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscriptions.svg";s:5:"title";s:13:"Subscriptions";s:4:"copy";s:97:"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis";s:11:"button-text";s:10:"Learn More";s:3:"url";s:59:"https://woocommerce.com/products/woocommerce-subscriptions/";}i:25;a:8:{s:4:"slug";s:35:"products-empty-woocommerce-bookings";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-bookings";s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/bookings.svg";s:5:"title";s:8:"Bookings";s:4:"copy";s:99:"Allow customers to book appointments, make reservations or rent equipment without leaving your site";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-bookings/";}i:26;a:8:{s:4:"slug";s:30:"products-empty-product-bundles";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-bundles";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-bundles.svg";s:5:"title";s:15:"Product Bundles";s:4:"copy";s:49:"Offer customizable bundles and assembled products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-bundles/";}i:27;a:8:{s:4:"slug";s:29:"products-empty-stripe-payment";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:26:"woocommerce-gateway-stripe";s:4:"icon";s:105:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/stripe-payment.svg";s:5:"title";s:6:"Stripe";s:4:"copy";s:132:"The complete payments platform engineered for growth. Millions around the globe use Stripe to start, run and scale their businesses.";s:11:"button-text";s:10:"Learn More";s:3:"url";s:40:"https://woocommerce.com/products/stripe/";}}s:7:"updated";i:1585654295;}', 'no'),
(371, 'product_cat_children', 'a:1:{i:16;a:3:{i:0;i:17;i:1;i:18;i:2;i:19;}}', 'yes'),
(379, 'pa_size_children', 'a:0:{}', 'yes'),
(393, 'woocommerce_setup_jetpack_opted_in', '1', 'yes'),
(402, 'woocommerce_task_list_welcome_modal_dismissed', '1', 'yes'),
(432, 'action_scheduler_migration_status', 'complete', 'yes'),
(434, 'fs_active_plugins', 'O:8:"stdClass":3:{s:7:"plugins";a:1:{s:36:"starcat-review/includes/lib/freemius";O:8:"stdClass":4:{s:7:"version";s:5:"2.3.0";s:4:"type";s:6:"plugin";s:9:"timestamp";i:1585654505;s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";}}s:7:"abspath";s:50:"C:\\Users\\admin\\Local Sites\\starcattest\\app\\public/";s:6:"newest";O:8:"stdClass":5:{s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";s:8:"sdk_path";s:36:"starcat-review/includes/lib/freemius";s:7:"version";s:5:"2.3.0";s:13:"in_activation";b:0;s:9:"timestamp";i:1585654505;}}', 'yes'),
(435, 'fs_debug_mode', '', 'yes'),
(436, 'fs_accounts', 'a:14:{s:21:"id_slug_type_path_map";a:1:{i:3980;a:3:{s:4:"slug";s:14:"starcat-review";s:4:"type";s:6:"plugin";s:4:"path";s:33:"starcat-review/starcat-review.php";}}s:11:"plugin_data";a:1:{s:14:"starcat-review";a:20:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:33:"starcat-review/starcat-review.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1585654505;s:16:"sdk_last_version";N;s:11:"sdk_version";s:5:"2.3.0";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:3:"0.4";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:17:"starcattest.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1585654505;s:7:"version";s:3:"0.4";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:1;s:14:"has_trial_plan";b:1;s:22:"install_sync_timestamp";i:1585654546;s:19:"keepalive_timestamp";i:1585654546;s:20:"activation_timestamp";i:1585654542;s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:3:"0.4";s:7:"blog_id";i:0;s:11:"sdk_version";s:5:"2.3.0";s:9:"timestamp";i:1585654550;s:2:"on";b:1;}}}s:13:"file_slug_map";a:1:{s:33:"starcat-review/starcat-review.php";s:14:"starcat-review";}s:7:"plugins";a:1:{s:14:"starcat-review";O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";N;s:5:"title";s:14:"Starcat Review";s:4:"slug";s:14:"starcat-review";s:12:"premium_slug";s:22:"starcat-review-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:33:"starcat-review/starcat-review.php";s:7:"version";s:3:"0.4";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:3:"Pro";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_ad2b6650d9ef2e5df3c203ea9046f";s:10:"secret_key";s:32:"sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;";s:2:"id";s:4:"3980";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:9:"unique_id";s:32:"75c8e786ef7e249d27db1aca38bbd9b9";s:5:"plans";a:1:{s:14:"starcat-review";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:0:"";s:17:"is_block_features";s:0:"";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"NjQwNg==";s:7:"updated";s:28:"MjAyMC0wMS0xNCAxMTo1NTozMQ==";s:7:"created";s:28:"MjAxOS0wNi0xOSAwNToxNTowMA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:8:"YmFzaWM=";s:5:"title";s:8:"QmFzaWM=";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:0:"";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";s:4:"Nw==";s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:8:"ODIyMA==";s:7:"updated";s:28:"MjAyMC0wMi0wNiAwNDo0MzoxMw==";s:7:"created";s:28:"MjAxOS0xMi0wMiAwNjo0NDo0NA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:14:"active_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1585654546;s:3:"md5";s:32:"a7056c51973b349f679790c768287a32";s:7:"plugins";a:2:{s:33:"starcat-review/starcat-review.php";a:5:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:3:"0.4";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}s:27:"woocommerce/woocommerce.php";a:5:{s:4:"slug";s:11:"woocommerce";s:7:"version";s:5:"4.0.1";s:5:"title";s:11:"WooCommerce";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:11:"all_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1585654546;s:3:"md5";s:32:"aa5132a6ae9faf27df55c65d86acc741";s:7:"plugins";a:4:{s:19:"jetpack/jetpack.php";a:5:{s:4:"slug";s:7:"jetpack";s:7:"version";s:3:"8.3";s:5:"title";s:24:"Jetpack by WordPress.com";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:33:"starcat-review/starcat-review.php";a:5:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:3:"0.4";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:27:"woocommerce/woocommerce.php";a:5:{s:4:"slug";s:11:"woocommerce";s:7:"version";s:5:"4.0.1";s:5:"title";s:11:"WooCommerce";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:45:"woocommerce-services/woocommerce-services.php";a:5:{s:4:"slug";s:20:"woocommerce-services";s:7:"version";s:6:"1.22.5";s:5:"title";s:20:"WooCommerce Services";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}}}s:10:"all_themes";O:8:"stdClass":3:{s:9:"timestamp";i:1585654546;s:3:"md5";s:32:"c40c8a62a526767cc26d623008f95acc";s:6:"themes";a:4:{s:14:"twentynineteen";a:5:{s:4:"slug";s:14:"twentynineteen";s:7:"version";s:3:"1.4";s:5:"title";s:15:"Twenty Nineteen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:15:"twentyseventeen";a:5:{s:4:"slug";s:15:"twentyseventeen";s:7:"version";s:3:"2.2";s:5:"title";s:16:"Twenty Seventeen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:13:"twentysixteen";a:5:{s:4:"slug";s:13:"twentysixteen";s:7:"version";s:3:"2.0";s:5:"title";s:14:"Twenty Sixteen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:12:"twentytwenty";a:5:{s:4:"slug";s:12:"twentytwenty";s:7:"version";s:3:"1.1";s:5:"title";s:13:"Twenty Twenty";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:5:"sites";a:1:{s:14:"starcat-review";O:7:"FS_Site":26:{s:7:"site_id";s:8:"18716063";s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:5:"title";s:12:"Starcat-Test";s:3:"url";s:19:"http://127.0.0.1:81";s:7:"version";s:3:"0.4";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"5.3.2";s:11:"sdk_version";s:5:"2.3.0";s:28:"programming_language_version";s:5:"7.3.5";s:7:"plan_id";s:4:"8220";s:10:"license_id";s:6:"316410";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_1db3ae57cca84125a24e871e46428";s:10:"secret_key";s:32:"sk_t6=j76wg!.4A_aT@)SipKAgZ2zAJo";s:2:"id";s:7:"4242715";s:7:"updated";s:19:"2020-03-31 11:35:43";s:7:"created";s:19:"2020-03-31 11:35:43";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:5:"users";a:1:{i:1418060;O:7:"FS_User":14:{s:5:"email";s:21:"stephenr816@gmail.com";s:5:"first";s:7:"Stephen";s:4:"last";s:3:"Raj";s:11:"is_verified";b:1;s:7:"is_beta";N;s:11:"customer_id";N;s:5:"gross";i:0;s:10:"public_key";s:32:"pk_944d72a673940e247123aaf7567d5";s:10:"secret_key";s:32:"sk_uWVdgd3U28%?F+}pYZR!DA#(?AliH";s:2:"id";s:7:"1418060";s:7:"updated";s:19:"2020-03-28 11:36:38";s:7:"created";s:19:"2018-09-05 04:22:17";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:23:"user_id_license_ids_map";a:1:{i:3980;a:1:{i:1418060;a:2:{i:0;i:316410;i:1;i:282961;}}}s:12:"all_licenses";a:1:{i:3980;a:2:{i:0;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"7999";s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-03-25 07:28:28";s:10:"secret_key";s:32:"sk_&WK(MOaXPPB}mTu2v}~jo&@8R0[)d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"316410";s:7:"updated";s:19:"2020-03-31 11:35:43";s:7:"created";s:19:"2020-03-25 07:28:28";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"7997";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2020-01-17 09:42:45";s:10:"secret_key";s:32:"sk_nac^n:7*[b*XZf&B}~hC*~.Z1V15j";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:1;s:2:"id";s:6:"282961";s:7:"updated";s:19:"2020-01-17 10:42:45";s:7:"created";s:19:"2020-01-17 09:03:35";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"updates";a:1:{i:3980;N;}}', 'yes'),
(437, 'fs_api_cache', 'a:6:{s:26:"get:/v1/users/1418060.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":16:{s:15:"default_card_id";s:5:"53964";s:5:"gross";i:0;s:6:"source";i:0;s:13:"last_login_at";s:19:"2020-03-28 11:36:38";s:5:"email";s:21:"stephenr816@gmail.com";s:5:"first";s:7:"Stephen";s:4:"last";s:3:"Raj";s:7:"picture";N;s:2:"ip";s:12:"192.168.95.1";s:11:"is_verified";b:1;s:10:"secret_key";s:32:"sk_uWVdgd3U28%?F+}pYZR!DA#(?AliH";s:10:"public_key";s:32:"pk_944d72a673940e247123aaf7567d5";s:2:"id";s:7:"1418060";s:7:"created";s:19:"2018-09-05 04:22:17";s:7:"updated";s:19:"2020-03-28 11:36:38";s:11:"customer_id";N;}s:7:"created";i:1585654542;s:9:"timestamp";i:1585740942;}s:29:"get:/v1/installs/4242715.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":31:{s:7:"site_id";s:8:"18716063";s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:3:"url";s:19:"http://127.0.0.1:81";s:5:"title";s:12:"Starcat-Test";s:7:"version";s:3:"0.4";s:7:"plan_id";s:4:"8220";s:10:"license_id";s:6:"316410";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:15:"subscription_id";N;s:5:"gross";i:0;s:12:"country_code";s:2:"in";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"5.3.2";s:11:"sdk_version";s:5:"2.3.0";s:28:"programming_language_version";s:5:"7.3.5";s:9:"is_active";b:1;s:15:"is_disconnected";b:0;s:10:"is_premium";b:1;s:14:"is_uninstalled";b:0;s:9:"is_locked";b:0;s:6:"source";i:0;s:8:"upgraded";N;s:12:"last_seen_at";s:19:"2020-03-31 11:35:45";s:10:"secret_key";s:32:"sk_t6=j76wg!.4A_aT@)SipKAgZ2zAJo";s:10:"public_key";s:32:"pk_1db3ae57cca84125a24e871e46428";s:2:"id";s:7:"4242715";s:7:"created";s:19:"2020-03-31 11:35:43";s:7:"updated";s:19:"2020-03-31 11:35:43";}s:7:"created";i:1585654542;s:9:"timestamp";i:1585740942;}s:63:"get:/v1/users/1418060/plugins/3980/plans.json?show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:5:"plans";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:0;s:17:"is_block_features";b:0;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:2:"id";s:4:"6406";s:7:"updated";s:19:"2020-01-14 11:55:31";s:7:"created";s:19:"2019-06-19 05:15:00";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:5:"basic";s:5:"title";s:5:"Basic";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";i:7;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:0;s:2:"id";s:4:"8220";s:7:"updated";s:19:"2020-02-06 04:43:13";s:7:"created";s:19:"2019-12-02 06:44:44";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1585654542;s:9:"timestamp";i:1585740942;}s:65:"get:/v1/users/1418060/plugins/3980/licenses.json?is_enriched=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:2:{i:0;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"7999";s:5:"quota";i:50;s:9:"activated";i:0;s:15:"activated_local";i:3;s:10:"expiration";s:19:"2021-03-25 07:28:28";s:10:"secret_key";s:32:"sk_&WK(MOaXPPB}mTu2v}~jo&@8R0[)d";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"is_cancelled";b:0;s:2:"id";s:6:"316410";s:7:"updated";s:19:"2020-03-31 11:35:43";s:7:"created";s:19:"2020-03-25 07:28:28";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1418060";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"7997";s:5:"quota";i:1;s:9:"activated";i:0;s:15:"activated_local";i:1;s:10:"expiration";s:19:"2020-01-17 09:42:45";s:10:"secret_key";s:32:"sk_nac^n:7*[b*XZf&B}~hC*~.Z1V15j";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:1;s:2:"id";s:6:"282961";s:7:"updated";s:19:"2020-01-17 10:42:45";s:7:"created";s:19:"2020-01-17 09:03:35";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1585654542;s:9:"timestamp";i:1585740942;}s:59:"get:/v1/installs/4242715/licenses/316410/subscriptions.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:13:"subscriptions";a:0:{}}s:7:"created";i:1585654542;s:9:"timestamp";i:1585740942;}s:96:"get:/v1/installs/4242715/updates/latest.json?is_premium=true&type=all&newer_than=0.4&readme=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":3:{s:4:"path";s:41:":/installs/install_id/updates/latest.json";s:5:"error";O:8:"stdClass":5:{s:4:"type";s:0:"";s:7:"message";s:53:"Plugin was not yet deployed or still pending release.";s:4:"code";s:19:"plugin_not_deployed";s:4:"http";i:404;s:9:"timestamp";s:31:"Tue, 31 Mar 2020 11:36:45 +0000";}s:7:"request";O:8:"stdClass":6:{s:10:"is_premium";s:4:"true";s:4:"type";s:3:"all";s:10:"newer_than";s:3:"0.4";s:6:"readme";s:4:"true";s:11:"sdk_version";s:5:"2.3.0";s:10:"install_id";s:7:"4242715";}}s:7:"created";i:1585654604;s:9:"timestamp";i:1585656404;}}', 'yes'),
(438, 'fs_gdpr', 'a:1:{s:2:"u1";a:2:{s:8:"required";b:0;s:18:"show_opt_in_notice";b:0;}}', 'yes'),
(441, 'scr_options', 'a:29:{s:24:"review_enable_post-types";s:4:"post";s:20:"enable-author-review";b:1;s:16:"enable-pros-cons";b:1;s:16:"stats-subheading";s:0:"";s:16:"stat-singularity";s:6:"single";s:12:"global_stats";a:1:{i:0;a:1:{s:9:"stat_name";s:7:"Feature";}}s:10:"stats-type";s:4:"star";s:17:"stats-source-type";s:4:"icon";s:23:"stats-show-rating-label";b:1;s:11:"stats-icons";s:4:"star";s:17:"stats-icons-color";s:7:"#e7711b";s:23:"stats-icons-label-color";s:7:"#0274be";s:12:"stats-images";s:0:"";s:17:"stats-stars-limit";i:5;s:11:"stats-steps";s:4:"half";s:13:"stats-animate";b:0;s:22:"stats-no-rated-message";s:17:"Not Rated Yet !!!";s:17:"ur_who_can_review";s:0:"";s:18:"ur_show_list_title";b:1;s:13:"ur_list_title";s:12:"User Reviews";s:16:"ur_enable_voting";b:1;s:18:"ur_show_form_title";b:1;s:13:"ur_form_title";s:14:"Leave a Review";s:13:"ur_show_title";b:1;s:13:"ur_show_stats";b:1;s:19:"ur_show_description";b:1;s:15:"ur_show_captcha";b:0;s:18:"recaptcha_site_key";s:0:"";s:20:"recaptcha_secret_key";s:0:"";}', 'yes'),
(442, 'slug_upgrades', 'a:1:{s:3:"0.2";b:1;}', 'yes'),
(443, 'SCR_VERSION', '0.4', 'yes'),
(456, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1585654974;}', 'no') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_wp_attached_file', 'woocommerce-placeholder.png'),
(4, 5, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:1200;s:4:"file";s:27:"woocommerce-placeholder.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:35:"woocommerce-placeholder-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:37:"woocommerce-placeholder-1024x1024.png";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:35:"woocommerce-placeholder-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:35:"woocommerce-placeholder-768x768.png";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(5, 6, '_wp_attached_file', '2020/03/sample_products.csv'),
(6, 6, '_wp_attachment_context', 'import'),
(7, 7, '_sku', 'woo-vneck-tee'),
(8, 7, 'total_sales', '0'),
(9, 7, '_tax_status', 'taxable'),
(10, 7, '_tax_class', ''),
(11, 7, '_manage_stock', 'no'),
(12, 7, '_backorders', 'no'),
(13, 7, '_sold_individually', 'no'),
(14, 7, '_virtual', 'no'),
(15, 7, '_downloadable', 'no'),
(16, 7, '_download_limit', '0'),
(17, 7, '_download_expiry', '0'),
(18, 7, '_stock', NULL),
(19, 7, '_stock_status', 'instock'),
(20, 7, '_wc_average_rating', '0'),
(21, 7, '_wc_review_count', '0'),
(22, 7, '_product_version', '4.0.1'),
(24, 8, '_sku', 'woo-hoodie'),
(25, 8, 'total_sales', '0'),
(26, 8, '_tax_status', 'taxable'),
(27, 8, '_tax_class', ''),
(28, 8, '_manage_stock', 'no'),
(29, 8, '_backorders', 'no'),
(30, 8, '_sold_individually', 'no'),
(31, 8, '_virtual', 'no'),
(32, 8, '_downloadable', 'no'),
(33, 8, '_download_limit', '0'),
(34, 8, '_download_expiry', '0'),
(35, 8, '_stock', NULL),
(36, 8, '_stock_status', 'instock'),
(37, 8, '_wc_average_rating', '0'),
(38, 8, '_wc_review_count', '0'),
(39, 8, '_product_version', '4.0.1'),
(41, 9, '_sku', 'woo-hoodie-with-logo'),
(42, 9, 'total_sales', '0'),
(43, 9, '_tax_status', 'taxable'),
(44, 9, '_tax_class', ''),
(45, 9, '_manage_stock', 'no'),
(46, 9, '_backorders', 'no'),
(47, 9, '_sold_individually', 'no'),
(48, 9, '_virtual', 'no'),
(49, 9, '_downloadable', 'no'),
(50, 9, '_download_limit', '0'),
(51, 9, '_download_expiry', '0'),
(52, 9, '_stock', NULL),
(53, 9, '_stock_status', 'instock'),
(54, 9, '_wc_average_rating', '0'),
(55, 9, '_wc_review_count', '0'),
(56, 9, '_product_version', '4.0.1'),
(58, 10, '_sku', 'woo-tshirt'),
(59, 10, 'total_sales', '0'),
(60, 10, '_tax_status', 'taxable'),
(61, 10, '_tax_class', ''),
(62, 10, '_manage_stock', 'no'),
(63, 10, '_backorders', 'no'),
(64, 10, '_sold_individually', 'no'),
(65, 10, '_virtual', 'no'),
(66, 10, '_downloadable', 'no'),
(67, 10, '_download_limit', '0'),
(68, 10, '_download_expiry', '0'),
(69, 10, '_stock', NULL),
(70, 10, '_stock_status', 'instock'),
(71, 10, '_wc_average_rating', '0'),
(72, 10, '_wc_review_count', '0'),
(73, 10, '_product_version', '4.0.1'),
(75, 11, '_sku', 'woo-beanie'),
(76, 11, 'total_sales', '0'),
(77, 11, '_tax_status', 'taxable'),
(78, 11, '_tax_class', ''),
(79, 11, '_manage_stock', 'no'),
(80, 11, '_backorders', 'no'),
(81, 11, '_sold_individually', 'no'),
(82, 11, '_virtual', 'no'),
(83, 11, '_downloadable', 'no'),
(84, 11, '_download_limit', '0'),
(85, 11, '_download_expiry', '0'),
(86, 11, '_stock', NULL),
(87, 11, '_stock_status', 'instock'),
(88, 11, '_wc_average_rating', '0'),
(89, 11, '_wc_review_count', '0'),
(90, 11, '_product_version', '4.0.1'),
(92, 12, '_sku', 'woo-belt'),
(93, 12, 'total_sales', '0'),
(94, 12, '_tax_status', 'taxable'),
(95, 12, '_tax_class', ''),
(96, 12, '_manage_stock', 'no'),
(97, 12, '_backorders', 'no'),
(98, 12, '_sold_individually', 'no'),
(99, 12, '_virtual', 'no'),
(100, 12, '_downloadable', 'no'),
(101, 12, '_download_limit', '0'),
(102, 12, '_download_expiry', '0'),
(103, 12, '_stock', NULL),
(104, 12, '_stock_status', 'instock'),
(105, 12, '_wc_average_rating', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(106, 12, '_wc_review_count', '0'),
(107, 12, '_product_version', '4.0.1'),
(109, 13, '_sku', 'woo-cap'),
(110, 13, 'total_sales', '0'),
(111, 13, '_tax_status', 'taxable'),
(112, 13, '_tax_class', ''),
(113, 13, '_manage_stock', 'no'),
(114, 13, '_backorders', 'no'),
(115, 13, '_sold_individually', 'no'),
(116, 13, '_virtual', 'no'),
(117, 13, '_downloadable', 'no'),
(118, 13, '_download_limit', '0'),
(119, 13, '_download_expiry', '0'),
(120, 13, '_stock', NULL),
(121, 13, '_stock_status', 'instock'),
(122, 13, '_wc_average_rating', '0'),
(123, 13, '_wc_review_count', '0'),
(124, 13, '_product_version', '4.0.1'),
(126, 14, '_sku', 'woo-sunglasses'),
(127, 14, 'total_sales', '0'),
(128, 14, '_tax_status', 'taxable'),
(129, 14, '_tax_class', ''),
(130, 14, '_manage_stock', 'no'),
(131, 14, '_backorders', 'no'),
(132, 14, '_sold_individually', 'no'),
(133, 14, '_virtual', 'no'),
(134, 14, '_downloadable', 'no'),
(135, 14, '_download_limit', '0'),
(136, 14, '_download_expiry', '0'),
(137, 14, '_stock', NULL),
(138, 14, '_stock_status', 'instock'),
(139, 14, '_wc_average_rating', '0'),
(140, 14, '_wc_review_count', '0'),
(141, 14, '_product_version', '4.0.1'),
(143, 15, '_sku', 'woo-hoodie-with-pocket'),
(144, 15, 'total_sales', '0'),
(145, 15, '_tax_status', 'taxable'),
(146, 15, '_tax_class', ''),
(147, 15, '_manage_stock', 'no'),
(148, 15, '_backorders', 'no'),
(149, 15, '_sold_individually', 'no'),
(150, 15, '_virtual', 'no'),
(151, 15, '_downloadable', 'no'),
(152, 15, '_download_limit', '0'),
(153, 15, '_download_expiry', '0'),
(154, 15, '_stock', NULL),
(155, 15, '_stock_status', 'instock'),
(156, 15, '_wc_average_rating', '0'),
(157, 15, '_wc_review_count', '0'),
(158, 15, '_product_version', '4.0.1'),
(160, 16, '_sku', 'woo-hoodie-with-zipper'),
(161, 16, 'total_sales', '0'),
(162, 16, '_tax_status', 'taxable'),
(163, 16, '_tax_class', ''),
(164, 16, '_manage_stock', 'no'),
(165, 16, '_backorders', 'no'),
(166, 16, '_sold_individually', 'no'),
(167, 16, '_virtual', 'no'),
(168, 16, '_downloadable', 'no'),
(169, 16, '_download_limit', '0'),
(170, 16, '_download_expiry', '0'),
(171, 16, '_stock', NULL),
(172, 16, '_stock_status', 'instock'),
(173, 16, '_wc_average_rating', '0'),
(174, 16, '_wc_review_count', '0'),
(175, 16, '_product_version', '4.0.1'),
(177, 17, '_sku', 'woo-long-sleeve-tee'),
(178, 17, 'total_sales', '0'),
(179, 17, '_tax_status', 'taxable'),
(180, 17, '_tax_class', ''),
(181, 17, '_manage_stock', 'no'),
(182, 17, '_backorders', 'no'),
(183, 17, '_sold_individually', 'no'),
(184, 17, '_virtual', 'no'),
(185, 17, '_downloadable', 'no'),
(186, 17, '_download_limit', '0'),
(187, 17, '_download_expiry', '0'),
(188, 17, '_stock', NULL),
(189, 17, '_stock_status', 'instock'),
(190, 17, '_wc_average_rating', '0'),
(191, 17, '_wc_review_count', '0'),
(192, 17, '_product_version', '4.0.1'),
(194, 18, '_sku', 'woo-polo'),
(195, 18, 'total_sales', '0'),
(196, 18, '_tax_status', 'taxable'),
(197, 18, '_tax_class', ''),
(198, 18, '_manage_stock', 'no'),
(199, 18, '_backorders', 'no'),
(200, 18, '_sold_individually', 'no'),
(201, 18, '_virtual', 'no'),
(202, 18, '_downloadable', 'no'),
(203, 18, '_download_limit', '0'),
(204, 18, '_download_expiry', '0'),
(205, 18, '_stock', NULL),
(206, 18, '_stock_status', 'instock'),
(207, 18, '_wc_average_rating', '0'),
(208, 18, '_wc_review_count', '0'),
(209, 18, '_product_version', '4.0.1'),
(211, 19, '_sku', 'woo-album'),
(212, 19, 'total_sales', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(213, 19, '_tax_status', 'taxable'),
(214, 19, '_tax_class', ''),
(215, 19, '_manage_stock', 'no'),
(216, 19, '_backorders', 'no'),
(217, 19, '_sold_individually', 'no'),
(218, 19, '_virtual', 'yes'),
(219, 19, '_downloadable', 'yes'),
(220, 19, '_download_limit', '1'),
(221, 19, '_download_expiry', '1'),
(222, 19, '_stock', NULL),
(223, 19, '_stock_status', 'instock'),
(224, 19, '_wc_average_rating', '0'),
(225, 19, '_wc_review_count', '0'),
(226, 19, '_product_version', '4.0.1'),
(228, 20, '_sku', 'woo-single'),
(229, 20, 'total_sales', '0'),
(230, 20, '_tax_status', 'taxable'),
(231, 20, '_tax_class', ''),
(232, 20, '_manage_stock', 'no'),
(233, 20, '_backorders', 'no'),
(234, 20, '_sold_individually', 'no'),
(235, 20, '_virtual', 'yes'),
(236, 20, '_downloadable', 'yes'),
(237, 20, '_download_limit', '1'),
(238, 20, '_download_expiry', '1'),
(239, 20, '_stock', NULL),
(240, 20, '_stock_status', 'instock'),
(241, 20, '_wc_average_rating', '0'),
(242, 20, '_wc_review_count', '0'),
(243, 20, '_product_version', '4.0.1'),
(245, 21, '_sku', 'woo-vneck-tee-red'),
(246, 21, 'total_sales', '0'),
(247, 21, '_tax_status', 'taxable'),
(248, 21, '_tax_class', ''),
(249, 21, '_manage_stock', 'no'),
(250, 21, '_backorders', 'no'),
(251, 21, '_sold_individually', 'no'),
(252, 21, '_virtual', 'no'),
(253, 21, '_downloadable', 'no'),
(254, 21, '_download_limit', '0'),
(255, 21, '_download_expiry', '0'),
(256, 21, '_stock', NULL),
(257, 21, '_stock_status', 'instock'),
(258, 21, '_wc_average_rating', '0'),
(259, 21, '_wc_review_count', '0'),
(260, 21, '_product_version', '4.0.1'),
(262, 22, '_sku', 'woo-vneck-tee-green'),
(263, 22, 'total_sales', '0'),
(264, 22, '_tax_status', 'taxable'),
(265, 22, '_tax_class', ''),
(266, 22, '_manage_stock', 'no'),
(267, 22, '_backorders', 'no'),
(268, 22, '_sold_individually', 'no'),
(269, 22, '_virtual', 'no'),
(270, 22, '_downloadable', 'no'),
(271, 22, '_download_limit', '0'),
(272, 22, '_download_expiry', '0'),
(273, 22, '_stock', NULL),
(274, 22, '_stock_status', 'instock'),
(275, 22, '_wc_average_rating', '0'),
(276, 22, '_wc_review_count', '0'),
(277, 22, '_product_version', '4.0.1'),
(279, 23, '_sku', 'woo-vneck-tee-blue'),
(280, 23, 'total_sales', '0'),
(281, 23, '_tax_status', 'taxable'),
(282, 23, '_tax_class', ''),
(283, 23, '_manage_stock', 'no'),
(284, 23, '_backorders', 'no'),
(285, 23, '_sold_individually', 'no'),
(286, 23, '_virtual', 'no'),
(287, 23, '_downloadable', 'no'),
(288, 23, '_download_limit', '0'),
(289, 23, '_download_expiry', '0'),
(290, 23, '_stock', NULL),
(291, 23, '_stock_status', 'instock'),
(292, 23, '_wc_average_rating', '0'),
(293, 23, '_wc_review_count', '0'),
(294, 23, '_product_version', '4.0.1'),
(296, 24, '_sku', 'woo-hoodie-red'),
(297, 24, 'total_sales', '0'),
(298, 24, '_tax_status', 'taxable'),
(299, 24, '_tax_class', ''),
(300, 24, '_manage_stock', 'no'),
(301, 24, '_backorders', 'no'),
(302, 24, '_sold_individually', 'no'),
(303, 24, '_virtual', 'no'),
(304, 24, '_downloadable', 'no'),
(305, 24, '_download_limit', '0'),
(306, 24, '_download_expiry', '0'),
(307, 24, '_stock', NULL),
(308, 24, '_stock_status', 'instock'),
(309, 24, '_wc_average_rating', '0'),
(310, 24, '_wc_review_count', '0'),
(311, 24, '_product_version', '4.0.1'),
(313, 25, '_sku', 'woo-hoodie-green'),
(314, 25, 'total_sales', '0'),
(315, 25, '_tax_status', 'taxable'),
(316, 25, '_tax_class', ''),
(317, 25, '_manage_stock', 'no'),
(318, 25, '_backorders', 'no') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(319, 25, '_sold_individually', 'no'),
(320, 25, '_virtual', 'no'),
(321, 25, '_downloadable', 'no'),
(322, 25, '_download_limit', '0'),
(323, 25, '_download_expiry', '0'),
(324, 25, '_stock', NULL),
(325, 25, '_stock_status', 'instock'),
(326, 25, '_wc_average_rating', '0'),
(327, 25, '_wc_review_count', '0'),
(328, 25, '_product_version', '4.0.1'),
(330, 26, '_sku', 'woo-hoodie-blue'),
(331, 26, 'total_sales', '0'),
(332, 26, '_tax_status', 'taxable'),
(333, 26, '_tax_class', ''),
(334, 26, '_manage_stock', 'no'),
(335, 26, '_backorders', 'no'),
(336, 26, '_sold_individually', 'no'),
(337, 26, '_virtual', 'no'),
(338, 26, '_downloadable', 'no'),
(339, 26, '_download_limit', '0'),
(340, 26, '_download_expiry', '0'),
(341, 26, '_stock', NULL),
(342, 26, '_stock_status', 'instock'),
(343, 26, '_wc_average_rating', '0'),
(344, 26, '_wc_review_count', '0'),
(345, 26, '_product_version', '4.0.1'),
(347, 27, '_sku', 'Woo-tshirt-logo'),
(348, 27, 'total_sales', '0'),
(349, 27, '_tax_status', 'taxable'),
(350, 27, '_tax_class', ''),
(351, 27, '_manage_stock', 'no'),
(352, 27, '_backorders', 'no'),
(353, 27, '_sold_individually', 'no'),
(354, 27, '_virtual', 'no'),
(355, 27, '_downloadable', 'no'),
(356, 27, '_download_limit', '0'),
(357, 27, '_download_expiry', '0'),
(358, 27, '_stock', NULL),
(359, 27, '_stock_status', 'instock'),
(360, 27, '_wc_average_rating', '0'),
(361, 27, '_wc_review_count', '0'),
(362, 27, '_product_version', '4.0.1'),
(364, 28, '_sku', 'Woo-beanie-logo'),
(365, 28, 'total_sales', '0'),
(366, 28, '_tax_status', 'taxable'),
(367, 28, '_tax_class', ''),
(368, 28, '_manage_stock', 'no'),
(369, 28, '_backorders', 'no'),
(370, 28, '_sold_individually', 'no'),
(371, 28, '_virtual', 'no'),
(372, 28, '_downloadable', 'no'),
(373, 28, '_download_limit', '0'),
(374, 28, '_download_expiry', '0'),
(375, 28, '_stock', NULL),
(376, 28, '_stock_status', 'instock'),
(377, 28, '_wc_average_rating', '0'),
(378, 28, '_wc_review_count', '0'),
(379, 28, '_product_version', '4.0.1'),
(381, 29, '_sku', 'logo-collection'),
(382, 29, 'total_sales', '0'),
(383, 29, '_tax_status', 'taxable'),
(384, 29, '_tax_class', ''),
(385, 29, '_manage_stock', 'no'),
(386, 29, '_backorders', 'no'),
(387, 29, '_sold_individually', 'no'),
(388, 29, '_virtual', 'no'),
(389, 29, '_downloadable', 'no'),
(390, 29, '_download_limit', '0'),
(391, 29, '_download_expiry', '0'),
(392, 29, '_stock', NULL),
(393, 29, '_stock_status', 'instock'),
(394, 29, '_wc_average_rating', '0'),
(395, 29, '_wc_review_count', '0'),
(396, 29, '_product_version', '4.0.1'),
(398, 30, '_sku', 'wp-pennant'),
(399, 30, 'total_sales', '0'),
(400, 30, '_tax_status', 'taxable'),
(401, 30, '_tax_class', ''),
(402, 30, '_manage_stock', 'no'),
(403, 30, '_backorders', 'no'),
(404, 30, '_sold_individually', 'no'),
(405, 30, '_virtual', 'no'),
(406, 30, '_downloadable', 'no'),
(407, 30, '_download_limit', '0'),
(408, 30, '_download_expiry', '0'),
(409, 30, '_stock', NULL),
(410, 30, '_stock_status', 'instock'),
(411, 30, '_wc_average_rating', '0'),
(412, 30, '_wc_review_count', '0'),
(413, 30, '_product_version', '4.0.1'),
(415, 31, '_sku', 'woo-hoodie-blue-logo'),
(416, 31, 'total_sales', '0'),
(417, 31, '_tax_status', 'taxable'),
(418, 31, '_tax_class', ''),
(419, 31, '_manage_stock', 'no'),
(420, 31, '_backorders', 'no'),
(421, 31, '_sold_individually', 'no'),
(422, 31, '_virtual', 'no'),
(423, 31, '_downloadable', 'no'),
(424, 31, '_download_limit', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(425, 31, '_download_expiry', '0'),
(426, 31, '_stock', NULL),
(427, 31, '_stock_status', 'instock'),
(428, 31, '_wc_average_rating', '0'),
(429, 31, '_wc_review_count', '0'),
(430, 31, '_product_version', '4.0.1'),
(432, 32, '_wp_attached_file', '2020/03/vneck-tee-2.jpg'),
(433, 32, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:23:"2020/03/vneck-tee-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:23:"vneck-tee-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:23:"vneck-tee-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:23:"vneck-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:23:"vneck-tee-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"vneck-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"vneck-tee-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:23:"vneck-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(434, 32, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vneck-tee-2.jpg'),
(435, 33, '_wp_attached_file', '2020/03/vnech-tee-green-1.jpg'),
(436, 33, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:29:"2020/03/vnech-tee-green-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:29:"vnech-tee-green-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"vnech-tee-green-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:29:"vnech-tee-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:29:"vnech-tee-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:29:"vnech-tee-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:29:"vnech-tee-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"vnech-tee-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(437, 33, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-green-1.jpg'),
(438, 34, '_wp_attached_file', '2020/03/vnech-tee-blue-1.jpg'),
(439, 34, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:28:"2020/03/vnech-tee-blue-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:28:"vnech-tee-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:28:"vnech-tee-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(440, 34, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-blue-1.jpg'),
(441, 7, '_wpcom_is_markdown', '1'),
(442, 7, '_wp_old_slug', 'import-placeholder-for-44'),
(443, 7, '_product_image_gallery', '33,34'),
(444, 7, '_thumbnail_id', '32'),
(445, 7, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:7:"pa_size";a:6:{s:4:"name";s:7:"pa_size";s:5:"value";s:0:"";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}}'),
(446, 35, '_wp_attached_file', '2020/03/hoodie-2.jpg'),
(447, 35, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/03/hoodie-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"hoodie-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"hoodie-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"hoodie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"hoodie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"hoodie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"hoodie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"hoodie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(448, 35, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-2.jpg'),
(449, 36, '_wp_attached_file', '2020/03/hoodie-blue-1.jpg'),
(450, 36, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:25:"2020/03/hoodie-blue-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:25:"hoodie-blue-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:25:"hoodie-blue-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:25:"hoodie-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:25:"hoodie-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:25:"hoodie-blue-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:25:"hoodie-blue-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:25:"hoodie-blue-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(451, 36, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-blue-1.jpg'),
(452, 37, '_wp_attached_file', '2020/03/hoodie-green-1.jpg'),
(453, 37, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:26:"2020/03/hoodie-green-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:26:"hoodie-green-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"hoodie-green-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:26:"hoodie-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:26:"hoodie-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:26:"hoodie-green-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:26:"hoodie-green-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:26:"hoodie-green-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(454, 37, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-green-1.jpg'),
(455, 38, '_wp_attached_file', '2020/03/hoodie-with-logo-2.jpg'),
(456, 38, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:30:"2020/03/hoodie-with-logo-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:30:"hoodie-with-logo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"hoodie-with-logo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(457, 38, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-logo-2.jpg'),
(458, 8, '_wpcom_is_markdown', '1'),
(459, 8, '_wp_old_slug', 'import-placeholder-for-45'),
(460, 8, '_product_image_gallery', '36,37,38'),
(461, 8, '_thumbnail_id', '35'),
(462, 8, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:4:"logo";a:6:{s:4:"name";s:4:"Logo";s:5:"value";s:8:"Yes | No";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"0";}}'),
(463, 9, '_wpcom_is_markdown', '1'),
(464, 9, '_wp_old_slug', 'import-placeholder-for-46'),
(465, 9, '_regular_price', '45'),
(466, 9, '_thumbnail_id', '38'),
(467, 9, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(468, 9, '_price', '45'),
(469, 39, '_wp_attached_file', '2020/03/tshirt-2.jpg'),
(470, 39, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/03/tshirt-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"tshirt-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"tshirt-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"tshirt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"tshirt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"tshirt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"tshirt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"tshirt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(471, 39, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/tshirt-2.jpg'),
(472, 10, '_wpcom_is_markdown', '1'),
(473, 10, '_wp_old_slug', 'import-placeholder-for-47'),
(474, 10, '_regular_price', '18'),
(475, 10, '_thumbnail_id', '39'),
(476, 10, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(477, 10, '_price', '18'),
(478, 40, '_wp_attached_file', '2020/03/beanie-2.jpg'),
(479, 40, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/03/beanie-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"beanie-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"beanie-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"beanie-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"beanie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"beanie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"beanie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"beanie-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"beanie-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"beanie-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(480, 40, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-2.jpg'),
(481, 11, '_wpcom_is_markdown', '1'),
(482, 11, '_wp_old_slug', 'import-placeholder-for-48'),
(483, 11, '_regular_price', '20'),
(484, 11, '_sale_price', '18'),
(485, 11, '_thumbnail_id', '40'),
(486, 11, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(487, 11, '_price', '18'),
(488, 41, '_wp_attached_file', '2020/03/belt-2.jpg'),
(489, 41, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:18:"2020/03/belt-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"belt-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"belt-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"belt-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"belt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"belt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"belt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"belt-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"belt-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"belt-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(490, 41, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/belt-2.jpg'),
(491, 12, '_wpcom_is_markdown', '1'),
(492, 12, '_wp_old_slug', 'import-placeholder-for-58'),
(493, 12, '_regular_price', '65'),
(494, 12, '_sale_price', '55'),
(495, 12, '_thumbnail_id', '41'),
(496, 12, '_price', '55'),
(497, 42, '_wp_attached_file', '2020/03/cap-2.jpg'),
(498, 42, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:17:"2020/03/cap-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:17:"cap-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:17:"cap-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:17:"cap-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:17:"cap-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:17:"cap-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:17:"cap-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:17:"cap-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:17:"cap-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:17:"cap-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(499, 42, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/cap-2.jpg'),
(500, 13, '_wpcom_is_markdown', '1'),
(501, 13, '_wp_old_slug', 'import-placeholder-for-60'),
(502, 13, '_regular_price', '18'),
(503, 13, '_sale_price', '16'),
(504, 13, '_thumbnail_id', '42'),
(505, 13, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(506, 13, '_price', '16'),
(507, 43, '_wp_attached_file', '2020/03/sunglasses-2.jpg'),
(508, 43, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:24:"2020/03/sunglasses-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:24:"sunglasses-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:24:"sunglasses-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:24:"sunglasses-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:24:"sunglasses-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:24:"sunglasses-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:24:"sunglasses-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:24:"sunglasses-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(509, 43, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/sunglasses-2.jpg'),
(510, 14, '_wpcom_is_markdown', '1'),
(511, 14, '_wp_old_slug', 'import-placeholder-for-62'),
(512, 14, '_regular_price', '90'),
(513, 14, '_thumbnail_id', '43'),
(514, 14, '_price', '90'),
(515, 44, '_wp_attached_file', '2020/03/hoodie-with-pocket-2.jpg'),
(516, 44, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:32:"2020/03/hoodie-with-pocket-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"hoodie-with-pocket-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-pocket-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(517, 44, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-pocket-2.jpg'),
(518, 15, '_wpcom_is_markdown', '1'),
(519, 15, '_wp_old_slug', 'import-placeholder-for-64'),
(520, 15, '_regular_price', '45'),
(521, 15, '_sale_price', '35'),
(522, 15, '_thumbnail_id', '44'),
(523, 15, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(524, 15, '_price', '35'),
(525, 45, '_wp_attached_file', '2020/03/hoodie-with-zipper-2.jpg') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(526, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:32:"2020/03/hoodie-with-zipper-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"hoodie-with-zipper-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-zipper-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(527, 45, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-zipper-2.jpg'),
(528, 16, '_wpcom_is_markdown', '1'),
(529, 16, '_wp_old_slug', 'import-placeholder-for-66'),
(530, 16, '_regular_price', '45'),
(531, 16, '_thumbnail_id', '45'),
(532, 16, '_price', '45'),
(533, 46, '_wp_attached_file', '2020/03/long-sleeve-tee-2.jpg'),
(534, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:29:"2020/03/long-sleeve-tee-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:29:"long-sleeve-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:29:"long-sleeve-tee-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(535, 46, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/long-sleeve-tee-2.jpg'),
(536, 17, '_wpcom_is_markdown', '1'),
(537, 17, '_wp_old_slug', 'import-placeholder-for-68'),
(538, 17, '_regular_price', '25'),
(539, 17, '_thumbnail_id', '46'),
(540, 17, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(541, 17, '_price', '25'),
(542, 47, '_wp_attached_file', '2020/03/polo-2.jpg'),
(543, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:18:"2020/03/polo-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"polo-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"polo-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"polo-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"polo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"polo-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"polo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"polo-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"polo-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"polo-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(544, 47, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/polo-2.jpg'),
(545, 18, '_wpcom_is_markdown', '1'),
(546, 18, '_wp_old_slug', 'import-placeholder-for-70'),
(547, 18, '_regular_price', '20'),
(548, 18, '_thumbnail_id', '47'),
(549, 18, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(550, 18, '_price', '20'),
(551, 48, '_wp_attached_file', '2020/03/album-1.jpg'),
(552, 48, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:19:"2020/03/album-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:19:"album-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:19:"album-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:19:"album-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:19:"album-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:19:"album-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:19:"album-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"album-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"album-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:19:"album-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(553, 48, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/album-1.jpg'),
(554, 19, '_wpcom_is_markdown', '1'),
(555, 19, '_wp_old_slug', 'import-placeholder-for-73'),
(556, 19, '_regular_price', '15'),
(557, 19, '_thumbnail_id', '48'),
(558, 19, '_downloadable_files', 'a:2:{s:36:"ce302092-8bbf-4214-9309-7154d9bcf386";a:3:{s:2:"id";s:36:"ce302092-8bbf-4214-9309-7154d9bcf386";s:4:"name";s:8:"Single 1";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}s:36:"bb69a82a-7d55-4e12-88b4-4f3a79a8413b";a:3:{s:2:"id";s:36:"bb69a82a-7d55-4e12-88b4-4f3a79a8413b";s:4:"name";s:8:"Single 2";s:4:"file";s:84:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/album.jpg";}}'),
(559, 19, '_price', '15'),
(560, 49, '_wp_attached_file', '2020/03/single-1.jpg'),
(561, 49, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:20:"2020/03/single-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"single-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"single-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"single-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"single-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"single-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"single-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"single-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"single-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"single-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(562, 49, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/single-1.jpg'),
(563, 20, '_wpcom_is_markdown', '1'),
(564, 20, '_wp_old_slug', 'import-placeholder-for-75'),
(565, 20, '_regular_price', '3'),
(566, 20, '_sale_price', '2'),
(567, 20, '_thumbnail_id', '49'),
(568, 20, '_downloadable_files', 'a:1:{s:36:"2088cc56-b3a5-4417-82cc-1ed019d21e98";a:3:{s:2:"id";s:36:"2088cc56-b3a5-4417-82cc-1ed019d21e98";s:4:"name";s:6:"Single";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}}'),
(569, 20, '_price', '2'),
(570, 21, '_wpcom_is_markdown', ''),
(571, 21, '_wp_old_slug', 'import-placeholder-for-76'),
(572, 21, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(573, 21, '_regular_price', '20'),
(574, 21, '_thumbnail_id', '32'),
(575, 21, 'attribute_pa_color', 'red'),
(576, 21, 'attribute_pa_size', ''),
(577, 21, '_price', '20'),
(578, 22, '_wpcom_is_markdown', ''),
(579, 22, '_wp_old_slug', 'import-placeholder-for-77'),
(580, 22, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(581, 22, '_regular_price', '20'),
(582, 22, '_thumbnail_id', '33'),
(583, 22, 'attribute_pa_color', 'green'),
(584, 22, 'attribute_pa_size', ''),
(585, 22, '_price', '20'),
(586, 23, '_wpcom_is_markdown', ''),
(587, 23, '_wp_old_slug', 'import-placeholder-for-78'),
(588, 23, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(589, 23, '_regular_price', '15'),
(590, 23, '_thumbnail_id', '34'),
(591, 23, 'attribute_pa_color', 'blue'),
(592, 23, 'attribute_pa_size', ''),
(593, 23, '_price', '15'),
(594, 24, '_wpcom_is_markdown', ''),
(595, 24, '_wp_old_slug', 'import-placeholder-for-79'),
(596, 24, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(597, 24, '_regular_price', '45'),
(598, 24, '_sale_price', '42'),
(599, 24, '_thumbnail_id', '35'),
(600, 24, 'attribute_pa_color', 'red'),
(601, 24, 'attribute_logo', 'No'),
(602, 24, '_price', '42'),
(603, 25, '_wpcom_is_markdown', ''),
(604, 25, '_wp_old_slug', 'import-placeholder-for-80'),
(605, 25, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(606, 25, '_regular_price', '45'),
(607, 25, '_thumbnail_id', '37'),
(608, 25, 'attribute_pa_color', 'green'),
(609, 25, 'attribute_logo', 'No'),
(610, 25, '_price', '45'),
(611, 26, '_wpcom_is_markdown', ''),
(612, 26, '_wp_old_slug', 'import-placeholder-for-81'),
(613, 26, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(614, 26, '_regular_price', '45'),
(615, 26, '_thumbnail_id', '36'),
(616, 26, 'attribute_pa_color', 'blue'),
(617, 26, 'attribute_logo', 'No'),
(618, 26, '_price', '45'),
(619, 50, '_wp_attached_file', '2020/03/t-shirt-with-logo-1.jpg'),
(620, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:31:"2020/03/t-shirt-with-logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:31:"t-shirt-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:31:"t-shirt-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(621, 50, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/t-shirt-with-logo-1.jpg'),
(622, 27, '_wpcom_is_markdown', '1'),
(623, 27, '_wp_old_slug', 'import-placeholder-for-83'),
(624, 27, '_regular_price', '18'),
(625, 27, '_thumbnail_id', '50') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(626, 27, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(627, 27, '_price', '18'),
(628, 51, '_wp_attached_file', '2020/03/beanie-with-logo-1.jpg'),
(629, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:30:"2020/03/beanie-with-logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:30:"beanie-with-logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"beanie-with-logo-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:30:"beanie-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:30:"beanie-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:30:"beanie-with-logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:30:"beanie-with-logo-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"beanie-with-logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(630, 51, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-with-logo-1.jpg'),
(631, 28, '_wpcom_is_markdown', '1'),
(632, 28, '_wp_old_slug', 'import-placeholder-for-85'),
(633, 28, '_regular_price', '20'),
(634, 28, '_sale_price', '18'),
(635, 28, '_thumbnail_id', '51'),
(636, 28, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(637, 28, '_price', '18'),
(638, 52, '_wp_attached_file', '2020/03/logo-1.jpg'),
(639, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:799;s:4:"file";s:18:"2020/03/logo-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:18:"logo-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:18:"logo-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:18:"logo-1-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:18:"logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:18:"logo-1-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:18:"logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:18:"logo-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:18:"logo-1-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:18:"logo-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(640, 52, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/logo-1.jpg'),
(641, 29, '_wpcom_is_markdown', '1'),
(642, 29, '_wp_old_slug', 'import-placeholder-for-87'),
(643, 29, '_children', 'a:3:{i:0;i:9;i:1;i:10;i:2;i:11;}'),
(644, 29, '_product_image_gallery', '51,50,38'),
(645, 29, '_thumbnail_id', '52'),
(646, 29, '_price', '18'),
(647, 29, '_price', '45'),
(648, 53, '_wp_attached_file', '2020/03/pennant-1.jpg'),
(649, 53, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:21:"2020/03/pennant-1.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:21:"pennant-1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:21:"pennant-1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"pennant-1-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:21:"pennant-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:21:"pennant-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:21:"pennant-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:21:"pennant-1-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:21:"pennant-1-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"pennant-1-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(650, 53, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/pennant-1.jpg'),
(651, 30, '_wpcom_is_markdown', '1'),
(652, 30, '_wp_old_slug', 'import-placeholder-for-89'),
(653, 30, '_regular_price', '11.05'),
(654, 30, '_thumbnail_id', '53'),
(655, 30, '_product_url', 'https://mercantile.wordpress.org/product/wordpress-pennant/'),
(656, 30, '_button_text', 'Buy on the WordPress swag store!'),
(657, 30, '_price', '11.05'),
(658, 31, '_wpcom_is_markdown', ''),
(659, 31, '_wp_old_slug', 'import-placeholder-for-90'),
(660, 31, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(661, 31, '_regular_price', '45'),
(662, 31, '_thumbnail_id', '38'),
(663, 31, 'attribute_pa_color', 'blue'),
(664, 31, 'attribute_logo', 'Yes'),
(665, 31, '_price', '45'),
(666, 7, '_price', '15'),
(667, 7, '_price', '20'),
(668, 8, '_price', '42'),
(669, 8, '_price', '45') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-03-31 11:14:46', '2020-03-31 11:14:46', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-03-31 11:14:46', '2020-03-31 11:14:46', '', 0, 'http://127.0.0.1:81/?p=1', 0, 'post', '', 1),
(2, 1, '2020-03-31 11:14:46', '2020-03-31 11:14:46', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://127.0.0.1:81/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-03-31 11:14:46', '2020-03-31 11:14:46', '', 0, 'http://127.0.0.1:81/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-03-31 11:14:46', '2020-03-31 11:14:46', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://127.0.0.1:81.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-03-31 11:14:46', '2020-03-31 11:14:46', '', 0, 'http://127.0.0.1:81/?page_id=3', 0, 'page', '', 0),
(4, 1, '2020-03-31 11:15:06', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-03-31 11:15:06', '0000-00-00 00:00:00', '', 0, 'http://127.0.0.1:81/?p=4', 0, 'post', '', 0),
(5, 1, '2020-03-31 11:17:38', '2020-03-31 11:17:38', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-03-31 11:17:38', '2020-03-31 11:17:38', '', 0, 'http://127.0.0.1:81/wp-content/uploads/2020/03/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(6, 1, '2020-03-31 11:31:39', '2020-03-31 11:31:39', 'http://127.0.0.1:81/wp-content/uploads/2020/03/sample_products.csv', 'sample_products.csv', '', 'private', 'open', 'closed', '', 'sample_products-csv', '', '', '2020-03-31 11:31:39', '2020-03-31 11:31:39', '', 0, 'http://127.0.0.1:81/wp-content/uploads/2020/03/sample_products.csv', 0, 'attachment', 'text/csv', 0),
(7, 1, '2020-03-31 11:31:48', '2020-03-31 11:31:48', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'V-Neck T-Shirt', 'This is a variable product.', 'publish', 'open', 'closed', '', 'v-neck-t-shirt', '', '', '2020-03-31 11:32:49', '2020-03-31 11:32:49', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-44/', 0, 'product', '', 0),
(8, 1, '2020-03-31 11:31:48', '2020-03-31 11:31:48', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie', 'This is a variable product.', 'publish', 'open', 'closed', '', 'hoodie', '', '', '2020-03-31 11:32:49', '2020-03-31 11:32:49', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-45/', 0, 'product', '', 0),
(9, 1, '2020-03-31 11:31:49', '2020-03-31 11:31:49', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2020-03-31 11:32:11', '2020-03-31 11:32:11', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-46/', 0, 'product', '', 0),
(10, 1, '2020-03-31 11:31:49', '2020-03-31 11:31:49', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt', '', '', '2020-03-31 11:32:13', '2020-03-31 11:32:13', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-47/', 0, 'product', '', 0),
(11, 1, '2020-03-31 11:31:49', '2020-03-31 11:31:49', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie', '', '', '2020-03-31 11:32:15', '2020-03-31 11:32:15', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-48/', 0, 'product', '', 0),
(12, 1, '2020-03-31 11:31:50', '2020-03-31 11:31:50', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Belt', 'This is a simple product.', 'publish', 'open', 'closed', '', 'belt', '', '', '2020-03-31 11:32:19', '2020-03-31 11:32:19', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-58/', 0, 'product', '', 0),
(13, 1, '2020-03-31 11:31:50', '2020-03-31 11:31:50', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Cap', 'This is a simple product.', 'publish', 'open', 'closed', '', 'cap', '', '', '2020-03-31 11:32:21', '2020-03-31 11:32:21', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-60/', 0, 'product', '', 0),
(14, 1, '2020-03-31 11:31:50', '2020-03-31 11:31:50', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Sunglasses', 'This is a simple product.', 'publish', 'open', 'closed', '', 'sunglasses', '', '', '2020-03-31 11:32:22', '2020-03-31 11:32:22', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-62/', 0, 'product', '', 0),
(15, 1, '2020-03-31 11:31:50', '2020-03-31 11:31:50', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Pocket', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-pocket', '', '', '2020-03-31 11:32:25', '2020-03-31 11:32:25', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-64/', 0, 'product', '', 0),
(16, 1, '2020-03-31 11:31:51', '2020-03-31 11:31:51', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Zipper', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-zipper', '', '', '2020-03-31 11:32:27', '2020-03-31 11:32:27', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-66/', 0, 'product', '', 0),
(17, 1, '2020-03-31 11:31:51', '2020-03-31 11:31:51', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Long Sleeve Tee', 'This is a simple product.', 'publish', 'open', 'closed', '', 'long-sleeve-tee', '', '', '2020-03-31 11:32:29', '2020-03-31 11:32:29', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-68/', 0, 'product', '', 0),
(18, 1, '2020-03-31 11:31:51', '2020-03-31 11:31:51', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Polo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'polo', '', '', '2020-03-31 11:32:31', '2020-03-31 11:32:31', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-70/', 0, 'product', '', 0),
(19, 1, '2020-03-31 11:31:52', '2020-03-31 11:31:52', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Album', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'album', '', '', '2020-03-31 11:32:34', '2020-03-31 11:32:34', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-73/', 0, 'product', '', 0),
(20, 1, '2020-03-31 11:31:52', '2020-03-31 11:31:52', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Single', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'single', '', '', '2020-03-31 11:32:36', '2020-03-31 11:32:36', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-75/', 0, 'product', '', 0),
(21, 1, '2020-03-31 11:31:52', '2020-03-31 11:31:52', '', 'V-Neck T-Shirt - Red', 'Color: Red', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-red', '', '', '2020-03-31 11:32:38', '2020-03-31 11:32:38', '', 7, 'http://127.0.0.1:81/product/import-placeholder-for-76/', 0, 'product_variation', '', 0),
(22, 1, '2020-03-31 11:31:52', '2020-03-31 11:31:52', '', 'V-Neck T-Shirt - Green', 'Color: Green', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-green', '', '', '2020-03-31 11:32:38', '2020-03-31 11:32:38', '', 7, 'http://127.0.0.1:81/product/import-placeholder-for-77/', 0, 'product_variation', '', 0),
(23, 1, '2020-03-31 11:31:53', '2020-03-31 11:31:53', '', 'V-Neck T-Shirt - Blue', 'Color: Blue', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-blue', '', '', '2020-03-31 11:32:39', '2020-03-31 11:32:39', '', 7, 'http://127.0.0.1:81/product/import-placeholder-for-78/', 0, 'product_variation', '', 0),
(24, 1, '2020-03-31 11:31:53', '2020-03-31 11:31:53', '', 'Hoodie - Red, No', 'Color: Red, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-red-no', '', '', '2020-03-31 11:32:39', '2020-03-31 11:32:39', '', 8, 'http://127.0.0.1:81/product/import-placeholder-for-79/', 1, 'product_variation', '', 0),
(25, 1, '2020-03-31 11:31:53', '2020-03-31 11:31:53', '', 'Hoodie - Green, No', 'Color: Green, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-green-no', '', '', '2020-03-31 11:32:39', '2020-03-31 11:32:39', '', 8, 'http://127.0.0.1:81/product/import-placeholder-for-80/', 2, 'product_variation', '', 0),
(26, 1, '2020-03-31 11:31:54', '2020-03-31 11:31:54', '', 'Hoodie - Blue, No', 'Color: Blue, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-blue-no', '', '', '2020-03-31 11:32:39', '2020-03-31 11:32:39', '', 8, 'http://127.0.0.1:81/product/import-placeholder-for-81/', 3, 'product_variation', '', 0),
(27, 1, '2020-03-31 11:31:54', '2020-03-31 11:31:54', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt-with-logo', '', '', '2020-03-31 11:32:42', '2020-03-31 11:32:42', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-83/', 0, 'product', '', 0),
(28, 1, '2020-03-31 11:31:54', '2020-03-31 11:31:54', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie-with-logo', '', '', '2020-03-31 11:32:44', '2020-03-31 11:32:44', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-85/', 0, 'product', '', 0),
(29, 1, '2020-03-31 11:31:54', '2020-03-31 11:31:54', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Logo Collection', 'This is a grouped product.', 'publish', 'open', 'closed', '', 'logo-collection', '', '', '2020-03-31 11:32:46', '2020-03-31 11:32:46', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-87/', 0, 'product', '', 0),
(30, 1, '2020-03-31 11:31:55', '2020-03-31 11:31:55', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'WordPress Pennant', 'This is an external product.', 'publish', 'open', 'closed', '', 'wordpress-pennant', '', '', '2020-03-31 11:32:48', '2020-03-31 11:32:48', '', 0, 'http://127.0.0.1:81/product/import-placeholder-for-89/', 0, 'product', '', 0),
(31, 1, '2020-03-31 11:31:55', '2020-03-31 11:31:55', '', 'Hoodie - Blue, Yes', 'Color: Blue, Logo: Yes', 'publish', 'closed', 'closed', '', 'hoodie-blue-yes', '', '', '2020-03-31 11:32:49', '2020-03-31 11:32:49', '', 8, 'http://127.0.0.1:81/product/import-placeholder-for-90/', 0, 'product_variation', '', 0),
(32, 1, '2020-03-31 11:31:57', '2020-03-31 11:31:57', '', 'vneck-tee-2.jpg', '', 'inherit', 'open', 'closed', '', 'vneck-tee-2-jpg', '', '', '2020-03-31 11:31:57', '2020-03-31 11:31:57', '', 7, 'http://127.0.0.1:81/wp-content/uploads/2020/03/vneck-tee-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(33, 1, '2020-03-31 11:31:59', '2020-03-31 11:31:59', '', 'vnech-tee-green-1.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-green-1-jpg', '', '', '2020-03-31 11:31:59', '2020-03-31 11:31:59', '', 7, 'http://127.0.0.1:81/wp-content/uploads/2020/03/vnech-tee-green-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(34, 1, '2020-03-31 11:32:01', '2020-03-31 11:32:01', '', 'vnech-tee-blue-1.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-blue-1-jpg', '', '', '2020-03-31 11:32:01', '2020-03-31 11:32:01', '', 7, 'http://127.0.0.1:81/wp-content/uploads/2020/03/vnech-tee-blue-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(35, 1, '2020-03-31 11:32:03', '2020-03-31 11:32:03', '', 'hoodie-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-2-jpg', '', '', '2020-03-31 11:32:03', '2020-03-31 11:32:03', '', 8, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2020-03-31 11:32:05', '2020-03-31 11:32:05', '', 'hoodie-blue-1.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-blue-1-jpg', '', '', '2020-03-31 11:32:05', '2020-03-31 11:32:05', '', 8, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-blue-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 1, '2020-03-31 11:32:08', '2020-03-31 11:32:08', '', 'hoodie-green-1.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-green-1-jpg', '', '', '2020-03-31 11:32:08', '2020-03-31 11:32:08', '', 8, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-green-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2020-03-31 11:32:09', '2020-03-31 11:32:09', '', 'hoodie-with-logo-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-logo-2-jpg', '', '', '2020-03-31 11:32:09', '2020-03-31 11:32:09', '', 8, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-with-logo-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2020-03-31 11:32:12', '2020-03-31 11:32:12', '', 'tshirt-2.jpg', '', 'inherit', 'open', 'closed', '', 'tshirt-2-jpg', '', '', '2020-03-31 11:32:12', '2020-03-31 11:32:12', '', 10, 'http://127.0.0.1:81/wp-content/uploads/2020/03/tshirt-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2020-03-31 11:32:14', '2020-03-31 11:32:14', '', 'beanie-2.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-2-jpg', '', '', '2020-03-31 11:32:14', '2020-03-31 11:32:14', '', 11, 'http://127.0.0.1:81/wp-content/uploads/2020/03/beanie-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(41, 1, '2020-03-31 11:32:18', '2020-03-31 11:32:18', '', 'belt-2.jpg', '', 'inherit', 'open', 'closed', '', 'belt-2-jpg', '', '', '2020-03-31 11:32:18', '2020-03-31 11:32:18', '', 12, 'http://127.0.0.1:81/wp-content/uploads/2020/03/belt-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(42, 1, '2020-03-31 11:32:20', '2020-03-31 11:32:20', '', 'cap-2.jpg', '', 'inherit', 'open', 'closed', '', 'cap-2-jpg', '', '', '2020-03-31 11:32:20', '2020-03-31 11:32:20', '', 13, 'http://127.0.0.1:81/wp-content/uploads/2020/03/cap-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(43, 1, '2020-03-31 11:32:21', '2020-03-31 11:32:21', '', 'sunglasses-2.jpg', '', 'inherit', 'open', 'closed', '', 'sunglasses-2-jpg', '', '', '2020-03-31 11:32:21', '2020-03-31 11:32:21', '', 14, 'http://127.0.0.1:81/wp-content/uploads/2020/03/sunglasses-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(44, 1, '2020-03-31 11:32:24', '2020-03-31 11:32:24', '', 'hoodie-with-pocket-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-pocket-2-jpg', '', '', '2020-03-31 11:32:24', '2020-03-31 11:32:24', '', 15, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-with-pocket-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(45, 1, '2020-03-31 11:32:26', '2020-03-31 11:32:26', '', 'hoodie-with-zipper-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-zipper-2-jpg', '', '', '2020-03-31 11:32:26', '2020-03-31 11:32:26', '', 16, 'http://127.0.0.1:81/wp-content/uploads/2020/03/hoodie-with-zipper-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2020-03-31 11:32:28', '2020-03-31 11:32:28', '', 'long-sleeve-tee-2.jpg', '', 'inherit', 'open', 'closed', '', 'long-sleeve-tee-2-jpg', '', '', '2020-03-31 11:32:28', '2020-03-31 11:32:28', '', 17, 'http://127.0.0.1:81/wp-content/uploads/2020/03/long-sleeve-tee-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2020-03-31 11:32:30', '2020-03-31 11:32:30', '', 'polo-2.jpg', '', 'inherit', 'open', 'closed', '', 'polo-2-jpg', '', '', '2020-03-31 11:32:30', '2020-03-31 11:32:30', '', 18, 'http://127.0.0.1:81/wp-content/uploads/2020/03/polo-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2020-03-31 11:32:33', '2020-03-31 11:32:33', '', 'album-1.jpg', '', 'inherit', 'open', 'closed', '', 'album-1-jpg', '', '', '2020-03-31 11:32:33', '2020-03-31 11:32:33', '', 19, 'http://127.0.0.1:81/wp-content/uploads/2020/03/album-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2020-03-31 11:32:36', '2020-03-31 11:32:36', '', 'single-1.jpg', '', 'inherit', 'open', 'closed', '', 'single-1-jpg', '', '', '2020-03-31 11:32:36', '2020-03-31 11:32:36', '', 20, 'http://127.0.0.1:81/wp-content/uploads/2020/03/single-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2020-03-31 11:32:41', '2020-03-31 11:32:41', '', 't-shirt-with-logo-1.jpg', '', 'inherit', 'open', 'closed', '', 't-shirt-with-logo-1-jpg', '', '', '2020-03-31 11:32:41', '2020-03-31 11:32:41', '', 27, 'http://127.0.0.1:81/wp-content/uploads/2020/03/t-shirt-with-logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2020-03-31 11:32:43', '2020-03-31 11:32:43', '', 'beanie-with-logo-1.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-with-logo-1-jpg', '', '', '2020-03-31 11:32:43', '2020-03-31 11:32:43', '', 28, 'http://127.0.0.1:81/wp-content/uploads/2020/03/beanie-with-logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2020-03-31 11:32:45', '2020-03-31 11:32:45', '', 'logo-1.jpg', '', 'inherit', 'open', 'closed', '', 'logo-1-jpg', '', '', '2020-03-31 11:32:45', '2020-03-31 11:32:45', '', 29, 'http://127.0.0.1:81/wp-content/uploads/2020/03/logo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2020-03-31 11:32:47', '2020-03-31 11:32:47', '', 'pennant-1.jpg', '', 'inherit', 'open', 'closed', '', 'pennant-1-jpg', '', '', '2020-03-31 11:32:47', '2020-03-31 11:32:47', '', 30, 'http://127.0.0.1:81/wp-content/uploads/2020/03/pennant-1.jpg', 0, 'attachment', 'image/jpeg', 0) ;

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
(7, 4, 0),
(7, 8, 0),
(7, 17, 0),
(7, 22, 0),
(7, 23, 0),
(7, 24, 0),
(7, 25, 0),
(7, 26, 0),
(7, 27, 0),
(8, 4, 0),
(8, 18, 0),
(8, 22, 0),
(8, 23, 0),
(8, 24, 0),
(9, 2, 0),
(9, 18, 0),
(9, 22, 0),
(10, 2, 0),
(10, 17, 0),
(10, 28, 0),
(11, 2, 0),
(11, 19, 0),
(11, 24, 0),
(12, 2, 0),
(12, 19, 0),
(13, 2, 0),
(13, 8, 0),
(13, 19, 0),
(13, 29, 0),
(14, 2, 0),
(14, 8, 0),
(14, 19, 0),
(15, 2, 0),
(15, 6, 0),
(15, 7, 0),
(15, 8, 0),
(15, 18, 0),
(15, 28, 0),
(16, 2, 0),
(16, 8, 0),
(16, 18, 0),
(17, 2, 0),
(17, 17, 0),
(17, 23, 0),
(18, 2, 0),
(18, 17, 0),
(18, 22, 0),
(19, 2, 0),
(19, 20, 0),
(20, 2, 0),
(20, 20, 0),
(21, 15, 0),
(22, 15, 0),
(23, 15, 0),
(24, 15, 0),
(25, 15, 0),
(26, 15, 0),
(27, 2, 0),
(27, 17, 0),
(27, 28, 0),
(28, 2, 0),
(28, 19, 0),
(28, 24, 0),
(29, 3, 0),
(29, 16, 0),
(30, 5, 0),
(30, 21, 0),
(31, 15, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
(29, 29, 'pa_color', '', 0, 1) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
(29, 'Yellow', 'yellow', 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
(16, 1, 'session_tokens', 'a:1:{s:64:"47926b292c303fc1018c8ed009f7a68854bef8404642ac74888a988cc96c7ad8";a:4:{s:10:"expiration";i:1586862903;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36";s:5:"login";i:1585653303;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, '_woocommerce_tracks_anon_id', 'woo:JucdgI8xEPNsb1p3bqlLqS3z'),
(19, 1, 'jetpack_tracks_anon_id', 'jetpack:DJQrA5Kzr+bz83UksyyIR23I'),
(20, 1, 'wc_last_active', '1585612800'),
(21, 1, 'wp_woocommerce_product_import_mapping', 'a:51:{i:0;s:2:"id";i:1;s:4:"type";i:2;s:3:"sku";i:3;s:4:"name";i:4;s:9:"published";i:5;s:8:"featured";i:6;s:18:"catalog_visibility";i:7;s:17:"short_description";i:8;s:11:"description";i:9;s:17:"date_on_sale_from";i:10;s:15:"date_on_sale_to";i:11;s:10:"tax_status";i:12;s:9:"tax_class";i:13;s:12:"stock_status";i:14;s:14:"stock_quantity";i:15;s:10:"backorders";i:16;s:17:"sold_individually";i:17;s:0:"";i:18;s:0:"";i:19;s:0:"";i:20;s:0:"";i:21;s:15:"reviews_allowed";i:22;s:13:"purchase_note";i:23;s:10:"sale_price";i:24;s:13:"regular_price";i:25;s:12:"category_ids";i:26;s:7:"tag_ids";i:27;s:17:"shipping_class_id";i:28;s:6:"images";i:29;s:14:"download_limit";i:30;s:15:"download_expiry";i:31;s:9:"parent_id";i:32;s:16:"grouped_products";i:33;s:10:"upsell_ids";i:34;s:14:"cross_sell_ids";i:35;s:11:"product_url";i:36;s:11:"button_text";i:37;s:10:"menu_order";i:38;s:16:"attributes:name1";i:39;s:17:"attributes:value1";i:40;s:19:"attributes:visible1";i:41;s:20:"attributes:taxonomy1";i:42;s:16:"attributes:name2";i:43;s:17:"attributes:value2";i:44;s:19:"attributes:visible2";i:45;s:20:"attributes:taxonomy2";i:46;s:23:"meta:_wpcom_is_markdown";i:47;s:15:"downloads:name1";i:48;s:14:"downloads:url1";i:49;s:15:"downloads:name2";i:50;s:14:"downloads:url2";}'),
(22, 1, 'wp_product_import_error_log', 'a:0:{}'),
(23, 1, 'dismissed_no_secure_connection_notice', '1') ;

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
(1, 'admin', '$P$BQgn/3.vzyeN.Ee1Zrzkkwzf36J4Py1', 'admin', 'dev-email@flywheel.local', '', '2020-03-31 11:14:46', '', 0, 'admin') ;

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
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_note_actions`
#
INSERT INTO `wp_wc_admin_note_actions` ( `action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`) VALUES
(1, 1, 'open-customizer', 'Open Customizer', 'customize.php', 'actioned', 0),
(2, 2, 'learn-more', 'Learn more', 'https://woocommerce.wordpress.com/', 'actioned', 0),
(3, 3, 'connect', 'Connect', '?page=wc-addons&section=helper', 'actioned', 0),
(4, 4, 'add-a-product', 'Add a product', 'http://127.0.0.1:81/wp-admin/post-new.php?post_type=product', 'actioned', 1),
(5, 5, 'continue-profiler', 'Continue Store Setup', 'http://127.0.0.1:81/wp-admin/admin.php?page=wc-admin&enable_onboarding=1', 'unactioned', 1),
(6, 5, 'skip-profiler', 'Skip Setup', 'http://127.0.0.1:81/wp-admin/admin.php?page=wc-admin&reset_profiler=0', 'actioned', 0) ;

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
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_notes`
#
INSERT INTO `wp_wc_admin_notes` ( `note_id`, `name`, `type`, `locale`, `title`, `content`, `icon`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`) VALUES
(1, 'wc-admin-store-notice-setting-moved', 'info', 'en_US', 'Looking for the Store Notice setting?', 'It can now be found in the Customizer.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-03-31 11:17:40', NULL, 0),
(2, 'wc-admin-welcome-note', 'info', 'en_US', 'New feature(s)', 'Welcome to the new WooCommerce experience! In this new release you\'ll be able to have a glimpse of how your store is doing in the Dashboard, manage important aspects of your business (such as managing orders, stock, reviews) from anywhere in the interface, dive into your store data with a completely new Analytics section and more!', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-03-31 11:17:40', NULL, 0),
(3, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-03-31 11:17:41', NULL, 0),
(4, 'wc-admin-add-first-product', 'info', 'en_US', 'Add your first product', 'Grow your revenue by adding products to your store. Add products manually, import from a sheet, or migrate from another platform.', 'product', '{}', 'unactioned', 'woocommerce-admin', '2020-03-31 11:17:47', NULL, 0),
(5, 'wc-admin-onboarding-profiler-reminder', 'update', 'en_US', 'Welcome to WooCommerce! Set up your store and start selling', 'We\'re here to help you going through the most important steps to get your store up and running.', 'info', '{}', 'actioned', 'woocommerce-admin', '2020-03-31 11:17:57', NULL, 0) ;

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
  `coupon_id` bigint(20) unsigned NOT NULL,
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
(7, 'woo-vneck-tee', 0, 0, '15.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(8, 'woo-hoodie', 0, 0, '42.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(9, 'woo-hoodie-with-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(10, 'woo-tshirt', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(11, 'woo-beanie', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(12, 'woo-belt', 0, 0, '55.0000', '55.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(13, 'woo-cap', 0, 0, '16.0000', '16.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(14, 'woo-sunglasses', 0, 0, '90.0000', '90.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(15, 'woo-hoodie-with-pocket', 0, 0, '35.0000', '35.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(16, 'woo-hoodie-with-zipper', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(17, 'woo-long-sleeve-tee', 0, 0, '25.0000', '25.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(18, 'woo-polo', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(19, 'woo-album', 1, 1, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(20, 'woo-single', 1, 1, '2.0000', '2.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(21, 'woo-vneck-tee-red', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(22, 'woo-vneck-tee-green', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(23, 'woo-vneck-tee-blue', 0, 0, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(24, 'woo-hoodie-red', 0, 0, '42.0000', '42.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(25, 'woo-hoodie-green', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(26, 'woo-hoodie-blue', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(27, 'Woo-tshirt-logo', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(28, 'Woo-beanie-logo', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(29, 'logo-collection', 0, 0, '18.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(30, 'wp-pennant', 0, 0, '11.0500', '11.0500', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(31, 'woo-hoodie-blue-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '') ;

#
# End of data contents of table `wp_wc_product_meta_lookup`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_sessions`
#
INSERT INTO `wp_woocommerce_sessions` ( `session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(1, '1', 'a:7:{s:4:"cart";s:6:"a:0:{}";s:11:"cart_totals";s:367:"a:15:{s:8:"subtotal";i:0;s:12:"subtotal_tax";i:0;s:14:"shipping_total";i:0;s:12:"shipping_tax";i:0;s:14:"shipping_taxes";a:0:{}s:14:"discount_total";i:0;s:12:"discount_tax";i:0;s:19:"cart_contents_total";i:0;s:17:"cart_contents_tax";i:0;s:19:"cart_contents_taxes";a:0:{}s:9:"fee_total";i:0;s:7:"fee_tax";i:0;s:9:"fee_taxes";a:0:{}s:5:"total";i:0;s:9:"total_tax";i:0;}";s:15:"applied_coupons";s:6:"a:0:{}";s:22:"coupon_discount_totals";s:6:"a:0:{}";s:26:"coupon_discount_tax_totals";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:8:"customer";s:712:"a:26:{s:2:"id";s:1:"1";s:13:"date_modified";s:0:"";s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:2:"GB";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:2:"GB";s:13:"is_vat_exempt";s:0:"";s:19:"calculated_shipping";s:0:"";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:24:"dev-email@flywheel.local";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1585826266) ;

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

