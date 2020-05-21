# WordPress MySQL database migration
#
# Generated: Thursday 21. May 2020 06:30 UTC
# Hostname: db
# Database: `wp`
# URL: //localhost
# Path: /var/www/html
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_actions`
#
INSERT INTO `wp_actionscheduler_actions` ( `action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(12, 'action_scheduler/migration_hook', 'complete', '2020-05-21 06:26:48', '2020-05-21 06:26:48', '[]', 'O:30:"ActionScheduler_SimpleSchedule":2:{s:22:"\0*\0scheduled_timestamp";i:1590042408;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590042408;}', 1, 1, '2020-05-21 06:26:55', '2020-05-21 06:26:55', 0, NULL),
(13, 'woocommerce_update_marketplace_suggestions', 'complete', '2020-05-21 06:26:16', '2020-05-21 06:26:16', '[]', 'O:30:"ActionScheduler_SimpleSchedule":2:{s:22:"\0*\0scheduled_timestamp";i:1590042376;s:41:"\0ActionScheduler_SimpleSchedule\0timestamp";i:1590042376;}', 0, 1, '2020-05-21 06:26:55', '2020-05-21 06:26:55', 0, NULL) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_actionscheduler_logs`
#
INSERT INTO `wp_actionscheduler_logs` ( `log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 12, 'action created', '2020-05-21 06:25:48', '2020-05-21 06:25:48'),
(2, 13, 'action created', '2020-05-21 06:26:16', '2020-05-21 06:26:16'),
(3, 12, 'action started via Async Request', '2020-05-21 06:26:55', '2020-05-21 06:26:55'),
(4, 12, 'action complete via Async Request', '2020-05-21 06:26:55', '2020-05-21 06:26:55'),
(5, 13, 'action started via Async Request', '2020-05-21 06:26:55', '2020-05-21 06:26:55'),
(6, 13, 'action complete via Async Request', '2020-05-21 06:26:55', '2020-05-21 06:26:55') ;

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
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-04-17 13:35:07', '2020-04-17 13:35:07', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost', 'yes'),
(2, 'home', 'http://localhost', 'yes'),
(3, 'blogname', 'Fresh Test', 'yes'),
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
(29, 'rewrite_rules', 'a:155:{s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:37:"shop/feed/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:32:"shop/(feed|rdf|rss|rss2|atom)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:55:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:50:"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:31:"product-category/(.+?)/embed/?$";s:44:"index.php?product_cat=$matches[1]&embed=true";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:52:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:47:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:28:"product-tag/([^/]+)/embed/?$";s:44:"index.php?product_tag=$matches[1]&embed=true";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"product/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"product/([^/]+)/embed/?$";s:40:"index.php?product=$matches[1]&embed=true";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:48:"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:43:"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:32:"product/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"product/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:13:"favicon\\.ico$";s:19:"index.php?favicon=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:25:"(.?.+?)/orders(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&orders=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:28:"(.?.+?)/downloads(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&downloads=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:34:"(.?.+?)/payment-methods(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&payment-methods=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:40:"(.?.+?)/delete-payment-method(/(.*))?/?$";s:64:"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]";s:45:"(.?.+?)/set-default-payment-method(/(.*))?/?$";s:69:"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:39:"starcat-review-ct/starcat-review-ct.php";i:1;s:33:"starcat-review/starcat-review.php";i:2;s:27:"woocommerce/woocommerce.php";i:3;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
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
(48, 'db_version', '47018', 'yes'),
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
(93, 'admin_email_lifespan', '1602682505', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:114:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:1:{s:4:"read";b:1;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop manager";s:12:"capabilities";a:92:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"edit_theme_options";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;}}}', 'yes'),
(96, 'fresh_site', '1', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(103, 'cron', 'a:20:{i:1590042641;a:1:{s:26:"action_scheduler_run_queue";a:1:{s:32:"0d04ed39571b55704c122d726248bbac";a:3:{s:8:"schedule";s:12:"every_minute";s:4:"args";a:1:{i:0;s:7:"WP Cron";}s:8:"interval";i:60;}}}i:1590042909;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590045945;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1590045947;a:1:{s:33:"wc_admin_process_orders_milestone";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590045954;a:1:{s:29:"wc_admin_unsnooze_admin_notes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1590053146;a:1:{s:24:"woocommerce_cleanup_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590063946;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1590068108;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590068109;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1590068191;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590068194;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590105600;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590128748;a:1:{s:14:"wc_admin_daily";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590128756;a:2:{s:33:"woocommerce_cleanup_personal_data";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1590128794;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"25117f4b9fd9bb6384d0eb8ea708c8b9";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:12;}}}}i:1590128828;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"45f91c1ee81280c48cfb715d2c9931b0";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:19;}}}}i:1590128974;a:1:{s:26:"importer_scheduled_cleanup";a:1:{s:32:"1a89a2a2129300c1da6763ba0380ed1f";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:56;}}}}i:1590240908;a:1:{s:30:"wp_site_health_scheduled_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}i:1591338406;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:11:"fifteendays";s:4:"args";a:0:{}s:8:"interval";i:1296000;}}}s:7:"version";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'nonce_key', 'e#vuN8!z#ujlW:&_J9l5S^R0ghi}>P?e]NBza_f9F=,sO8GcBD#Sqd9wmV<Z[8IW', 'no'),
(111, 'nonce_salt', '/OMI5^@6T~/jmP./#sACS]whfg[0TOqyl#Tt]o5!o6AXH-d$#}q_Z- 6oEEtlRJ}', 'no'),
(112, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(140, 'can_compress_scripts', '1', 'no'),
(141, 'recently_activated', 'a:0:{}', 'yes'),
(148, 'fs_active_plugins', 'O:8:"stdClass":3:{s:7:"plugins";a:1:{s:36:"starcat-review/includes/lib/freemius";O:8:"stdClass":4:{s:7:"version";s:5:"2.3.0";s:4:"type";s:6:"plugin";s:9:"timestamp";i:1590042236;s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";}}s:7:"abspath";s:14:"/var/www/html/";s:6:"newest";O:8:"stdClass":5:{s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";s:8:"sdk_path";s:36:"starcat-review/includes/lib/freemius";s:7:"version";s:5:"2.3.0";s:13:"in_activation";b:0;s:9:"timestamp";i:1590042236;}}', 'yes'),
(149, 'fs_debug_mode', '', 'yes'),
(150, 'fs_accounts', 'a:8:{s:21:"id_slug_type_path_map";a:3:{i:3980;a:3:{s:4:"slug";s:14:"starcat-review";s:4:"type";s:6:"plugin";s:4:"path";s:33:"starcat-review/starcat-review.php";}i:5122;a:3:{s:4:"slug";s:19:"starcat-reviews-cpt";s:4:"type";s:6:"plugin";s:4:"path";s:41:"starcat-review-cpt/starcat-review-cpt.php";}i:5788;a:3:{s:4:"slug";s:25:"starcat-review-woo-notify";s:4:"type";s:6:"plugin";s:4:"path";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";}}s:11:"plugin_data";a:3:{s:14:"starcat-review";a:17:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:33:"starcat-review/starcat-review.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1587130794;s:16:"sdk_last_version";N;s:11:"sdk_version";s:5:"2.3.0";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:3:"0.5";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:15:"freshtest.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1587130794;s:7:"version";s:3:"0.5";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:1;s:21:"is_pending_activation";b:1;s:19:"pending_license_key";s:32:"sk_aPwaV@!{<0;NikRNOQSZH=o*+Yenw";}s:19:"starcat-reviews-cpt";a:15:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:41:"starcat-review-cpt/starcat-review-cpt.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1587130795;s:16:"sdk_last_version";N;s:11:"sdk_version";s:5:"2.3.0";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:5:"0.2.2";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:17:"was_plugin_loaded";b:1;s:21:"is_plugin_new_install";b:0;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:15:"freshtest.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1587130795;s:7:"version";s:5:"0.2.2";}s:15:"prev_is_premium";b:1;}s:25:"starcat-review-woo-notify";a:15:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1587540058;s:16:"sdk_last_version";N;s:11:"sdk_version";s:5:"2.3.0";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:3:"0.1";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:15:"freshtest.local";s:9:"server_ip";s:3:"::1";s:9:"is_active";b:1;s:9:"timestamp";i:1587540058;s:7:"version";s:3:"0.1";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:1;}}s:13:"file_slug_map";a:4:{s:33:"starcat-review/starcat-review.php";s:14:"starcat-review";s:41:"starcat-review-cpt/starcat-review-cpt.php";s:19:"starcat-reviews-cpt";s:63:"starcat-review-woo-notify-premium/starcat-review-woo-notify.php";s:25:"starcat-review-woo-notify";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";s:25:"starcat-review-woo-notify";}s:7:"plugins";a:3:{s:14:"starcat-review";O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";N;s:5:"title";s:14:"Starcat Review";s:4:"slug";s:14:"starcat-review";s:12:"premium_slug";s:22:"starcat-review-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:33:"starcat-review/starcat-review.php";s:7:"version";s:3:"0.5";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:3:"Pro";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_ad2b6650d9ef2e5df3c203ea9046f";s:10:"secret_key";s:32:"sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;";s:2:"id";s:4:"3980";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:19:"starcat-reviews-cpt";O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:26:"Starcat Review - CPT Addon";s:4:"slug";s:19:"starcat-reviews-cpt";s:12:"premium_slug";s:27:"starcat-reviews-cpt-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:41:"starcat-review-cpt/starcat-review-cpt.php";s:7:"version";s:5:"0.2.2";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_8fddc58480a7e2a5406422a545c05";s:10:"secret_key";N;s:2:"id";s:4:"5122";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:25:"starcat-review-woo-notify";O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:46:"Starcat Review - Woocommerce Notfication Addon";s:4:"slug";s:25:"starcat-review-woo-notify";s:12:"premium_slug";s:33:"starcat-review-woo-notify-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:55:"starcat-review-woo-notify/starcat-review-woo-notify.php";s:7:"version";s:3:"0.1";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_e9a5e492ae277b93cc518c49f6533";s:10:"secret_key";N;s:2:"id";s:4:"5788";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:1;s:11:"_is_updated";b:1;}}s:9:"unique_id";s:32:"52d31f4f9597831c8aa272d78f813999";s:13:"admin_notices";a:1:{s:14:"starcat-review";a:0:{}}s:7:"updates";a:2:{i:3980;N;i:5122;N;}s:6:"addons";a:1:{i:3980;a:3:{i:0;O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:19:"Starcat Reviews CPT";s:4:"slug";s:23:"starcat-review-cpt-free";s:12:"premium_slug";s:18:"starcat-review-cpt";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:3;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5122";s:11:"description";N;s:17:"short_description";s:40:"Adds a custom post type just for reviews";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1313";s:7:"updated";s:19:"2020-04-13 11:25:30";s:7:"created";s:19:"2019-12-23 11:11:28";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_8fddc58480a7e2a5406422a545c05";s:10:"secret_key";N;s:2:"id";s:4:"5122";s:7:"updated";s:19:"2020-04-21 13:44:00";s:7:"created";s:19:"2019-12-04 05:48:38";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:40:"Starcat Reviews Woocommerce Notification";s:4:"slug";s:25:"starcat-review-woo-notify";s:12:"premium_slug";s:33:"starcat-review-woo-notify-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:1;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5788";s:11:"description";N;s:17:"short_description";s:97:"Lets you send notifications with review links when users place an order on your Woocommerce Store";s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1546";s:7:"updated";N;s:7:"created";s:19:"2020-04-13 11:26:14";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_e9a5e492ae277b93cc518c49f6533";s:10:"secret_key";N;s:2:"id";s:4:"5788";s:7:"updated";s:19:"2020-04-21 15:26:47";s:7:"created";s:19:"2020-03-25 05:07:42";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:2;O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";s:4:"3980";s:5:"title";s:34:"Starcat Reviews - Comparison Table";s:4:"slug";s:17:"starcat-review-ct";s:12:"premium_slug";s:25:"starcat-review-ct-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";N;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";i:1;s:4:"file";N;s:7:"version";N;s:11:"auto_update";N;s:4:"info";O:14:"FS_Plugin_Info":14:{s:9:"plugin_id";s:4:"5890";s:11:"description";N;s:17:"short_description";N;s:10:"banner_url";N;s:15:"card_banner_url";N;s:15:"selling_point_0";N;s:15:"selling_point_1";N;s:15:"selling_point_2";N;s:11:"screenshots";N;s:2:"id";s:4:"1555";s:7:"updated";N;s:7:"created";s:19:"2020-04-17 13:58:53";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}s:10:"is_premium";b:0;s:14:"premium_suffix";s:9:"(Premium)";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_3c2fb3e4708761d01d68bae1a5cef";s:10:"secret_key";N;s:2:"id";s:4:"5890";s:7:"updated";s:19:"2020-04-17 13:58:31";s:7:"created";s:19:"2020-04-16 14:52:42";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}}', 'yes'),
(151, 'fs_api_cache', 'a:0:{}', 'yes'),
(152, 'fs_gdpr', 'a:1:{s:2:"u1";a:1:{s:8:"required";b:0;}}', 'yes'),
(155, 'widget_scr-listing', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(156, 'widget_scr-comparison-table', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(157, 'scr_options', 'a:54:{s:24:"review_enable_post-types";s:4:"post";s:20:"enable-author-review";b:1;s:16:"enable-pros-cons";b:1;s:16:"stats-subheading";s:0:"";s:16:"stat-singularity";s:6:"single";s:12:"global_stats";a:1:{i:0;a:1:{s:9:"stat_name";s:7:"Feature";}}s:10:"stats-type";s:4:"star";s:17:"stats-source-type";s:4:"icon";s:23:"stats-show-rating-label";b:1;s:11:"stats-icons";s:4:"star";s:17:"stats-icons-color";s:7:"#e7711b";s:23:"stats-icons-label-color";s:7:"#0274be";s:12:"stats-images";s:0:"";s:17:"stats-stars-limit";i:5;s:11:"stats-steps";s:4:"half";s:13:"stats-animate";b:0;s:22:"stats-no-rated-message";s:17:"Not Rated Yet !!!";s:13:"mp_meta_title";s:7:"Reviews";s:19:"mp_meta_description";s:22:"These are your reviews";s:7:"mp_slug";s:7:"reviews";s:18:"mp_template_layout";s:10:"full-width";s:19:"mp_components_order";a:2:{s:19:"mp_category_listing";b:1;s:17:"mp_review_listing";b:1;}s:13:"mp_cl_heading";s:0:"";s:11:"mp_cl_title";s:17:"Review Categories";s:17:"mp_cl_description";b:1;s:10:"mp_cl_cols";s:1:"2";s:13:"mp_rl_heading";s:0:"";s:11:"mp_rl_title";s:12:"Review Posts";s:12:"mp_rl_sortby";s:6:"recent";s:10:"mp_rl_cols";s:1:"3";s:18:"cp_template_layout";s:10:"full-width";s:11:"cp_controls";b:1;s:22:"cp_controls_subheading";s:0:"";s:9:"cp_search";b:1;s:9:"cp_sortBy";b:1;s:29:"cp_listing_options_subheading";s:0:"";s:17:"cp_posts_per_page";s:1:"9";s:17:"cp_default_sortBy";s:6:"recent";s:14:"cp_num_of_cols";s:1:"3";s:18:"sp_template_layout";s:10:"full-width";s:16:"sp_show_controls";b:1;s:21:"sp_rating_combination";s:8:"combined";s:17:"ur_who_can_review";s:0:"";s:18:"ur_show_list_title";b:1;s:13:"ur_list_title";s:12:"User Reviews";s:16:"ur_enable_voting";b:1;s:18:"ur_show_form_title";b:1;s:13:"ur_form_title";s:14:"Leave a Review";s:13:"ur_show_title";b:1;s:13:"ur_show_stats";b:1;s:19:"ur_show_description";b:1;s:15:"ur_show_captcha";b:0;s:18:"recaptcha_site_key";s:0:"";s:20:"recaptcha_secret_key";s:0:"";}', 'yes'),
(158, 'slug_upgrades', 'a:1:{s:3:"0.2";b:1;}', 'yes'),
(159, 'SCR_VERSION', '0.5', 'yes'),
(213, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1590042627;}', 'no'),
(243, 'action_scheduler_hybrid_store_demarkation', '11', 'yes'),
(244, 'schema-ActionScheduler_StoreSchema', '3.0.1590042341', 'yes'),
(245, 'schema-ActionScheduler_LoggerSchema', '2.0.1590042341', 'yes'),
(248, 'woocommerce_store_address', '', 'yes'),
(249, 'woocommerce_store_address_2', '', 'yes'),
(250, 'woocommerce_store_city', '', 'yes'),
(251, 'woocommerce_default_country', 'GB', 'yes'),
(252, 'woocommerce_store_postcode', '', 'yes'),
(253, 'woocommerce_allowed_countries', 'all', 'yes'),
(254, 'woocommerce_all_except_countries', '', 'yes'),
(255, 'woocommerce_specific_allowed_countries', '', 'yes'),
(256, 'woocommerce_ship_to_countries', '', 'yes'),
(257, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(258, 'woocommerce_default_customer_address', 'base', 'yes'),
(259, 'woocommerce_calc_taxes', 'no', 'yes'),
(260, 'woocommerce_enable_coupons', 'yes', 'yes'),
(261, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(262, 'woocommerce_currency', 'GBP', 'yes'),
(263, 'woocommerce_currency_pos', 'left', 'yes'),
(264, 'woocommerce_price_thousand_sep', ',', 'yes'),
(265, 'woocommerce_price_decimal_sep', '.', 'yes'),
(266, 'woocommerce_price_num_decimals', '2', 'yes'),
(267, 'woocommerce_shop_page_id', '', 'yes'),
(268, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(269, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(270, 'woocommerce_placeholder_image', '11', 'yes'),
(271, 'woocommerce_weight_unit', 'kg', 'yes'),
(272, 'woocommerce_dimension_unit', 'cm', 'yes'),
(273, 'woocommerce_enable_reviews', 'yes', 'yes'),
(274, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(275, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(276, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(277, 'woocommerce_review_rating_required', 'yes', 'no'),
(278, 'woocommerce_manage_stock', 'yes', 'yes'),
(279, 'woocommerce_hold_stock_minutes', '60', 'no'),
(280, 'woocommerce_notify_low_stock', 'yes', 'no'),
(281, 'woocommerce_notify_no_stock', 'yes', 'no'),
(282, 'woocommerce_stock_email_recipient', 'dev-email@flywheel.local', 'no'),
(283, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(284, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(285, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(286, 'woocommerce_stock_format', '', 'yes'),
(287, 'woocommerce_file_download_method', 'force', 'no'),
(288, 'woocommerce_downloads_require_login', 'no', 'no'),
(289, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(290, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(291, 'woocommerce_prices_include_tax', 'no', 'yes'),
(292, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(293, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(294, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(295, 'woocommerce_tax_classes', '', 'yes'),
(296, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(297, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(298, 'woocommerce_price_display_suffix', '', 'yes'),
(299, 'woocommerce_tax_total_display', 'itemized', 'no'),
(300, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(301, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(302, 'woocommerce_ship_to_destination', 'billing', 'no'),
(303, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(304, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(305, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(306, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(307, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(308, 'woocommerce_registration_generate_username', 'yes', 'no'),
(309, 'woocommerce_registration_generate_password', 'yes', 'no'),
(310, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(311, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(312, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(313, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(314, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(315, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(316, 'woocommerce_trash_pending_orders', '', 'no') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(317, 'woocommerce_trash_failed_orders', '', 'no'),
(318, 'woocommerce_trash_cancelled_orders', '', 'no'),
(319, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:"number";s:0:"";s:4:"unit";s:6:"months";}', 'no'),
(320, 'woocommerce_email_from_name', 'Fresh Test', 'no'),
(321, 'woocommerce_email_from_address', 'dev-email@flywheel.local', 'no'),
(322, 'woocommerce_email_header_image', '', 'no'),
(323, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(324, 'woocommerce_email_base_color', '#96588a', 'no'),
(325, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(326, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(327, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(328, 'woocommerce_cart_page_id', '', 'no'),
(329, 'woocommerce_checkout_page_id', '', 'no'),
(330, 'woocommerce_myaccount_page_id', '', 'no'),
(331, 'woocommerce_terms_page_id', '', 'no'),
(332, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(333, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(334, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(335, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(336, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(337, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(338, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(339, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(340, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(341, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(342, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(343, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(344, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(345, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(346, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(347, 'woocommerce_api_enabled', 'no', 'yes'),
(348, 'woocommerce_allow_tracking', 'no', 'no'),
(349, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(350, 'woocommerce_single_image_width', '600', 'yes'),
(351, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(352, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(353, 'woocommerce_demo_store', 'no', 'no'),
(354, 'woocommerce_permalinks', 'a:5:{s:12:"product_base";s:7:"product";s:13:"category_base";s:16:"product-category";s:8:"tag_base";s:11:"product-tag";s:14:"attribute_base";s:0:"";s:22:"use_verbose_page_rules";b:0;}', 'yes'),
(355, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(356, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(359, 'default_product_cat', '15', 'yes'),
(360, 'woocommerce_admin_notices', 'a:2:{i:0;s:7:"install";i:1;s:20:"no_secure_connection";}', 'yes'),
(363, 'woocommerce_version', '4.1.1', 'yes'),
(364, 'woocommerce_db_version', '4.1.1', 'yes'),
(367, 'action_scheduler_lock_async-request-runner', '1590042668', 'yes'),
(368, 'theme_mods_twentytwenty', 'a:1:{s:16:"background_color";s:3:"fff";}', 'yes'),
(369, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:"database_prefix";s:32:"IyulFWA1uGbnJA0Aq39zlyDSphij2F7x";}', 'yes'),
(371, 'widget_woocommerce_widget_cart', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(372, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(373, 'widget_woocommerce_layered_nav', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(374, 'widget_woocommerce_price_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(375, 'widget_woocommerce_product_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(376, 'widget_woocommerce_product_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(377, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(378, 'widget_woocommerce_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(379, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(380, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(381, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(382, 'widget_woocommerce_rating_filter', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(383, 'woocommerce_onboarding_opt_in', 'yes', 'yes'),
(386, 'woocommerce_admin_version', '1.1.3', 'yes'),
(387, 'woocommerce_admin_install_timestamp', '1590042348', 'yes'),
(391, 'woocommerce_admin_last_orders_milestone', '0', 'yes'),
(392, 'woocommerce_onboarding_profile', 'a:1:{s:9:"completed";b:0;}', 'yes'),
(394, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(417, 'product_cat_children', 'a:1:{i:16;a:3:{i:0;i:17;i:1;i:18;i:2;i:19;}}', 'yes'),
(418, 'action_scheduler_migration_status', 'complete', 'yes'),
(419, 'woocommerce_marketplace_suggestions', 'a:2:{s:11:"suggestions";a:26:{i:0;a:4:{s:4:"slug";s:28:"product-edit-meta-tab-header";s:7:"context";s:28:"product-edit-meta-tab-header";s:5:"title";s:22:"Recommended extensions";s:13:"allow-dismiss";b:0;}i:1;a:6:{s:4:"slug";s:39:"product-edit-meta-tab-footer-browse-all";s:7:"context";s:28:"product-edit-meta-tab-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:2;a:9:{s:4:"slug";s:46:"product-edit-mailchimp-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-mailchimp";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/mailchimp-for-memberships.svg";s:5:"title";s:25:"Mailchimp for Memberships";s:4:"copy";s:79:"Completely automate your email lists by syncing membership changes to Mailchimp";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/mailchimp-woocommerce-memberships/";}i:3;a:9:{s:4:"slug";s:19:"product-edit-addons";s:7:"product";s:26:"woocommerce-product-addons";s:14:"show-if-active";a:2:{i:0;s:25:"woocommerce-subscriptions";i:1;s:20:"woocommerce-bookings";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-add-ons.svg";s:5:"title";s:15:"Product Add-Ons";s:4:"copy";s:93:"Offer add-ons like gift wrapping, special messages or other special options for your products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-add-ons/";}i:4;a:9:{s:4:"slug";s:46:"product-edit-woocommerce-subscriptions-gifting";s:7:"product";s:33:"woocommerce-subscriptions-gifting";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:116:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/gifting-for-subscriptions.svg";s:5:"title";s:25:"Gifting for Subscriptions";s:4:"copy";s:70:"Let customers buy subscriptions for others - they\'re the ultimate gift";s:11:"button-text";s:10:"Learn More";s:3:"url";s:67:"https://woocommerce.com/products/woocommerce-subscriptions-gifting/";}i:5;a:9:{s:4:"slug";s:42:"product-edit-teams-woocommerce-memberships";s:7:"product";s:33:"woocommerce-memberships-for-teams";s:14:"show-if-active";a:1:{i:0;s:23:"woocommerce-memberships";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:112:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/teams-for-memberships.svg";s:5:"title";s:21:"Teams for Memberships";s:4:"copy";s:123:"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/teams-woocommerce-memberships/";}i:6;a:8:{s:4:"slug";s:29:"product-edit-variation-images";s:7:"product";s:39:"woocommerce-additional-variation-images";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/additional-variation-images.svg";s:5:"title";s:27:"Additional Variation Images";s:4:"copy";s:72:"Showcase your products in the best light with a image for each variation";s:11:"button-text";s:10:"Learn More";s:3:"url";s:73:"https://woocommerce.com/products/woocommerce-additional-variation-images/";}i:7;a:9:{s:4:"slug";s:47:"product-edit-woocommerce-subscription-downloads";s:7:"product";s:34:"woocommerce-subscription-downloads";s:14:"show-if-active";a:1:{i:0;s:25:"woocommerce-subscriptions";}s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:113:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscription-downloads.svg";s:5:"title";s:22:"Subscription Downloads";s:4:"copy";s:57:"Give customers special downloads with their subscriptions";s:11:"button-text";s:10:"Learn More";s:3:"url";s:68:"https://woocommerce.com/products/woocommerce-subscription-downloads/";}i:8;a:8:{s:4:"slug";s:31:"product-edit-min-max-quantities";s:7:"product";s:30:"woocommerce-min-max-quantities";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:109:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/min-max-quantities.svg";s:5:"title";s:18:"Min/Max Quantities";s:4:"copy";s:81:"Specify minimum and maximum allowed product quantities for orders to be completed";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/min-max-quantities/";}i:9;a:8:{s:4:"slug";s:28:"product-edit-name-your-price";s:7:"product";s:27:"woocommerce-name-your-price";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/name-your-price.svg";s:5:"title";s:15:"Name Your Price";s:4:"copy";s:70:"Let customers pay what they want - useful for donations, tips and more";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/name-your-price/";}i:10;a:8:{s:4:"slug";s:42:"product-edit-woocommerce-one-page-checkout";s:7:"product";s:29:"woocommerce-one-page-checkout";s:7:"context";a:1:{i:0;s:26:"product-edit-meta-tab-body";}s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/one-page-checkout.svg";s:5:"title";s:17:"One Page Checkout";s:4:"copy";s:92:"Don\'t make customers click around - let them choose products, checkout & pay all on one page";s:11:"button-text";s:10:"Learn More";s:3:"url";s:63:"https://woocommerce.com/products/woocommerce-one-page-checkout/";}i:11;a:4:{s:4:"slug";s:19:"orders-empty-header";s:7:"context";s:24:"orders-list-empty-header";s:5:"title";s:20:"Tools for your store";s:13:"allow-dismiss";b:0;}i:12;a:6:{s:4:"slug";s:30:"orders-empty-footer-browse-all";s:7:"context";s:24:"orders-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:13;a:8:{s:4:"slug";s:19:"orders-empty-zapier";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:18:"woocommerce-zapier";s:4:"icon";s:97:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/zapier.svg";s:5:"title";s:6:"Zapier";s:4:"copy";s:88:"Save time and increase productivity by connecting your store to more than 1000+ services";s:11:"button-text";s:10:"Learn More";s:3:"url";s:52:"https://woocommerce.com/products/woocommerce-zapier/";}i:14;a:8:{s:4:"slug";s:30:"orders-empty-shipment-tracking";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:29:"woocommerce-shipment-tracking";s:4:"icon";s:108:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipment-tracking.svg";s:5:"title";s:17:"Shipment Tracking";s:4:"copy";s:86:"Let customers know when their orders will arrive by adding shipment tracking to emails";s:11:"button-text";s:10:"Learn More";s:3:"url";s:51:"https://woocommerce.com/products/shipment-tracking/";}i:15;a:8:{s:4:"slug";s:32:"orders-empty-table-rate-shipping";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:31:"woocommerce-table-rate-shipping";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/table-rate-shipping.svg";s:5:"title";s:19:"Table Rate Shipping";s:4:"copy";s:122:"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/table-rate-shipping/";}i:16;a:8:{s:4:"slug";s:40:"orders-empty-shipping-carrier-extensions";s:7:"context";s:22:"orders-list-empty-body";s:4:"icon";s:118:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipping-carrier-extensions.svg";s:5:"title";s:27:"Shipping Carrier Extensions";s:4:"copy";s:116:"Show live rates from FedEx, UPS, USPS and more directly on your store - never under or overcharge for shipping again";s:11:"button-text";s:13:"Find Carriers";s:8:"promoted";s:26:"category-shipping-carriers";s:3:"url";s:99:"https://woocommerce.com/product-category/woocommerce-extensions/shipping-methods/shipping-carriers/";}i:17;a:8:{s:4:"slug";s:32:"orders-empty-google-product-feed";s:7:"context";s:22:"orders-list-empty-body";s:7:"product";s:25:"woocommerce-product-feeds";s:4:"icon";s:110:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/google-product-feed.svg";s:5:"title";s:19:"Google Product Feed";s:4:"copy";s:76:"Increase sales by letting customers find you when they\'re shopping on Google";s:11:"button-text";s:10:"Learn More";s:3:"url";s:53:"https://woocommerce.com/products/google-product-feed/";}i:18;a:4:{s:4:"slug";s:35:"products-empty-header-product-types";s:7:"context";s:26:"products-list-empty-header";s:5:"title";s:23:"Other types of products";s:13:"allow-dismiss";b:0;}i:19;a:6:{s:4:"slug";s:32:"products-empty-footer-browse-all";s:7:"context";s:26:"products-list-empty-footer";s:9:"link-text";s:21:"Browse all extensions";s:3:"url";s:64:"https://woocommerce.com/product-category/woocommerce-extensions/";s:8:"promoted";s:31:"category-woocommerce-extensions";s:13:"allow-dismiss";b:0;}i:20;a:8:{s:4:"slug";s:30:"products-empty-product-vendors";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-vendors";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-vendors.svg";s:5:"title";s:15:"Product Vendors";s:4:"copy";s:47:"Turn your store into a multi-vendor marketplace";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-vendors/";}i:21;a:8:{s:4:"slug";s:26:"products-empty-memberships";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:23:"woocommerce-memberships";s:4:"icon";s:102:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/memberships.svg";s:5:"title";s:11:"Memberships";s:4:"copy";s:76:"Give members access to restricted content or products, for a fee or for free";s:11:"button-text";s:10:"Learn More";s:3:"url";s:57:"https://woocommerce.com/products/woocommerce-memberships/";}i:22;a:9:{s:4:"slug";s:35:"products-empty-woocommerce-deposits";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-deposits";s:14:"show-if-active";a:1:{i:0;s:20:"woocommerce-bookings";}s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/deposits.svg";s:5:"title";s:8:"Deposits";s:4:"copy";s:75:"Make it easier for customers to pay by offering a deposit or a payment plan";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-deposits/";}i:23;a:8:{s:4:"slug";s:40:"products-empty-woocommerce-subscriptions";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:25:"woocommerce-subscriptions";s:4:"icon";s:104:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscriptions.svg";s:5:"title";s:13:"Subscriptions";s:4:"copy";s:97:"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis";s:11:"button-text";s:10:"Learn More";s:3:"url";s:59:"https://woocommerce.com/products/woocommerce-subscriptions/";}i:24;a:8:{s:4:"slug";s:35:"products-empty-woocommerce-bookings";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:20:"woocommerce-bookings";s:4:"icon";s:99:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/bookings.svg";s:5:"title";s:8:"Bookings";s:4:"copy";s:99:"Allow customers to book appointments, make reservations or rent equipment without leaving your site";s:11:"button-text";s:10:"Learn More";s:3:"url";s:54:"https://woocommerce.com/products/woocommerce-bookings/";}i:25;a:8:{s:4:"slug";s:30:"products-empty-product-bundles";s:7:"context";s:24:"products-list-empty-body";s:7:"product";s:27:"woocommerce-product-bundles";s:4:"icon";s:106:"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-bundles.svg";s:5:"title";s:15:"Product Bundles";s:4:"copy";s:49:"Offer customizable bundles and assembled products";s:11:"button-text";s:10:"Learn More";s:3:"url";s:49:"https://woocommerce.com/products/product-bundles/";}}s:7:"updated";i:1590042415;}', 'no'),
(428, 'pa_size_children', 'a:0:{}', 'yes'),
(430, 'pa_color_children', 'a:0:{}', 'yes') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=756 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 11, '_wp_attached_file', 'woocommerce-placeholder.png'),
(4, 11, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1200;s:6:"height";i:1200;s:4:"file";s:27:"woocommerce-placeholder.png";s:5:"sizes";a:4:{s:6:"medium";a:4:{s:4:"file";s:35:"woocommerce-placeholder-300x300.png";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:37:"woocommerce-placeholder-1024x1024.png";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:9:"image/png";}s:9:"thumbnail";a:4:{s:4:"file";s:35:"woocommerce-placeholder-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:12:"medium_large";a:4:{s:4:"file";s:35:"woocommerce-placeholder-768x768.png";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(5, 12, '_wp_attached_file', '2020/05/sample_products-2.csv'),
(6, 12, '_wp_attachment_context', 'import'),
(87, 19, '_wp_attached_file', '2020/05/sample_products-3.csv'),
(88, 19, '_wp_attachment_context', 'import'),
(89, 20, '_sku', 'woo-vneck-tee'),
(90, 20, 'total_sales', '0'),
(91, 20, '_tax_status', 'taxable'),
(92, 20, '_tax_class', ''),
(93, 20, '_manage_stock', 'no'),
(94, 20, '_backorders', 'no'),
(95, 20, '_sold_individually', 'no'),
(96, 20, '_virtual', 'no'),
(97, 20, '_downloadable', 'no'),
(98, 20, '_download_limit', '0'),
(99, 20, '_download_expiry', '0'),
(100, 20, '_stock', NULL),
(101, 20, '_stock_status', 'instock'),
(102, 20, '_wc_average_rating', '0'),
(103, 20, '_wc_review_count', '0'),
(104, 20, '_product_version', '4.1.1'),
(106, 21, '_sku', 'woo-hoodie'),
(107, 21, 'total_sales', '0'),
(108, 21, '_tax_status', 'taxable'),
(109, 21, '_tax_class', ''),
(110, 21, '_manage_stock', 'no'),
(111, 21, '_backorders', 'no'),
(112, 21, '_sold_individually', 'no'),
(113, 21, '_virtual', 'no'),
(114, 21, '_downloadable', 'no'),
(115, 21, '_download_limit', '0'),
(116, 21, '_download_expiry', '0'),
(117, 21, '_stock', NULL),
(118, 21, '_stock_status', 'instock'),
(119, 21, '_wc_average_rating', '0'),
(120, 21, '_wc_review_count', '0'),
(121, 21, '_product_version', '4.1.1'),
(123, 22, '_sku', 'woo-hoodie-with-logo'),
(124, 22, 'total_sales', '0'),
(125, 22, '_tax_status', 'taxable'),
(126, 22, '_tax_class', ''),
(127, 22, '_manage_stock', 'no'),
(128, 22, '_backorders', 'no'),
(129, 22, '_sold_individually', 'no'),
(130, 22, '_virtual', 'no'),
(131, 22, '_downloadable', 'no'),
(132, 22, '_download_limit', '0'),
(133, 22, '_download_expiry', '0'),
(134, 22, '_stock', NULL),
(135, 22, '_stock_status', 'instock'),
(136, 22, '_wc_average_rating', '0'),
(137, 22, '_wc_review_count', '0'),
(138, 22, '_product_version', '4.1.1'),
(140, 23, '_sku', 'woo-tshirt'),
(141, 23, 'total_sales', '0'),
(142, 23, '_tax_status', 'taxable'),
(143, 23, '_tax_class', ''),
(144, 23, '_manage_stock', 'no'),
(145, 23, '_backorders', 'no'),
(146, 23, '_sold_individually', 'no'),
(147, 23, '_virtual', 'no'),
(148, 23, '_downloadable', 'no'),
(149, 23, '_download_limit', '0'),
(150, 23, '_download_expiry', '0'),
(151, 23, '_stock', NULL),
(152, 23, '_stock_status', 'instock'),
(153, 23, '_wc_average_rating', '0'),
(154, 23, '_wc_review_count', '0'),
(155, 23, '_product_version', '4.1.1'),
(157, 24, '_sku', 'woo-beanie'),
(158, 24, 'total_sales', '0'),
(159, 24, '_tax_status', 'taxable'),
(160, 24, '_tax_class', ''),
(161, 24, '_manage_stock', 'no'),
(162, 24, '_backorders', 'no'),
(163, 24, '_sold_individually', 'no'),
(164, 24, '_virtual', 'no'),
(165, 24, '_downloadable', 'no'),
(166, 24, '_download_limit', '0'),
(167, 24, '_download_expiry', '0'),
(168, 24, '_stock', NULL),
(169, 24, '_stock_status', 'instock'),
(170, 24, '_wc_average_rating', '0'),
(171, 24, '_wc_review_count', '0'),
(172, 24, '_product_version', '4.1.1'),
(174, 25, '_sku', 'woo-belt'),
(175, 25, 'total_sales', '0'),
(176, 25, '_tax_status', 'taxable'),
(177, 25, '_tax_class', ''),
(178, 25, '_manage_stock', 'no'),
(179, 25, '_backorders', 'no'),
(180, 25, '_sold_individually', 'no'),
(181, 25, '_virtual', 'no'),
(182, 25, '_downloadable', 'no'),
(183, 25, '_download_limit', '0'),
(184, 25, '_download_expiry', '0'),
(185, 25, '_stock', NULL) ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(186, 25, '_stock_status', 'instock'),
(187, 25, '_wc_average_rating', '0'),
(188, 25, '_wc_review_count', '0'),
(189, 25, '_product_version', '4.1.1'),
(191, 26, '_sku', 'woo-cap'),
(192, 26, 'total_sales', '0'),
(193, 26, '_tax_status', 'taxable'),
(194, 26, '_tax_class', ''),
(195, 26, '_manage_stock', 'no'),
(196, 26, '_backorders', 'no'),
(197, 26, '_sold_individually', 'no'),
(198, 26, '_virtual', 'no'),
(199, 26, '_downloadable', 'no'),
(200, 26, '_download_limit', '0'),
(201, 26, '_download_expiry', '0'),
(202, 26, '_stock', NULL),
(203, 26, '_stock_status', 'instock'),
(204, 26, '_wc_average_rating', '0'),
(205, 26, '_wc_review_count', '0'),
(206, 26, '_product_version', '4.1.1'),
(208, 27, '_sku', 'woo-sunglasses'),
(209, 27, 'total_sales', '0'),
(210, 27, '_tax_status', 'taxable'),
(211, 27, '_tax_class', ''),
(212, 27, '_manage_stock', 'no'),
(213, 27, '_backorders', 'no'),
(214, 27, '_sold_individually', 'no'),
(215, 27, '_virtual', 'no'),
(216, 27, '_downloadable', 'no'),
(217, 27, '_download_limit', '0'),
(218, 27, '_download_expiry', '0'),
(219, 27, '_stock', NULL),
(220, 27, '_stock_status', 'instock'),
(221, 27, '_wc_average_rating', '0'),
(222, 27, '_wc_review_count', '0'),
(223, 27, '_product_version', '4.1.1'),
(225, 28, '_sku', 'woo-hoodie-with-pocket'),
(226, 28, 'total_sales', '0'),
(227, 28, '_tax_status', 'taxable'),
(228, 28, '_tax_class', ''),
(229, 28, '_manage_stock', 'no'),
(230, 28, '_backorders', 'no'),
(231, 28, '_sold_individually', 'no'),
(232, 28, '_virtual', 'no'),
(233, 28, '_downloadable', 'no'),
(234, 28, '_download_limit', '0'),
(235, 28, '_download_expiry', '0'),
(236, 28, '_stock', NULL),
(237, 28, '_stock_status', 'instock'),
(238, 28, '_wc_average_rating', '0'),
(239, 28, '_wc_review_count', '0'),
(240, 28, '_product_version', '4.1.1'),
(242, 29, '_sku', 'woo-hoodie-with-zipper'),
(243, 29, 'total_sales', '0'),
(244, 29, '_tax_status', 'taxable'),
(245, 29, '_tax_class', ''),
(246, 29, '_manage_stock', 'no'),
(247, 29, '_backorders', 'no'),
(248, 29, '_sold_individually', 'no'),
(249, 29, '_virtual', 'no'),
(250, 29, '_downloadable', 'no'),
(251, 29, '_download_limit', '0'),
(252, 29, '_download_expiry', '0'),
(253, 29, '_stock', NULL),
(254, 29, '_stock_status', 'instock'),
(255, 29, '_wc_average_rating', '0'),
(256, 29, '_wc_review_count', '0'),
(257, 29, '_product_version', '4.1.1'),
(259, 30, '_sku', 'woo-long-sleeve-tee'),
(260, 30, 'total_sales', '0'),
(261, 30, '_tax_status', 'taxable'),
(262, 30, '_tax_class', ''),
(263, 30, '_manage_stock', 'no'),
(264, 30, '_backorders', 'no'),
(265, 30, '_sold_individually', 'no'),
(266, 30, '_virtual', 'no'),
(267, 30, '_downloadable', 'no'),
(268, 30, '_download_limit', '0'),
(269, 30, '_download_expiry', '0'),
(270, 30, '_stock', NULL),
(271, 30, '_stock_status', 'instock'),
(272, 30, '_wc_average_rating', '0'),
(273, 30, '_wc_review_count', '0'),
(274, 30, '_product_version', '4.1.1'),
(276, 31, '_sku', 'woo-polo'),
(277, 31, 'total_sales', '0'),
(278, 31, '_tax_status', 'taxable'),
(279, 31, '_tax_class', ''),
(280, 31, '_manage_stock', 'no'),
(281, 31, '_backorders', 'no'),
(282, 31, '_sold_individually', 'no'),
(283, 31, '_virtual', 'no'),
(284, 31, '_downloadable', 'no'),
(285, 31, '_download_limit', '0'),
(286, 31, '_download_expiry', '0'),
(287, 31, '_stock', NULL),
(288, 31, '_stock_status', 'instock'),
(289, 31, '_wc_average_rating', '0'),
(290, 31, '_wc_review_count', '0'),
(291, 31, '_product_version', '4.1.1') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(293, 32, '_sku', 'woo-album'),
(294, 32, 'total_sales', '0'),
(295, 32, '_tax_status', 'taxable'),
(296, 32, '_tax_class', ''),
(297, 32, '_manage_stock', 'no'),
(298, 32, '_backorders', 'no'),
(299, 32, '_sold_individually', 'no'),
(300, 32, '_virtual', 'yes'),
(301, 32, '_downloadable', 'yes'),
(302, 32, '_download_limit', '1'),
(303, 32, '_download_expiry', '1'),
(304, 32, '_stock', NULL),
(305, 32, '_stock_status', 'instock'),
(306, 32, '_wc_average_rating', '0'),
(307, 32, '_wc_review_count', '0'),
(308, 32, '_product_version', '4.1.1'),
(310, 33, '_sku', 'woo-single'),
(311, 33, 'total_sales', '0'),
(312, 33, '_tax_status', 'taxable'),
(313, 33, '_tax_class', ''),
(314, 33, '_manage_stock', 'no'),
(315, 33, '_backorders', 'no'),
(316, 33, '_sold_individually', 'no'),
(317, 33, '_virtual', 'yes'),
(318, 33, '_downloadable', 'yes'),
(319, 33, '_download_limit', '1'),
(320, 33, '_download_expiry', '1'),
(321, 33, '_stock', NULL),
(322, 33, '_stock_status', 'instock'),
(323, 33, '_wc_average_rating', '0'),
(324, 33, '_wc_review_count', '0'),
(325, 33, '_product_version', '4.1.1'),
(327, 34, '_sku', 'woo-vneck-tee-red'),
(328, 34, 'total_sales', '0'),
(329, 34, '_tax_status', 'taxable'),
(330, 34, '_tax_class', ''),
(331, 34, '_manage_stock', 'no'),
(332, 34, '_backorders', 'no'),
(333, 34, '_sold_individually', 'no'),
(334, 34, '_virtual', 'no'),
(335, 34, '_downloadable', 'no'),
(336, 34, '_download_limit', '0'),
(337, 34, '_download_expiry', '0'),
(338, 34, '_stock', NULL),
(339, 34, '_stock_status', 'instock'),
(340, 34, '_wc_average_rating', '0'),
(341, 34, '_wc_review_count', '0'),
(342, 34, '_product_version', '4.1.1'),
(344, 35, '_sku', 'woo-vneck-tee-green'),
(345, 35, 'total_sales', '0'),
(346, 35, '_tax_status', 'taxable'),
(347, 35, '_tax_class', ''),
(348, 35, '_manage_stock', 'no'),
(349, 35, '_backorders', 'no'),
(350, 35, '_sold_individually', 'no'),
(351, 35, '_virtual', 'no'),
(352, 35, '_downloadable', 'no'),
(353, 35, '_download_limit', '0'),
(354, 35, '_download_expiry', '0'),
(355, 35, '_stock', NULL),
(356, 35, '_stock_status', 'instock'),
(357, 35, '_wc_average_rating', '0'),
(358, 35, '_wc_review_count', '0'),
(359, 35, '_product_version', '4.1.1'),
(361, 36, '_sku', 'woo-vneck-tee-blue'),
(362, 36, 'total_sales', '0'),
(363, 36, '_tax_status', 'taxable'),
(364, 36, '_tax_class', ''),
(365, 36, '_manage_stock', 'no'),
(366, 36, '_backorders', 'no'),
(367, 36, '_sold_individually', 'no'),
(368, 36, '_virtual', 'no'),
(369, 36, '_downloadable', 'no'),
(370, 36, '_download_limit', '0'),
(371, 36, '_download_expiry', '0'),
(372, 36, '_stock', NULL),
(373, 36, '_stock_status', 'instock'),
(374, 36, '_wc_average_rating', '0'),
(375, 36, '_wc_review_count', '0'),
(376, 36, '_product_version', '4.1.1'),
(378, 37, '_sku', 'woo-hoodie-red'),
(379, 37, 'total_sales', '0'),
(380, 37, '_tax_status', 'taxable'),
(381, 37, '_tax_class', ''),
(382, 37, '_manage_stock', 'no'),
(383, 37, '_backorders', 'no'),
(384, 37, '_sold_individually', 'no'),
(385, 37, '_virtual', 'no'),
(386, 37, '_downloadable', 'no'),
(387, 37, '_download_limit', '0'),
(388, 37, '_download_expiry', '0'),
(389, 37, '_stock', NULL),
(390, 37, '_stock_status', 'instock'),
(391, 37, '_wc_average_rating', '0'),
(392, 37, '_wc_review_count', '0'),
(393, 37, '_product_version', '4.1.1'),
(395, 38, '_sku', 'woo-hoodie-green'),
(396, 38, 'total_sales', '0'),
(397, 38, '_tax_status', 'taxable'),
(398, 38, '_tax_class', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(399, 38, '_manage_stock', 'no'),
(400, 38, '_backorders', 'no'),
(401, 38, '_sold_individually', 'no'),
(402, 38, '_virtual', 'no'),
(403, 38, '_downloadable', 'no'),
(404, 38, '_download_limit', '0'),
(405, 38, '_download_expiry', '0'),
(406, 38, '_stock', NULL),
(407, 38, '_stock_status', 'instock'),
(408, 38, '_wc_average_rating', '0'),
(409, 38, '_wc_review_count', '0'),
(410, 38, '_product_version', '4.1.1'),
(412, 39, '_sku', 'woo-hoodie-blue'),
(413, 39, 'total_sales', '0'),
(414, 39, '_tax_status', 'taxable'),
(415, 39, '_tax_class', ''),
(416, 39, '_manage_stock', 'no'),
(417, 39, '_backorders', 'no'),
(418, 39, '_sold_individually', 'no'),
(419, 39, '_virtual', 'no'),
(420, 39, '_downloadable', 'no'),
(421, 39, '_download_limit', '0'),
(422, 39, '_download_expiry', '0'),
(423, 39, '_stock', NULL),
(424, 39, '_stock_status', 'instock'),
(425, 39, '_wc_average_rating', '0'),
(426, 39, '_wc_review_count', '0'),
(427, 39, '_product_version', '4.1.1'),
(429, 40, '_sku', 'Woo-tshirt-logo'),
(430, 40, 'total_sales', '0'),
(431, 40, '_tax_status', 'taxable'),
(432, 40, '_tax_class', ''),
(433, 40, '_manage_stock', 'no'),
(434, 40, '_backorders', 'no'),
(435, 40, '_sold_individually', 'no'),
(436, 40, '_virtual', 'no'),
(437, 40, '_downloadable', 'no'),
(438, 40, '_download_limit', '0'),
(439, 40, '_download_expiry', '0'),
(440, 40, '_stock', NULL),
(441, 40, '_stock_status', 'instock'),
(442, 40, '_wc_average_rating', '0'),
(443, 40, '_wc_review_count', '0'),
(444, 40, '_product_version', '4.1.1'),
(446, 41, '_sku', 'Woo-beanie-logo'),
(447, 41, 'total_sales', '0'),
(448, 41, '_tax_status', 'taxable'),
(449, 41, '_tax_class', ''),
(450, 41, '_manage_stock', 'no'),
(451, 41, '_backorders', 'no'),
(452, 41, '_sold_individually', 'no'),
(453, 41, '_virtual', 'no'),
(454, 41, '_downloadable', 'no'),
(455, 41, '_download_limit', '0'),
(456, 41, '_download_expiry', '0'),
(457, 41, '_stock', NULL),
(458, 41, '_stock_status', 'instock'),
(459, 41, '_wc_average_rating', '0'),
(460, 41, '_wc_review_count', '0'),
(461, 41, '_product_version', '4.1.1'),
(463, 42, '_sku', 'logo-collection'),
(464, 42, 'total_sales', '0'),
(465, 42, '_tax_status', 'taxable'),
(466, 42, '_tax_class', ''),
(467, 42, '_manage_stock', 'no'),
(468, 42, '_backorders', 'no'),
(469, 42, '_sold_individually', 'no'),
(470, 42, '_virtual', 'no'),
(471, 42, '_downloadable', 'no'),
(472, 42, '_download_limit', '0'),
(473, 42, '_download_expiry', '0'),
(474, 42, '_stock', NULL),
(475, 42, '_stock_status', 'instock'),
(476, 42, '_wc_average_rating', '0'),
(477, 42, '_wc_review_count', '0'),
(478, 42, '_product_version', '4.1.1'),
(480, 43, '_sku', 'wp-pennant'),
(481, 43, 'total_sales', '0'),
(482, 43, '_tax_status', 'taxable'),
(483, 43, '_tax_class', ''),
(484, 43, '_manage_stock', 'no'),
(485, 43, '_backorders', 'no'),
(486, 43, '_sold_individually', 'no'),
(487, 43, '_virtual', 'no'),
(488, 43, '_downloadable', 'no'),
(489, 43, '_download_limit', '0'),
(490, 43, '_download_expiry', '0'),
(491, 43, '_stock', NULL),
(492, 43, '_stock_status', 'instock'),
(493, 43, '_wc_average_rating', '0'),
(494, 43, '_wc_review_count', '0'),
(495, 43, '_product_version', '4.1.1'),
(497, 44, '_sku', 'woo-hoodie-blue-logo'),
(498, 44, 'total_sales', '0'),
(499, 44, '_tax_status', 'taxable'),
(500, 44, '_tax_class', ''),
(501, 44, '_manage_stock', 'no'),
(502, 44, '_backorders', 'no'),
(503, 44, '_sold_individually', 'no'),
(504, 44, '_virtual', 'no') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(505, 44, '_downloadable', 'no'),
(506, 44, '_download_limit', '0'),
(507, 44, '_download_expiry', '0'),
(508, 44, '_stock', NULL),
(509, 44, '_stock_status', 'instock'),
(510, 44, '_wc_average_rating', '0'),
(511, 44, '_wc_review_count', '0'),
(512, 44, '_product_version', '4.1.1'),
(514, 45, '_wp_attached_file', '2020/05/vneck-tee-2-2.jpg'),
(515, 45, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:25:"2020/05/vneck-tee-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:25:"vneck-tee-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:25:"vneck-tee-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:25:"vneck-tee-2-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:25:"vneck-tee-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:25:"vneck-tee-2-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:25:"vneck-tee-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:25:"vneck-tee-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:25:"vneck-tee-2-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:25:"vneck-tee-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(516, 45, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vneck-tee-2.jpg'),
(517, 46, '_wp_attached_file', '2020/05/vnech-tee-green-1-2.jpg'),
(518, 46, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:31:"2020/05/vnech-tee-green-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:31:"vnech-tee-green-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:31:"vnech-tee-green-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(519, 46, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-green-1.jpg'),
(520, 47, '_wp_attached_file', '2020/05/vnech-tee-blue-1-2.jpg'),
(521, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:30:"2020/05/vnech-tee-blue-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:30:"vnech-tee-blue-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:30:"vnech-tee-blue-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(522, 47, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-blue-1.jpg'),
(523, 20, '_wpcom_is_markdown', '1'),
(524, 20, '_wp_old_slug', 'import-placeholder-for-44'),
(525, 20, '_product_image_gallery', '46,47'),
(526, 20, '_thumbnail_id', '45'),
(527, 20, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:7:"pa_size";a:6:{s:4:"name";s:7:"pa_size";s:5:"value";s:0:"";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}}'),
(528, 48, '_wp_attached_file', '2020/05/hoodie-2-2.jpg'),
(529, 48, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:22:"2020/05/hoodie-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:22:"hoodie-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:22:"hoodie-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"hoodie-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:22:"hoodie-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:22:"hoodie-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:22:"hoodie-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:22:"hoodie-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:22:"hoodie-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:22:"hoodie-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(530, 48, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-2.jpg'),
(531, 49, '_wp_attached_file', '2020/05/hoodie-blue-1-2.jpg'),
(532, 49, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:27:"2020/05/hoodie-blue-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:27:"hoodie-blue-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:27:"hoodie-blue-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(533, 49, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-blue-1.jpg'),
(534, 50, '_wp_attached_file', '2020/05/hoodie-green-1-2.jpg'),
(535, 50, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:28:"2020/05/hoodie-green-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:28:"hoodie-green-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:28:"hoodie-green-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:28:"hoodie-green-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:28:"hoodie-green-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:28:"hoodie-green-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:28:"hoodie-green-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:28:"hoodie-green-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:28:"hoodie-green-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:28:"hoodie-green-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(536, 50, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-green-1.jpg'),
(537, 51, '_wp_attached_file', '2020/05/hoodie-with-logo-2-2.jpg'),
(538, 51, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:32:"2020/05/hoodie-with-logo-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"hoodie-with-logo-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"hoodie-with-logo-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(539, 51, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-logo-2.jpg'),
(540, 21, '_wpcom_is_markdown', '1'),
(541, 21, '_wp_old_slug', 'import-placeholder-for-45'),
(542, 21, '_product_image_gallery', '49,50,51'),
(543, 21, '_thumbnail_id', '48'),
(544, 21, '_product_attributes', 'a:2:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"1";}s:4:"logo";a:6:{s:4:"name";s:4:"Logo";s:5:"value";s:8:"Yes | No";s:8:"position";s:1:"1";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"1";s:11:"is_taxonomy";s:1:"0";}}'),
(545, 22, '_wpcom_is_markdown', '1'),
(546, 22, '_wp_old_slug', 'import-placeholder-for-46'),
(547, 22, '_regular_price', '45'),
(548, 22, '_thumbnail_id', '51'),
(549, 22, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(550, 22, '_price', '45'),
(551, 52, '_wp_attached_file', '2020/05/tshirt-2-2.jpg'),
(552, 52, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:22:"2020/05/tshirt-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:22:"tshirt-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:22:"tshirt-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"tshirt-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:22:"tshirt-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:22:"tshirt-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:22:"tshirt-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:22:"tshirt-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:22:"tshirt-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:22:"tshirt-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(553, 52, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/tshirt-2.jpg'),
(554, 23, '_wpcom_is_markdown', '1'),
(555, 23, '_wp_old_slug', 'import-placeholder-for-47'),
(556, 23, '_regular_price', '18'),
(557, 23, '_thumbnail_id', '52'),
(558, 23, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(559, 23, '_price', '18'),
(560, 53, '_wp_attached_file', '2020/05/beanie-2-2.jpg'),
(561, 53, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:22:"2020/05/beanie-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:22:"beanie-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:22:"beanie-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"beanie-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:22:"beanie-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:22:"beanie-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:22:"beanie-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:22:"beanie-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:22:"beanie-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:22:"beanie-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(562, 53, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-2.jpg'),
(563, 24, '_wpcom_is_markdown', '1'),
(564, 24, '_wp_old_slug', 'import-placeholder-for-48'),
(565, 24, '_regular_price', '20'),
(566, 24, '_sale_price', '18'),
(567, 24, '_thumbnail_id', '53'),
(568, 24, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(569, 24, '_price', '18'),
(570, 54, '_wp_attached_file', '2020/05/belt-2-2.jpg'),
(571, 54, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:20:"2020/05/belt-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"belt-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"belt-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"belt-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"belt-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"belt-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"belt-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"belt-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"belt-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"belt-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(572, 54, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/belt-2.jpg'),
(573, 25, '_wpcom_is_markdown', '1'),
(574, 25, '_wp_old_slug', 'import-placeholder-for-58'),
(575, 25, '_regular_price', '65'),
(576, 25, '_sale_price', '55'),
(577, 25, '_thumbnail_id', '54'),
(578, 25, '_price', '55'),
(579, 55, '_wp_attached_file', '2020/05/cap-2-2.jpg'),
(580, 55, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:19:"2020/05/cap-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:19:"cap-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:19:"cap-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:19:"cap-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:19:"cap-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:19:"cap-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:19:"cap-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:19:"cap-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:19:"cap-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:19:"cap-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(581, 55, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/cap-2.jpg'),
(582, 26, '_wpcom_is_markdown', '1'),
(583, 26, '_wp_old_slug', 'import-placeholder-for-60'),
(584, 26, '_regular_price', '18'),
(585, 26, '_sale_price', '16'),
(586, 26, '_thumbnail_id', '55'),
(587, 26, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(588, 26, '_price', '16'),
(589, 56, '_wp_attached_file', '2020/05/sample_products-4.csv'),
(590, 56, '_wp_attachment_context', 'import'),
(591, 57, '_wp_attached_file', '2020/05/sunglasses-2-2.jpg'),
(592, 57, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:26:"2020/05/sunglasses-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:26:"sunglasses-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:26:"sunglasses-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:26:"sunglasses-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:26:"sunglasses-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:26:"sunglasses-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:26:"sunglasses-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:26:"sunglasses-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:26:"sunglasses-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:26:"sunglasses-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(593, 57, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/sunglasses-2.jpg'),
(594, 27, '_wpcom_is_markdown', '1'),
(595, 27, '_wp_old_slug', 'import-placeholder-for-62'),
(596, 27, '_regular_price', '90'),
(597, 27, '_thumbnail_id', '57'),
(598, 27, '_price', '90'),
(599, 58, '_wp_attached_file', '2020/05/hoodie-with-pocket-2-2.jpg'),
(600, 58, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:34:"2020/05/hoodie-with-pocket-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:34:"hoodie-with-pocket-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-pocket-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(601, 58, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-pocket-2.jpg'),
(602, 28, '_wpcom_is_markdown', '1'),
(603, 28, '_wp_old_slug', 'import-placeholder-for-64'),
(604, 28, '_regular_price', '45'),
(605, 28, '_sale_price', '35') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(606, 28, '_thumbnail_id', '58'),
(607, 28, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(608, 28, '_price', '35'),
(609, 59, '_wp_attached_file', '2020/05/hoodie-with-zipper-2-2.jpg'),
(610, 59, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:34:"2020/05/hoodie-with-zipper-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:34:"hoodie-with-zipper-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:34:"hoodie-with-zipper-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(611, 59, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-zipper-2.jpg'),
(612, 29, '_wpcom_is_markdown', '1'),
(613, 29, '_wp_old_slug', 'import-placeholder-for-66'),
(614, 29, '_regular_price', '45'),
(615, 29, '_thumbnail_id', '59'),
(616, 29, '_price', '45'),
(617, 60, '_wp_attached_file', '2020/05/long-sleeve-tee-2-2.jpg'),
(618, 60, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:801;s:4:"file";s:31:"2020/05/long-sleeve-tee-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:31:"long-sleeve-tee-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:31:"long-sleeve-tee-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(619, 60, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/long-sleeve-tee-2.jpg'),
(620, 30, '_wpcom_is_markdown', '1'),
(621, 30, '_wp_old_slug', 'import-placeholder-for-68'),
(622, 30, '_regular_price', '25'),
(623, 30, '_thumbnail_id', '60'),
(624, 30, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(625, 30, '_price', '25'),
(626, 61, '_wp_attached_file', '2020/05/polo-2-2.jpg'),
(627, 61, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:801;s:6:"height";i:800;s:4:"file";s:20:"2020/05/polo-2-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"polo-2-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"polo-2-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"polo-2-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"polo-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"polo-2-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"polo-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"polo-2-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"polo-2-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"polo-2-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(628, 61, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/polo-2.jpg'),
(629, 31, '_wpcom_is_markdown', '1'),
(630, 31, '_wp_old_slug', 'import-placeholder-for-70'),
(631, 31, '_regular_price', '20'),
(632, 31, '_thumbnail_id', '61'),
(633, 31, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(634, 31, '_price', '20'),
(635, 62, '_wp_attached_file', '2020/05/album-1-2.jpg'),
(636, 62, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:21:"2020/05/album-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:21:"album-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:21:"album-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:21:"album-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:21:"album-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:21:"album-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:21:"album-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:21:"album-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:21:"album-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:21:"album-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(637, 62, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/album-1.jpg'),
(638, 32, '_wpcom_is_markdown', '1'),
(639, 32, '_wp_old_slug', 'import-placeholder-for-73'),
(640, 32, '_regular_price', '15'),
(641, 32, '_thumbnail_id', '62'),
(642, 32, '_downloadable_files', 'a:2:{s:36:"a756d248-3c50-4426-bea3-2b77e1ef0dd4";a:3:{s:2:"id";s:36:"a756d248-3c50-4426-bea3-2b77e1ef0dd4";s:4:"name";s:8:"Single 1";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}s:36:"2bb86c62-16c7-4b28-83ec-3a20b3fae08b";a:3:{s:2:"id";s:36:"2bb86c62-16c7-4b28-83ec-3a20b3fae08b";s:4:"name";s:8:"Single 2";s:4:"file";s:84:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/album.jpg";}}'),
(643, 32, '_price', '15'),
(644, 63, '_wp_attached_file', '2020/05/single-1-2.jpg'),
(645, 63, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:22:"2020/05/single-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:22:"single-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:22:"single-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:22:"single-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:22:"single-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:22:"single-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:22:"single-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:22:"single-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:22:"single-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:22:"single-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(646, 63, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/single-1.jpg'),
(647, 33, '_wpcom_is_markdown', '1'),
(648, 33, '_wp_old_slug', 'import-placeholder-for-75'),
(649, 33, '_regular_price', '3'),
(650, 33, '_sale_price', '2'),
(651, 33, '_thumbnail_id', '63'),
(652, 33, '_downloadable_files', 'a:1:{s:36:"99c901c5-b72e-4a9d-94b1-55c371fe0a4c";a:3:{s:2:"id";s:36:"99c901c5-b72e-4a9d-94b1-55c371fe0a4c";s:4:"name";s:6:"Single";s:4:"file";s:85:"https://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2017/08/single.jpg";}}'),
(653, 33, '_price', '2'),
(654, 34, '_wpcom_is_markdown', ''),
(655, 34, '_wp_old_slug', 'import-placeholder-for-76'),
(656, 34, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(657, 34, '_regular_price', '20'),
(658, 34, '_thumbnail_id', '45'),
(659, 34, 'attribute_pa_color', 'red'),
(660, 34, 'attribute_pa_size', ''),
(661, 34, '_price', '20'),
(662, 35, '_wpcom_is_markdown', ''),
(663, 35, '_wp_old_slug', 'import-placeholder-for-77'),
(664, 35, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(665, 35, '_regular_price', '20'),
(666, 35, '_thumbnail_id', '46'),
(667, 35, 'attribute_pa_color', 'green'),
(668, 35, 'attribute_pa_size', ''),
(669, 35, '_price', '20'),
(670, 36, '_wpcom_is_markdown', ''),
(671, 36, '_wp_old_slug', 'import-placeholder-for-78'),
(672, 36, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(673, 36, '_regular_price', '15'),
(674, 36, '_thumbnail_id', '47'),
(675, 36, 'attribute_pa_color', 'blue'),
(676, 36, 'attribute_pa_size', ''),
(677, 36, '_price', '15'),
(678, 37, '_wpcom_is_markdown', ''),
(679, 37, '_wp_old_slug', 'import-placeholder-for-79'),
(680, 37, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(681, 37, '_regular_price', '45'),
(682, 37, '_sale_price', '42'),
(683, 37, '_thumbnail_id', '48'),
(684, 37, 'attribute_pa_color', 'red'),
(685, 37, 'attribute_logo', 'No'),
(686, 37, '_price', '42'),
(687, 38, '_wpcom_is_markdown', ''),
(688, 38, '_wp_old_slug', 'import-placeholder-for-80'),
(689, 38, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(690, 38, '_regular_price', '45'),
(691, 38, '_thumbnail_id', '50'),
(692, 38, 'attribute_pa_color', 'green'),
(693, 38, 'attribute_logo', 'No'),
(694, 38, '_price', '45'),
(695, 39, '_wpcom_is_markdown', ''),
(696, 39, '_wp_old_slug', 'import-placeholder-for-81'),
(697, 39, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(698, 39, '_regular_price', '45'),
(699, 39, '_thumbnail_id', '49'),
(700, 39, 'attribute_pa_color', 'blue'),
(701, 39, 'attribute_logo', 'No'),
(702, 39, '_price', '45'),
(703, 64, '_wp_attached_file', '2020/05/t-shirt-with-logo-1-2.jpg'),
(704, 64, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:33:"2020/05/t-shirt-with-logo-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:33:"t-shirt-with-logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:33:"t-shirt-with-logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(705, 64, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/t-shirt-with-logo-1.jpg') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(706, 40, '_wpcom_is_markdown', '1'),
(707, 40, '_wp_old_slug', 'import-placeholder-for-83'),
(708, 40, '_regular_price', '18'),
(709, 40, '_thumbnail_id', '64'),
(710, 40, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(711, 40, '_price', '18'),
(712, 65, '_wp_attached_file', '2020/05/beanie-with-logo-1-2.jpg'),
(713, 65, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:32:"2020/05/beanie-with-logo-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:32:"beanie-with-logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:32:"beanie-with-logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(714, 65, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-with-logo-1.jpg'),
(715, 41, '_wpcom_is_markdown', '1'),
(716, 41, '_wp_old_slug', 'import-placeholder-for-85'),
(717, 41, '_regular_price', '20'),
(718, 41, '_sale_price', '18'),
(719, 41, '_thumbnail_id', '65'),
(720, 41, '_product_attributes', 'a:1:{s:8:"pa_color";a:6:{s:4:"name";s:8:"pa_color";s:5:"value";s:0:"";s:8:"position";s:1:"0";s:10:"is_visible";s:1:"1";s:12:"is_variation";s:1:"0";s:11:"is_taxonomy";s:1:"1";}}'),
(721, 41, '_price', '18'),
(722, 66, '_wp_attached_file', '2020/05/logo-1-2.jpg'),
(723, 66, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:799;s:4:"file";s:20:"2020/05/logo-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:20:"logo-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:20:"logo-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:20:"logo-1-2-768x767.jpg";s:5:"width";i:768;s:6:"height";i:767;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:20:"logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:20:"logo-1-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:20:"logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:20:"logo-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:20:"logo-1-2-600x599.jpg";s:5:"width";i:600;s:6:"height";i:599;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:20:"logo-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(724, 66, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/logo-1.jpg'),
(725, 42, '_wpcom_is_markdown', '1'),
(726, 42, '_wp_old_slug', 'import-placeholder-for-87'),
(727, 42, '_children', 'a:3:{i:0;i:22;i:1;i:23;i:2;i:24;}'),
(728, 42, '_product_image_gallery', '65,64,51'),
(729, 42, '_thumbnail_id', '66'),
(730, 42, '_price', '18'),
(731, 42, '_price', '45'),
(732, 20, '_price', '15'),
(733, 20, '_price', '20'),
(736, 67, '_wp_attached_file', '2020/05/pennant-1-2.jpg'),
(737, 67, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:800;s:6:"height";i:800;s:4:"file";s:23:"2020/05/pennant-1-2.jpg";s:5:"sizes";a:9:{s:6:"medium";a:4:{s:4:"file";s:23:"pennant-1-2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:9:"thumbnail";a:4:{s:4:"file";s:23:"pennant-1-2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:23:"pennant-1-2-768x768.jpg";s:5:"width";i:768;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:21:"woocommerce_thumbnail";a:5:{s:4:"file";s:23:"pennant-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";s:9:"uncropped";b:0;}s:18:"woocommerce_single";a:4:{s:4:"file";s:23:"pennant-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:29:"woocommerce_gallery_thumbnail";a:4:{s:4:"file";s:23:"pennant-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:23:"pennant-1-2-450x450.jpg";s:5:"width";i:450;s:6:"height";i:450;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:23:"pennant-1-2-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:23:"pennant-1-2-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(738, 67, '_wc_attachment_source', 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/pennant-1.jpg'),
(739, 43, '_wpcom_is_markdown', '1'),
(740, 43, '_wp_old_slug', 'import-placeholder-for-89'),
(741, 43, '_regular_price', '11.05'),
(742, 43, '_thumbnail_id', '67'),
(743, 43, '_product_url', 'https://mercantile.wordpress.org/product/wordpress-pennant/'),
(744, 43, '_button_text', 'Buy on the WordPress swag store!'),
(745, 43, '_price', '11.05'),
(746, 44, '_wpcom_is_markdown', ''),
(747, 44, '_wp_old_slug', 'import-placeholder-for-90'),
(748, 44, '_variation_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.'),
(749, 44, '_regular_price', '45'),
(750, 44, '_thumbnail_id', '51'),
(751, 44, 'attribute_pa_color', 'blue'),
(752, 44, 'attribute_logo', 'Yes'),
(753, 44, '_price', '45'),
(754, 21, '_price', '42'),
(755, 21, '_price', '45') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-04-17 13:35:07', '2020-04-17 13:35:07', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-04-17 13:35:07', '2020-04-17 13:35:07', '', 0, 'http://localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2020-04-17 13:35:07', '2020-04-17 13:35:07', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-04-17 13:35:07', '2020-04-17 13:35:07', '', 0, 'http://localhost/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-04-17 13:35:07', '2020-04-17 13:35:07', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://localhost.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-04-17 13:35:07', '2020-04-17 13:35:07', '', 0, 'http://localhost/?page_id=3', 0, 'page', '', 0),
(10, 1, '2020-05-21 06:25:01', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-05-21 06:25:01', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=10', 0, 'post', '', 0),
(11, 1, '2020-05-21 06:25:46', '2020-05-21 06:25:46', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-05-21 06:25:46', '2020-05-21 06:25:46', '', 0, 'http://localhost/wp-content/uploads/2020/05/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(12, 1, '2020-05-21 06:26:34', '2020-05-21 06:26:34', 'http://localhost/wp-content/uploads/2020/05/sample_products-2.csv', 'sample_products-2.csv', '', 'private', 'open', 'closed', '', 'sample_products-2-csv', '', '', '2020-05-21 06:26:34', '2020-05-21 06:26:34', '', 0, 'http://localhost/wp-content/uploads/2020/05/sample_products-2.csv', 0, 'attachment', 'text/csv', 0),
(18, 1, '2020-05-21 06:26:59', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2020-05-21 06:26:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/?post_type=product&p=18', 0, 'product', '', 0),
(19, 1, '2020-05-21 06:27:08', '2020-05-21 06:27:08', 'http://localhost/wp-content/uploads/2020/05/sample_products-3.csv', 'sample_products-3.csv', '', 'private', 'open', 'closed', '', 'sample_products-3-csv', '', '', '2020-05-21 06:27:08', '2020-05-21 06:27:08', '', 0, 'http://localhost/wp-content/uploads/2020/05/sample_products-3.csv', 0, 'attachment', 'text/csv', 0),
(20, 1, '2020-05-21 06:27:13', '2020-05-21 06:27:13', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'V-Neck T-Shirt', 'This is a variable product.', 'publish', 'open', 'closed', '', 'v-neck-t-shirt', '', '', '2020-05-21 06:30:01', '2020-05-21 06:30:01', '', 0, 'http://localhost/product/import-placeholder-for-44/', 0, 'product', '', 0),
(21, 1, '2020-05-21 06:27:13', '2020-05-21 06:27:13', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie', 'This is a variable product.', 'publish', 'open', 'closed', '', 'hoodie', '', '', '2020-05-21 06:30:03', '2020-05-21 06:30:03', '', 0, 'http://localhost/product/import-placeholder-for-45/', 0, 'product', '', 0),
(22, 1, '2020-05-21 06:27:14', '2020-05-21 06:27:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-logo', '', '', '2020-05-21 06:27:34', '2020-05-21 06:27:34', '', 0, 'http://localhost/product/import-placeholder-for-46/', 0, 'product', '', 0),
(23, 1, '2020-05-21 06:27:14', '2020-05-21 06:27:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt', '', '', '2020-05-21 06:27:35', '2020-05-21 06:27:35', '', 0, 'http://localhost/product/import-placeholder-for-47/', 0, 'product', '', 0),
(24, 1, '2020-05-21 06:27:14', '2020-05-21 06:27:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie', '', '', '2020-05-21 06:27:37', '2020-05-21 06:27:37', '', 0, 'http://localhost/product/import-placeholder-for-48/', 0, 'product', '', 0),
(25, 1, '2020-05-21 06:27:14', '2020-05-21 06:27:14', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Belt', 'This is a simple product.', 'publish', 'open', 'closed', '', 'belt', '', '', '2020-05-21 06:27:39', '2020-05-21 06:27:39', '', 0, 'http://localhost/product/import-placeholder-for-58/', 0, 'product', '', 0),
(26, 1, '2020-05-21 06:27:15', '2020-05-21 06:27:15', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Cap', 'This is a simple product.', 'publish', 'open', 'closed', '', 'cap', '', '', '2020-05-21 06:27:41', '2020-05-21 06:27:41', '', 0, 'http://localhost/product/import-placeholder-for-60/', 0, 'product', '', 0),
(27, 1, '2020-05-21 06:27:15', '2020-05-21 06:27:15', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Sunglasses', 'This is a simple product.', 'publish', 'open', 'closed', '', 'sunglasses', '', '', '2020-05-21 06:29:41', '2020-05-21 06:29:41', '', 0, 'http://localhost/product/import-placeholder-for-62/', 0, 'product', '', 0),
(28, 1, '2020-05-21 06:27:15', '2020-05-21 06:27:15', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Pocket', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-pocket', '', '', '2020-05-21 06:29:43', '2020-05-21 06:29:43', '', 0, 'http://localhost/product/import-placeholder-for-64/', 0, 'product', '', 0),
(29, 1, '2020-05-21 06:27:15', '2020-05-21 06:27:15', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Hoodie with Zipper', 'This is a simple product.', 'publish', 'open', 'closed', '', 'hoodie-with-zipper', '', '', '2020-05-21 06:29:45', '2020-05-21 06:29:45', '', 0, 'http://localhost/product/import-placeholder-for-66/', 0, 'product', '', 0),
(30, 1, '2020-05-21 06:27:16', '2020-05-21 06:27:16', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Long Sleeve Tee', 'This is a simple product.', 'publish', 'open', 'closed', '', 'long-sleeve-tee', '', '', '2020-05-21 06:29:46', '2020-05-21 06:29:46', '', 0, 'http://localhost/product/import-placeholder-for-68/', 0, 'product', '', 0),
(31, 1, '2020-05-21 06:27:16', '2020-05-21 06:27:16', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Polo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'polo', '', '', '2020-05-21 06:29:48', '2020-05-21 06:29:48', '', 0, 'http://localhost/product/import-placeholder-for-70/', 0, 'product', '', 0),
(32, 1, '2020-05-21 06:27:16', '2020-05-21 06:27:16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Album', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'album', '', '', '2020-05-21 06:29:50', '2020-05-21 06:29:50', '', 0, 'http://localhost/product/import-placeholder-for-73/', 0, 'product', '', 0),
(33, 1, '2020-05-21 06:27:16', '2020-05-21 06:27:16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sagittis orci ac odio dictum tincidunt. Donec ut metus leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed luctus, dui eu sagittis sodales, nulla nibh sagittis augue, vel porttitor diam enim non metus. Vestibulum aliquam augue neque. Phasellus tincidunt odio eget ullamcorper efficitur. Cras placerat ut turpis pellentesque vulputate. Nam sed consequat tortor. Curabitur finibus sapien dolor. Ut eleifend tellus nec erat pulvinar dignissim. Nam non arcu purus. Vivamus et massa massa.', 'Single', 'This is a simple, virtual product.', 'publish', 'open', 'closed', '', 'single', '', '', '2020-05-21 06:29:53', '2020-05-21 06:29:53', '', 0, 'http://localhost/product/import-placeholder-for-75/', 0, 'product', '', 0),
(34, 1, '2020-05-21 06:27:17', '2020-05-21 06:27:17', '', 'V-Neck T-Shirt - Red', 'Color: Red', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-red', '', '', '2020-05-21 06:29:53', '2020-05-21 06:29:53', '', 20, 'http://localhost/product/import-placeholder-for-76/', 0, 'product_variation', '', 0),
(35, 1, '2020-05-21 06:27:17', '2020-05-21 06:27:17', '', 'V-Neck T-Shirt - Green', 'Color: Green', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-green', '', '', '2020-05-21 06:29:53', '2020-05-21 06:29:53', '', 20, 'http://localhost/product/import-placeholder-for-77/', 0, 'product_variation', '', 0),
(36, 1, '2020-05-21 06:27:17', '2020-05-21 06:27:17', '', 'V-Neck T-Shirt - Blue', 'Color: Blue', 'publish', 'closed', 'closed', '', 'v-neck-t-shirt-blue', '', '', '2020-05-21 06:29:53', '2020-05-21 06:29:53', '', 20, 'http://localhost/product/import-placeholder-for-78/', 0, 'product_variation', '', 0),
(37, 1, '2020-05-21 06:27:17', '2020-05-21 06:27:17', '', 'Hoodie - Red, No', 'Color: Red, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-red-no', '', '', '2020-05-21 06:29:53', '2020-05-21 06:29:53', '', 21, 'http://localhost/product/import-placeholder-for-79/', 1, 'product_variation', '', 0),
(38, 1, '2020-05-21 06:27:18', '2020-05-21 06:27:18', '', 'Hoodie - Green, No', 'Color: Green, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-green-no', '', '', '2020-05-21 06:29:54', '2020-05-21 06:29:54', '', 21, 'http://localhost/product/import-placeholder-for-80/', 2, 'product_variation', '', 0),
(39, 1, '2020-05-21 06:27:18', '2020-05-21 06:27:18', '', 'Hoodie - Blue, No', 'Color: Blue, Logo: No', 'publish', 'closed', 'closed', '', 'hoodie-blue-no', '', '', '2020-05-21 06:29:54', '2020-05-21 06:29:54', '', 21, 'http://localhost/product/import-placeholder-for-81/', 3, 'product_variation', '', 0),
(40, 1, '2020-05-21 06:27:18', '2020-05-21 06:27:18', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'T-Shirt with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 't-shirt-with-logo', '', '', '2020-05-21 06:29:56', '2020-05-21 06:29:56', '', 0, 'http://localhost/product/import-placeholder-for-83/', 0, 'product', '', 0),
(41, 1, '2020-05-21 06:27:19', '2020-05-21 06:27:19', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Beanie with Logo', 'This is a simple product.', 'publish', 'open', 'closed', '', 'beanie-with-logo', '', '', '2020-05-21 06:29:58', '2020-05-21 06:29:58', '', 0, 'http://localhost/product/import-placeholder-for-85/', 0, 'product', '', 0),
(42, 1, '2020-05-21 06:27:19', '2020-05-21 06:27:19', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'Logo Collection', 'This is a grouped product.', 'publish', 'open', 'closed', '', 'logo-collection', '', '', '2020-05-21 06:30:00', '2020-05-21 06:30:00', '', 0, 'http://localhost/product/import-placeholder-for-87/', 0, 'product', '', 0),
(43, 1, '2020-05-21 06:27:19', '2020-05-21 06:27:19', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.', 'WordPress Pennant', 'This is an external product.', 'publish', 'open', 'closed', '', 'wordpress-pennant', '', '', '2020-05-21 06:30:03', '2020-05-21 06:30:03', '', 0, 'http://localhost/product/import-placeholder-for-89/', 0, 'product', '', 0),
(44, 1, '2020-05-21 06:27:19', '2020-05-21 06:27:19', '', 'Hoodie - Blue, Yes', 'Color: Blue, Logo: Yes', 'publish', 'closed', 'closed', '', 'hoodie-blue-yes', '', '', '2020-05-21 06:30:03', '2020-05-21 06:30:03', '', 21, 'http://localhost/product/import-placeholder-for-90/', 0, 'product_variation', '', 0),
(45, 1, '2020-05-21 06:27:22', '2020-05-21 06:27:22', '', 'vneck-tee-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'vneck-tee-2-2-jpg', '', '', '2020-05-21 06:27:22', '2020-05-21 06:27:22', '', 20, 'http://localhost/wp-content/uploads/2020/05/vneck-tee-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2020-05-21 06:27:24', '2020-05-21 06:27:24', '', 'vnech-tee-green-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-green-1-2-jpg', '', '', '2020-05-21 06:27:24', '2020-05-21 06:27:24', '', 20, 'http://localhost/wp-content/uploads/2020/05/vnech-tee-green-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2020-05-21 06:27:26', '2020-05-21 06:27:26', '', 'vnech-tee-blue-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'vnech-tee-blue-1-2-jpg', '', '', '2020-05-21 06:27:26', '2020-05-21 06:27:26', '', 20, 'http://localhost/wp-content/uploads/2020/05/vnech-tee-blue-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2020-05-21 06:27:28', '2020-05-21 06:27:28', '', 'hoodie-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-2-2-jpg', '', '', '2020-05-21 06:27:28', '2020-05-21 06:27:28', '', 21, 'http://localhost/wp-content/uploads/2020/05/hoodie-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(49, 1, '2020-05-21 06:27:30', '2020-05-21 06:27:30', '', 'hoodie-blue-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-blue-1-2-jpg', '', '', '2020-05-21 06:27:30', '2020-05-21 06:27:30', '', 21, 'http://localhost/wp-content/uploads/2020/05/hoodie-blue-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(50, 1, '2020-05-21 06:27:31', '2020-05-21 06:27:31', '', 'hoodie-green-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-green-1-2-jpg', '', '', '2020-05-21 06:27:31', '2020-05-21 06:27:31', '', 21, 'http://localhost/wp-content/uploads/2020/05/hoodie-green-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(51, 1, '2020-05-21 06:27:33', '2020-05-21 06:27:33', '', 'hoodie-with-logo-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-logo-2-2-jpg', '', '', '2020-05-21 06:27:33', '2020-05-21 06:27:33', '', 21, 'http://localhost/wp-content/uploads/2020/05/hoodie-with-logo-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(52, 1, '2020-05-21 06:27:35', '2020-05-21 06:27:35', '', 'tshirt-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'tshirt-2-2-jpg', '', '', '2020-05-21 06:27:35', '2020-05-21 06:27:35', '', 23, 'http://localhost/wp-content/uploads/2020/05/tshirt-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2020-05-21 06:27:37', '2020-05-21 06:27:37', '', 'beanie-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-2-2-jpg', '', '', '2020-05-21 06:27:37', '2020-05-21 06:27:37', '', 24, 'http://localhost/wp-content/uploads/2020/05/beanie-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(54, 1, '2020-05-21 06:27:39', '2020-05-21 06:27:39', '', 'belt-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'belt-2-2-jpg', '', '', '2020-05-21 06:27:39', '2020-05-21 06:27:39', '', 25, 'http://localhost/wp-content/uploads/2020/05/belt-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(55, 1, '2020-05-21 06:27:40', '2020-05-21 06:27:40', '', 'cap-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'cap-2-2-jpg', '', '', '2020-05-21 06:27:40', '2020-05-21 06:27:40', '', 26, 'http://localhost/wp-content/uploads/2020/05/cap-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(56, 1, '2020-05-21 06:29:34', '2020-05-21 06:29:34', 'http://localhost/wp-content/uploads/2020/05/sample_products-4.csv', 'sample_products-4.csv', '', 'private', 'open', 'closed', '', 'sample_products-4-csv', '', '', '2020-05-21 06:29:34', '2020-05-21 06:29:34', '', 0, 'http://localhost/wp-content/uploads/2020/05/sample_products-4.csv', 0, 'attachment', 'text/csv', 0),
(57, 1, '2020-05-21 06:29:40', '2020-05-21 06:29:40', '', 'sunglasses-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'sunglasses-2-2-jpg', '', '', '2020-05-21 06:29:40', '2020-05-21 06:29:40', '', 27, 'http://localhost/wp-content/uploads/2020/05/sunglasses-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2020-05-21 06:29:42', '2020-05-21 06:29:42', '', 'hoodie-with-pocket-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-pocket-2-2-jpg', '', '', '2020-05-21 06:29:42', '2020-05-21 06:29:42', '', 28, 'http://localhost/wp-content/uploads/2020/05/hoodie-with-pocket-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(59, 1, '2020-05-21 06:29:44', '2020-05-21 06:29:44', '', 'hoodie-with-zipper-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'hoodie-with-zipper-2-2-jpg', '', '', '2020-05-21 06:29:44', '2020-05-21 06:29:44', '', 29, 'http://localhost/wp-content/uploads/2020/05/hoodie-with-zipper-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(60, 1, '2020-05-21 06:29:46', '2020-05-21 06:29:46', '', 'long-sleeve-tee-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'long-sleeve-tee-2-2-jpg', '', '', '2020-05-21 06:29:46', '2020-05-21 06:29:46', '', 30, 'http://localhost/wp-content/uploads/2020/05/long-sleeve-tee-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(61, 1, '2020-05-21 06:29:48', '2020-05-21 06:29:48', '', 'polo-2-2.jpg', '', 'inherit', 'open', 'closed', '', 'polo-2-2-jpg', '', '', '2020-05-21 06:29:48', '2020-05-21 06:29:48', '', 31, 'http://localhost/wp-content/uploads/2020/05/polo-2-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(62, 1, '2020-05-21 06:29:50', '2020-05-21 06:29:50', '', 'album-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'album-1-2-jpg', '', '', '2020-05-21 06:29:50', '2020-05-21 06:29:50', '', 32, 'http://localhost/wp-content/uploads/2020/05/album-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2020-05-21 06:29:52', '2020-05-21 06:29:52', '', 'single-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'single-1-2-jpg', '', '', '2020-05-21 06:29:52', '2020-05-21 06:29:52', '', 33, 'http://localhost/wp-content/uploads/2020/05/single-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(64, 1, '2020-05-21 06:29:55', '2020-05-21 06:29:55', '', 't-shirt-with-logo-1-2.jpg', '', 'inherit', 'open', 'closed', '', 't-shirt-with-logo-1-2-jpg', '', '', '2020-05-21 06:29:55', '2020-05-21 06:29:55', '', 40, 'http://localhost/wp-content/uploads/2020/05/t-shirt-with-logo-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(65, 1, '2020-05-21 06:29:57', '2020-05-21 06:29:57', '', 'beanie-with-logo-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'beanie-with-logo-1-2-jpg', '', '', '2020-05-21 06:29:57', '2020-05-21 06:29:57', '', 41, 'http://localhost/wp-content/uploads/2020/05/beanie-with-logo-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(66, 1, '2020-05-21 06:30:00', '2020-05-21 06:30:00', '', 'logo-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'logo-1-2-jpg', '', '', '2020-05-21 06:30:00', '2020-05-21 06:30:00', '', 42, 'http://localhost/wp-content/uploads/2020/05/logo-1-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(67, 1, '2020-05-21 06:30:02', '2020-05-21 06:30:02', '', 'pennant-1-2.jpg', '', 'inherit', 'open', 'closed', '', 'pennant-1-2-jpg', '', '', '2020-05-21 06:30:02', '2020-05-21 06:30:02', '', 43, 'http://localhost/wp-content/uploads/2020/05/pennant-1-2.jpg', 0, 'attachment', 'image/jpeg', 0) ;

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
(20, 4, 0),
(20, 8, 0),
(20, 17, 0),
(20, 22, 0),
(20, 23, 0),
(20, 24, 0),
(20, 25, 0),
(20, 26, 0),
(20, 27, 0),
(21, 4, 0),
(21, 18, 0),
(21, 22, 0),
(21, 23, 0),
(21, 24, 0),
(22, 2, 0),
(22, 18, 0),
(22, 22, 0),
(23, 2, 0),
(23, 17, 0),
(23, 28, 0),
(24, 2, 0),
(24, 19, 0),
(24, 24, 0),
(25, 2, 0),
(25, 19, 0),
(26, 2, 0),
(26, 8, 0),
(26, 19, 0),
(26, 29, 0),
(27, 2, 0),
(27, 8, 0),
(27, 19, 0),
(28, 2, 0),
(28, 6, 0),
(28, 7, 0),
(28, 8, 0),
(28, 18, 0),
(28, 28, 0),
(29, 2, 0),
(29, 8, 0),
(29, 18, 0),
(30, 2, 0),
(30, 17, 0),
(30, 23, 0),
(31, 2, 0),
(31, 17, 0),
(31, 22, 0),
(32, 2, 0),
(32, 20, 0),
(33, 2, 0),
(33, 20, 0),
(34, 15, 0),
(35, 15, 0),
(36, 15, 0),
(37, 15, 0),
(38, 15, 0),
(39, 15, 0),
(40, 2, 0),
(40, 17, 0),
(40, 28, 0),
(41, 2, 0),
(41, 19, 0),
(41, 24, 0),
(42, 3, 0),
(42, 16, 0),
(43, 5, 0),
(43, 21, 0),
(44, 15, 0) ;

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
(1, 16, 'order', '0'),
(2, 17, 'order', '0'),
(3, 18, 'order', '0'),
(4, 19, 'order', '0'),
(5, 20, 'order', '0'),
(6, 15, 'product_count_product_cat', '0'),
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
(16, 1, 'session_tokens', 'a:2:{s:64:"9141f74b3488022c03c523fb5b01dcbfd9c336e9d704b89797ecdebd286cd189";a:4:{s:10:"expiration";i:1590215100;s:2:"ip";s:13:"192.168.160.1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36";s:5:"login";i:1590042300;}s:64:"f0d8aebb0300af5fdd77402c2fc6c99525b75b4bdc3afecb6e21abb0200cc7d2";a:4:{s:10:"expiration";i:1590215241;s:2:"ip";s:13:"192.168.160.1";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36";s:5:"login";i:1590042441;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '10'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:13:"192.168.160.0";}'),
(19, 1, 'wc_last_active', '1590019200'),
(20, 1, 'wp_woocommerce_product_import_mapping', 'a:51:{i:0;s:2:"id";i:1;s:4:"type";i:2;s:3:"sku";i:3;s:4:"name";i:4;s:9:"published";i:5;s:8:"featured";i:6;s:18:"catalog_visibility";i:7;s:17:"short_description";i:8;s:11:"description";i:9;s:17:"date_on_sale_from";i:10;s:15:"date_on_sale_to";i:11;s:10:"tax_status";i:12;s:9:"tax_class";i:13;s:12:"stock_status";i:14;s:14:"stock_quantity";i:15;s:10:"backorders";i:16;s:17:"sold_individually";i:17;s:0:"";i:18;s:0:"";i:19;s:0:"";i:20;s:0:"";i:21;s:15:"reviews_allowed";i:22;s:13:"purchase_note";i:23;s:10:"sale_price";i:24;s:13:"regular_price";i:25;s:12:"category_ids";i:26;s:7:"tag_ids";i:27;s:17:"shipping_class_id";i:28;s:6:"images";i:29;s:14:"download_limit";i:30;s:15:"download_expiry";i:31;s:9:"parent_id";i:32;s:16:"grouped_products";i:33;s:10:"upsell_ids";i:34;s:14:"cross_sell_ids";i:35;s:11:"product_url";i:36;s:11:"button_text";i:37;s:10:"menu_order";i:38;s:16:"attributes:name1";i:39;s:17:"attributes:value1";i:40;s:19:"attributes:visible1";i:41;s:20:"attributes:taxonomy1";i:42;s:16:"attributes:name2";i:43;s:17:"attributes:value2";i:44;s:19:"attributes:visible2";i:45;s:20:"attributes:taxonomy2";i:46;s:23:"meta:_wpcom_is_markdown";i:47;s:15:"downloads:name1";i:48;s:14:"downloads:url1";i:49;s:15:"downloads:name2";i:50;s:14:"downloads:url2";}'),
(21, 1, 'wp_product_import_error_log', 'a:14:{i:0;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:20;s:3:"row";s:40:"V-Neck T-Shirt, ID 20, SKU woo-vneck-tee";}}}i:1;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:21;s:3:"row";s:29:"Hoodie, ID 21, SKU woo-hoodie";}}}i:2;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:22;s:3:"row";s:49:"Hoodie with Logo, ID 22, SKU woo-hoodie-with-logo";}}}i:3;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:23;s:3:"row";s:30:"T-Shirt, ID 23, SKU woo-tshirt";}}}i:4;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:24;s:3:"row";s:29:"Beanie, ID 24, SKU woo-beanie";}}}i:5;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:25;s:3:"row";s:25:"Belt, ID 25, SKU woo-belt";}}}i:6;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:26;s:3:"row";s:23:"Cap, ID 26, SKU woo-cap";}}}i:7;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:36;s:3:"row";s:52:"V-Neck T-Shirt - Blue, ID 36, SKU woo-vneck-tee-blue";}}}i:8;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:37;s:3:"row";s:43:"Hoodie - Red, No, ID 37, SKU woo-hoodie-red";}}}i:9;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:38;s:3:"row";s:47:"Hoodie - Green, No, ID 38, SKU woo-hoodie-green";}}}i:10;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:39;s:3:"row";s:45:"Hoodie - Blue, No, ID 39, SKU woo-hoodie-blue";}}}i:11;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:40;s:3:"row";s:45:"T-Shirt with Logo, ID 40, SKU Woo-tshirt-logo";}}}i:12;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:41;s:3:"row";s:44:"Beanie with Logo, ID 41, SKU Woo-beanie-logo";}}}i:13;O:8:"WP_Error":2:{s:6:"errors";a:1:{s:34:"woocommerce_product_importer_error";a:1:{i:0;s:38:"A product with this ID already exists.";}}s:10:"error_data";a:1:{s:34:"woocommerce_product_importer_error";a:2:{s:2:"id";i:42;s:3:"row";s:43:"Logo Collection, ID 42, SKU logo-collection";}}}}') ;

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
(1, 'admin', '$P$BcZvox3qVilgNl2vrgcsTgR6VwH8Cc1', 'admin', 'dev-email@flywheel.local', 'http://localhost', '2020-04-17 13:35:07', '', 0, 'admin') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_note_actions`
#
INSERT INTO `wp_wc_admin_note_actions` ( `action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`) VALUES
(1, 1, 'learn-more', 'Learn more', 'https://woocommerce.wordpress.com/', 'actioned', 0),
(2, 2, 'open-customizer', 'Open Customizer', 'customize.php', 'actioned', 0),
(3, 3, 'connect', 'Connect', '?page=wc-addons&section=helper', 'unactioned', 0),
(4, 4, 'continue-profiler', 'Continue Store Setup', 'http://localhost/wp-admin/admin.php?page=wc-admin&enable_onboarding=1', 'unactioned', 1),
(5, 4, 'skip-profiler', 'Skip Setup', 'http://localhost/wp-admin/admin.php?page=wc-admin&reset_profiler=0', 'actioned', 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_wc_admin_notes`
#
INSERT INTO `wp_wc_admin_notes` ( `note_id`, `name`, `type`, `locale`, `title`, `content`, `icon`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`) VALUES
(1, 'wc-admin-welcome-note', 'info', 'en_US', 'New feature(s)', 'Welcome to the new WooCommerce experience! In this new release you\'ll be able to have a glimpse of how your store is doing in the Dashboard, manage important aspects of your business (such as managing orders, stock, reviews) from anywhere in the interface, dive into your store data with a completely new Analytics section and more!', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-21 06:25:48', NULL, 0),
(2, 'wc-admin-store-notice-setting-moved', 'info', 'en_US', 'Looking for the Store Notice setting?', 'It can now be found in the Customizer.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-21 06:25:48', NULL, 0),
(3, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-21 06:25:49', NULL, 0),
(4, 'wc-admin-onboarding-profiler-reminder', 'update', 'en_US', 'Welcome to WooCommerce! Set up your store and start selling', 'We\'re here to help you going through the most important steps to get your store up and running.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-05-21 06:25:50', NULL, 0) ;

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
(13, 'woo-vneck-tee', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(14, 'woo-hoodie', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(15, 'woo-hoodie-with-logo', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(16, 'woo-tshirt', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(17, 'woo-beanie', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(20, 'woo-vneck-tee', 0, 0, '15.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(21, 'woo-hoodie', 0, 0, '42.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(22, 'woo-hoodie-with-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(23, 'woo-tshirt', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(24, 'woo-beanie', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(25, 'woo-belt', 0, 0, '55.0000', '55.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(26, 'woo-cap', 0, 0, '16.0000', '16.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(27, 'woo-sunglasses', 0, 0, '90.0000', '90.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(28, 'woo-hoodie-with-pocket', 0, 0, '35.0000', '35.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(29, 'woo-hoodie-with-zipper', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(30, 'woo-long-sleeve-tee', 0, 0, '25.0000', '25.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(31, 'woo-polo', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(32, 'woo-album', 1, 1, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(33, 'woo-single', 1, 1, '2.0000', '2.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(34, 'woo-vneck-tee-red', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(35, 'woo-vneck-tee-green', 0, 0, '20.0000', '20.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(36, 'woo-vneck-tee-blue', 0, 0, '15.0000', '15.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(37, 'woo-hoodie-red', 0, 0, '42.0000', '42.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(38, 'woo-hoodie-green', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(39, 'woo-hoodie-blue', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(40, 'Woo-tshirt-logo', 0, 0, '18.0000', '18.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(41, 'Woo-beanie-logo', 0, 0, '18.0000', '18.0000', 1, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(42, 'logo-collection', 0, 0, '18.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(43, 'wp-pennant', 0, 0, '11.0500', '11.0500', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(44, 'woo-hoodie-blue-logo', 0, 0, '45.0000', '45.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_woocommerce_sessions`
#
INSERT INTO `wp_woocommerce_sessions` ( `session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(1, '1', 'a:7:{s:4:"cart";s:6:"a:0:{}";s:11:"cart_totals";s:367:"a:15:{s:8:"subtotal";i:0;s:12:"subtotal_tax";i:0;s:14:"shipping_total";i:0;s:12:"shipping_tax";i:0;s:14:"shipping_taxes";a:0:{}s:14:"discount_total";i:0;s:12:"discount_tax";i:0;s:19:"cart_contents_total";i:0;s:17:"cart_contents_tax";i:0;s:19:"cart_contents_taxes";a:0:{}s:9:"fee_total";i:0;s:7:"fee_tax";i:0;s:9:"fee_taxes";a:0:{}s:5:"total";i:0;s:9:"total_tax";i:0;}";s:15:"applied_coupons";s:6:"a:0:{}";s:22:"coupon_discount_totals";s:6:"a:0:{}";s:26:"coupon_discount_tax_totals";s:6:"a:0:{}";s:21:"removed_cart_contents";s:6:"a:0:{}";s:8:"customer";s:712:"a:26:{s:2:"id";s:1:"1";s:13:"date_modified";s:0:"";s:8:"postcode";s:0:"";s:4:"city";s:0:"";s:9:"address_1";s:0:"";s:7:"address";s:0:"";s:9:"address_2";s:0:"";s:5:"state";s:0:"";s:7:"country";s:2:"GB";s:17:"shipping_postcode";s:0:"";s:13:"shipping_city";s:0:"";s:18:"shipping_address_1";s:0:"";s:16:"shipping_address";s:0:"";s:18:"shipping_address_2";s:0:"";s:14:"shipping_state";s:0:"";s:16:"shipping_country";s:2:"GB";s:13:"is_vat_exempt";s:0:"";s:19:"calculated_shipping";s:0:"";s:10:"first_name";s:0:"";s:9:"last_name";s:0:"";s:7:"company";s:0:"";s:5:"phone";s:0:"";s:5:"email";s:24:"dev-email@flywheel.local";s:19:"shipping_first_name";s:0:"";s:18:"shipping_last_name";s:0:"";s:16:"shipping_company";s:0:"";}";}', 1590215154) ;

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

