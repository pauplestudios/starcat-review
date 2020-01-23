# WordPress MySQL database migration
#
# Generated: Thursday 23. January 2020 11:59 UTC
# Hostname: localhost
# Database: `local`
# URL: //127.0.0.1
# Path: /app/public
# Tables: wp_commentmeta, wp_comments, wp_links, wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users
# Table Prefix: wp_
# Post Types: revision, page, post
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



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
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-01-23 11:54:58', '2020-01-23 11:54:58', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1', 'yes'),
(2, 'home', 'http://127.0.0.1', 'yes'),
(3, 'blogname', 'fresh', 'yes'),
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
(29, 'rewrite_rules', 'a:87:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:33:"starcat-review/starcat-review.php";i:1;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
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
(93, 'admin_email_lifespan', '1595332498', 'yes'),
(94, 'initial_db_version', '45805', 'yes'),
(95, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:61:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(96, 'fresh_site', '1', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:3:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";}s:9:"sidebar-2";a:3:{i:0;s:10:"archives-2";i:1;s:12:"categories-2";i:2;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(103, 'cron', 'a:8:{i:1579784100;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1579787790;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c9059feef497c200e69cb9956a81f005";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:5;}}}}i:1579800918;a:1:{s:27:"fs_data_sync_starcat-review";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1579823700;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1579866900;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1579866918;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1579866920;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(110, 'nonce_key', '+&/TWYZyPwdd3:;N}[LT2Eue.r~;AA2@4~*ENt:FJ>p|0)/^paWpAgL2H5@9.{&9', 'no'),
(111, 'nonce_salt', 'DQm?wM4q.hK-@Ew9B}41:sUrGbSfU2Zv?u~%~sW<bmXuJ*:).!Bx5*!Qn$_z1uY)', 'no'),
(112, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(114, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(128, 'can_compress_scripts', '1', 'no'),
(145, 'fs_active_plugins', 'O:8:"stdClass":3:{s:7:"plugins";a:1:{s:36:"starcat-review/includes/lib/freemius";O:8:"stdClass":4:{s:7:"version";s:5:"2.3.0";s:4:"type";s:6:"plugin";s:9:"timestamp";i:1579780602;s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";}}s:7:"abspath";s:12:"/app/public/";s:6:"newest";O:8:"stdClass":5:{s:11:"plugin_path";s:33:"starcat-review/starcat-review.php";s:8:"sdk_path";s:36:"starcat-review/includes/lib/freemius";s:7:"version";s:5:"2.3.0";s:13:"in_activation";b:0;s:9:"timestamp";i:1579780602;}}', 'yes'),
(146, 'fs_debug_mode', '', 'yes'),
(147, 'fs_accounts', 'a:14:{s:21:"id_slug_type_path_map";a:1:{i:3980;a:3:{s:4:"slug";s:14:"starcat-review";s:4:"type";s:6:"plugin";s:4:"path";s:33:"starcat-review/starcat-review.php";}}s:11:"plugin_data";a:1:{s:14:"starcat-review";a:21:{s:16:"plugin_main_file";O:8:"stdClass":1:{s:4:"path";s:33:"starcat-review/starcat-review.php";}s:20:"is_network_activated";b:0;s:17:"install_timestamp";i:1579780602;s:16:"sdk_last_version";N;s:11:"sdk_version";s:5:"2.3.0";s:16:"sdk_upgrade_mode";b:1;s:18:"sdk_downgrade_mode";b:0;s:19:"plugin_last_version";N;s:14:"plugin_version";s:5:"0.2.2";s:19:"plugin_upgrade_mode";b:1;s:21:"plugin_downgrade_mode";b:0;s:21:"is_plugin_new_install";b:1;s:17:"connectivity_test";a:6:{s:12:"is_connected";b:1;s:4:"host";s:11:"fresh.local";s:9:"server_ip";s:24:"192.168.95.1, 172.17.0.1";s:9:"is_active";b:1;s:9:"timestamp";i:1579780602;s:7:"version";s:5:"0.2.2";}s:17:"was_plugin_loaded";b:1;s:15:"prev_is_premium";b:1;s:14:"has_trial_plan";b:1;s:22:"install_sync_timestamp";i:1579780642;s:19:"keepalive_timestamp";i:1579780642;s:20:"activation_timestamp";i:1579780637;s:13:"subscriptions";a:1:{i:0;O:15:"FS_Subscription":20:{s:7:"user_id";s:7:"1131140";s:10:"install_id";N;s:7:"plan_id";s:4:"8333";s:10:"license_id";s:6:"267697";s:11:"total_gross";i:0;s:16:"amount_per_cycle";i:49;s:13:"billing_cycle";i:12;s:19:"outstanding_balance";i:0;s:15:"failed_payments";i:0;s:7:"gateway";s:6:"stripe";s:11:"external_id";s:18:"sub_GL8OiQaQ56oR7g";s:10:"trial_ends";N;s:12:"next_payment";s:19:"2020-12-11 10:08:53";s:6:"vat_id";N;s:12:"country_code";s:2:"in";s:2:"id";s:5:"71201";s:7:"updated";N;s:7:"created";s:19:"2019-12-11 10:08:55";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:9:"sync_cron";O:8:"stdClass":5:{s:7:"version";s:5:"0.2.2";s:7:"blog_id";i:0;s:11:"sdk_version";s:5:"2.3.0";s:9:"timestamp";i:1579780647;s:2:"on";b:1;}}}s:13:"file_slug_map";a:1:{s:33:"starcat-review/starcat-review.php";s:14:"starcat-review";}s:7:"plugins";a:1:{s:14:"starcat-review";O:9:"FS_Plugin":23:{s:16:"parent_plugin_id";N;s:5:"title";s:14:"Starcat Review";s:4:"slug";s:14:"starcat-review";s:12:"premium_slug";s:22:"starcat-review-premium";s:4:"type";s:6:"plugin";s:20:"affiliate_moderation";b:0;s:19:"is_wp_org_compliant";b:1;s:22:"premium_releases_count";N;s:4:"file";s:33:"starcat-review/starcat-review.php";s:7:"version";s:5:"0.2.2";s:11:"auto_update";N;s:4:"info";N;s:10:"is_premium";b:1;s:14:"premium_suffix";s:3:"Pro";s:7:"is_live";b:1;s:9:"bundle_id";N;s:10:"public_key";s:32:"pk_ad2b6650d9ef2e5df3c203ea9046f";s:10:"secret_key";s:32:"sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;";s:2:"id";s:4:"3980";s:7:"updated";N;s:7:"created";N;s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:9:"unique_id";s:32:"b665048d5f79b5f561385e89566aae7b";s:5:"plans";a:1:{s:14:"starcat-review";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:4:"cHJv";s:5:"title";s:4:"UHJv";s:11:"description";N;s:17:"is_free_localhost";s:0:"";s:17:"is_block_features";s:0:"";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";N;s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:4:"MQ==";s:2:"id";s:8:"NjQwNg==";s:7:"updated";s:28:"MjAyMC0wMS0xNCAxMTo1NTozMQ==";s:7:"created";s:28:"MjAxOS0wNi0xOSAwNToxNTowMA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:8:"Mzk4MA==";s:4:"name";s:8:"YmFzaWM=";s:5:"title";s:8:"QmFzaWM=";s:11:"description";N;s:17:"is_free_localhost";s:4:"MQ==";s:17:"is_block_features";s:0:"";s:12:"license_type";s:4:"MA==";s:16:"is_https_support";s:0:"";s:12:"trial_period";s:4:"Nw==";s:23:"is_require_subscription";s:0:"";s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";s:0:"";s:11:"is_featured";s:0:"";s:2:"id";s:8:"ODIyMA==";s:7:"updated";s:28:"MjAxOS0xMi0zMCAxMDo0NzoxMQ==";s:7:"created";s:28:"MjAxOS0xMi0wMiAwNjo0NDo0NA==";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:14:"active_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1579780642;s:3:"md5";s:32:"2581320459c24eff2d80434054c30080";s:7:"plugins";a:1:{s:33:"starcat-review/starcat-review.php";a:5:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:5:"0.2.2";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:11:"all_plugins";O:8:"stdClass":3:{s:9:"timestamp";i:1579780642;s:3:"md5";s:32:"1a3d6a4426e025ce43f2ba3a59df247c";s:7:"plugins";a:1:{s:33:"starcat-review/starcat-review.php";a:5:{s:4:"slug";s:14:"starcat-review";s:7:"version";s:5:"0.2.2";s:5:"title";s:14:"Starcat Review";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}}}s:10:"all_themes";O:8:"stdClass":3:{s:9:"timestamp";i:1579780642;s:3:"md5";s:32:"c40c8a62a526767cc26d623008f95acc";s:6:"themes";a:4:{s:14:"twentynineteen";a:5:{s:4:"slug";s:14:"twentynineteen";s:7:"version";s:3:"1.4";s:5:"title";s:15:"Twenty Nineteen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:15:"twentyseventeen";a:5:{s:4:"slug";s:15:"twentyseventeen";s:7:"version";s:3:"2.2";s:5:"title";s:16:"Twenty Seventeen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:13:"twentysixteen";a:5:{s:4:"slug";s:13:"twentysixteen";s:7:"version";s:3:"2.0";s:5:"title";s:14:"Twenty Sixteen";s:9:"is_active";b:0;s:14:"is_uninstalled";b:0;}s:12:"twentytwenty";a:5:{s:4:"slug";s:12:"twentytwenty";s:7:"version";s:3:"1.1";s:5:"title";s:13:"Twenty Twenty";s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;}}}s:5:"sites";a:1:{s:14:"starcat-review";O:7:"FS_Site":26:{s:7:"site_id";s:8:"16376374";s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:5:"title";s:5:"fresh";s:3:"url";s:16:"http://127.0.0.1";s:7:"version";s:5:"0.2.2";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"5.3.2";s:11:"sdk_version";s:5:"2.3.0";s:28:"programming_language_version";s:5:"7.2.9";s:7:"plan_id";s:4:"8220";s:10:"license_id";s:6:"278468";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:10:"is_premium";b:1;s:15:"is_disconnected";b:0;s:9:"is_active";b:1;s:14:"is_uninstalled";b:0;s:10:"public_key";s:32:"pk_070e9681316f95a01d206b0d3491c";s:10:"secret_key";s:32:"sk_*5k<!!qlQR=~x]S{Oh)%iN*0~L@DI";s:2:"id";s:7:"3792710";s:7:"updated";s:19:"2020-01-23 11:57:17";s:7:"created";s:19:"2020-01-23 11:57:17";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:5:"users";a:1:{i:1131140;O:7:"FS_User":14:{s:5:"email";s:22:"essekiarockz@gmail.com";s:5:"first";s:7:"essekia";s:4:"last";s:4:"Paul";s:11:"is_verified";b:1;s:7:"is_beta";N;s:11:"customer_id";s:18:"cus_Ec0muPO1yhakcJ";s:5:"gross";i:0;s:10:"public_key";s:32:"pk_3105e0154533dee39ca36264246cb";s:10:"secret_key";s:32:"sk_G6@FredUE@fnGDDzIEzatFjEuZ@jm";s:2:"id";s:7:"1131140";s:7:"updated";s:19:"2019-12-23 04:24:08";s:7:"created";s:19:"2018-04-26 11:25:56";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}s:23:"user_id_license_ids_map";a:1:{i:3980;a:1:{i:1131140;a:2:{i:0;i:278468;i:1;i:91267;}}}s:12:"all_licenses";a:1:{i:3980;a:2:{i:0;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:2;s:15:"activated_local";i:4;s:10:"expiration";s:19:"2020-12-12 10:08:53";s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"278468";s:7:"updated";s:19:"2020-01-23 11:57:17";s:7:"created";s:19:"2020-01-08 04:53:30";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"6406";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"5702";s:5:"quota";i:27;s:9:"activated";i:3;s:15:"activated_local";i:13;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_(H7lEoP+P<W5g?P%P#X@%}*j+&e>@";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:5:"91267";s:7:"updated";s:19:"2020-01-07 10:50:29";s:7:"created";s:19:"2019-06-19 06:20:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"updates";a:1:{i:3980;N;}}', 'yes'),
(148, 'fs_api_cache', 'a:6:{s:26:"get:/v1/users/1131140.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":16:{s:15:"default_card_id";s:1:"1";s:5:"gross";i:0;s:6:"source";i:0;s:13:"last_login_at";N;s:5:"email";s:22:"essekiarockz@gmail.com";s:5:"first";s:7:"essekia";s:4:"last";s:4:"Paul";s:7:"picture";N;s:2:"ip";s:15:"103.219.206.113";s:11:"is_verified";b:1;s:10:"secret_key";s:32:"sk_G6@FredUE@fnGDDzIEzatFjEuZ@jm";s:10:"public_key";s:32:"pk_3105e0154533dee39ca36264246cb";s:2:"id";s:7:"1131140";s:7:"created";s:19:"2018-04-26 11:25:56";s:7:"updated";s:19:"2019-12-23 04:24:08";s:11:"customer_id";s:18:"cus_Ec0muPO1yhakcJ";}s:7:"created";i:1579780637;s:9:"timestamp";i:1579867037;}s:29:"get:/v1/installs/3792710.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":31:{s:7:"site_id";s:8:"16376374";s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:3:"url";s:16:"http://127.0.0.1";s:5:"title";s:5:"fresh";s:7:"version";s:5:"0.2.2";s:7:"plan_id";s:4:"8220";s:10:"license_id";s:6:"278468";s:13:"trial_plan_id";N;s:10:"trial_ends";N;s:15:"subscription_id";N;s:5:"gross";i:0;s:12:"country_code";s:2:"in";s:8:"language";s:5:"en-US";s:7:"charset";s:5:"UTF-8";s:16:"platform_version";s:5:"5.3.2";s:11:"sdk_version";s:5:"2.3.0";s:28:"programming_language_version";s:5:"7.2.9";s:9:"is_active";b:1;s:15:"is_disconnected";b:0;s:10:"is_premium";b:1;s:14:"is_uninstalled";b:0;s:9:"is_locked";b:0;s:6:"source";i:0;s:8:"upgraded";N;s:12:"last_seen_at";s:19:"2020-01-23 11:57:20";s:10:"secret_key";s:32:"sk_*5k<!!qlQR=~x]S{Oh)%iN*0~L@DI";s:10:"public_key";s:32:"pk_070e9681316f95a01d206b0d3491c";s:2:"id";s:7:"3792710";s:7:"created";s:19:"2020-01-23 11:57:17";s:7:"updated";s:19:"2020-01-23 11:57:17";}s:7:"created";i:1579780637;s:9:"timestamp";i:1579867037;}s:63:"get:/v1/users/1131140/plugins/3980/plans.json?show_pending=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:5:"plans";a:2:{i:0;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:3:"pro";s:5:"title";s:3:"Pro";s:11:"description";N;s:17:"is_free_localhost";b:0;s:17:"is_block_features";b:0;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";N;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:1;s:2:"id";s:4:"6406";s:7:"updated";s:19:"2020-01-14 11:55:31";s:7:"created";s:19:"2019-06-19 05:15:00";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:14:"FS_Plugin_Plan":22:{s:9:"plugin_id";s:4:"3980";s:4:"name";s:5:"basic";s:5:"title";s:5:"Basic";s:11:"description";N;s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:0;s:12:"license_type";i:0;s:16:"is_https_support";b:0;s:12:"trial_period";i:7;s:23:"is_require_subscription";b:0;s:10:"support_kb";N;s:13:"support_forum";N;s:13:"support_email";N;s:13:"support_phone";N;s:13:"support_skype";N;s:18:"is_success_manager";b:0;s:11:"is_featured";b:0;s:2:"id";s:4:"8220";s:7:"updated";s:19:"2019-12-30 10:47:11";s:7:"created";s:19:"2019-12-02 06:44:44";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1579780637;s:9:"timestamp";i:1579867037;}s:65:"get:/v1/users/1131140/plugins/3980/licenses.json?is_enriched=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:8:"licenses";a:2:{i:0;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"8220";s:16:"parent_plan_name";s:8:"business";s:17:"parent_plan_title";s:8:"Business";s:17:"parent_license_id";s:6:"267697";s:10:"pricing_id";N;s:5:"quota";i:10;s:9:"activated";i:2;s:15:"activated_local";i:4;s:10:"expiration";s:19:"2020-12-12 10:08:53";s:10:"secret_key";s:32:"sk_vCJfhF&=jHs$om_:8g*h5dMzp9eVj";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:6:"278468";s:7:"updated";s:19:"2020-01-23 11:57:17";s:7:"created";s:19:"2020-01-08 04:53:30";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}i:1;O:17:"FS_Plugin_License":20:{s:9:"plugin_id";s:4:"3980";s:7:"user_id";s:7:"1131140";s:7:"plan_id";s:4:"6406";s:16:"parent_plan_name";N;s:17:"parent_plan_title";N;s:17:"parent_license_id";N;s:10:"pricing_id";s:4:"5702";s:5:"quota";i:27;s:9:"activated";i:3;s:15:"activated_local";i:13;s:10:"expiration";N;s:10:"secret_key";s:32:"sk_(H7lEoP+P<W5g?P%P#X@%}*j+&e>@";s:17:"is_free_localhost";b:1;s:17:"is_block_features";b:1;s:12:"is_cancelled";b:0;s:2:"id";s:5:"91267";s:7:"updated";s:19:"2020-01-07 10:50:29";s:7:"created";s:19:"2019-06-19 06:20:40";s:22:"\0FS_Entity\0_is_updated";b:0;s:11:"_is_updated";b:0;}}}s:7:"created";i:1579780637;s:9:"timestamp";i:1579867037;}s:59:"get:/v1/installs/3792710/licenses/267697/subscriptions.json";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":1:{s:13:"subscriptions";a:1:{i:0;O:8:"stdClass":30:{s:11:"total_gross";i:0;s:16:"amount_per_cycle";i:49;s:14:"initial_amount";i:49;s:14:"renewal_amount";i:49;s:17:"renewals_discount";N;s:22:"renewals_discount_type";s:10:"percentage";s:13:"billing_cycle";i:12;s:19:"outstanding_balance";i:0;s:15:"failed_payments";i:0;s:10:"trial_ends";N;s:12:"next_payment";s:19:"2020-12-11 10:08:53";s:11:"canceled_at";N;s:9:"plugin_id";s:4:"5099";s:7:"user_id";s:7:"1131140";s:10:"install_id";N;s:7:"plan_id";s:4:"8333";s:10:"license_id";s:6:"267697";s:2:"ip";s:14:"162.216.140.34";s:11:"external_id";s:18:"sub_GL8OiQaQ56oR7g";s:12:"country_code";s:2:"in";s:6:"vat_id";N;s:9:"coupon_id";N;s:12:"user_card_id";s:5:"60022";s:7:"gateway";s:6:"stripe";s:11:"environment";i:1;s:6:"source";i:0;s:2:"id";s:5:"71201";s:7:"created";s:19:"2019-12-11 10:08:55";s:7:"updated";N;s:8:"currency";s:3:"usd";}}}s:7:"created";i:1579780637;s:9:"timestamp";i:1579867037;}s:98:"get:/v1/installs/3792710/updates/latest.json?is_premium=true&type=all&newer_than=0.2.2&readme=true";O:8:"stdClass":3:{s:6:"result";O:8:"stdClass":3:{s:4:"path";s:41:":/installs/install_id/updates/latest.json";s:5:"error";O:8:"stdClass":5:{s:4:"type";s:0:"";s:7:"message";s:53:"Plugin was not yet deployed or still pending release.";s:4:"code";s:19:"plugin_not_deployed";s:4:"http";i:404;s:9:"timestamp";s:31:"Thu, 23 Jan 2020 11:58:43 +0000";}s:7:"request";O:8:"stdClass":6:{s:10:"is_premium";s:4:"true";s:4:"type";s:3:"all";s:10:"newer_than";s:5:"0.2.2";s:6:"readme";s:4:"true";s:11:"sdk_version";s:5:"2.3.0";s:10:"install_id";s:7:"3792710";}}s:7:"created";i:1579780721;s:9:"timestamp";i:1579782521;}}', 'yes'),
(149, 'fs_gdpr', 'a:1:{s:2:"u1";a:2:{s:8:"required";b:0;s:18:"show_opt_in_notice";b:0;}}', 'yes'),
(152, 'recently_activated', 'a:0:{}', 'yes'),
(153, 'scr_options', 'a:22:{s:24:"review_enable_post-types";s:4:"post";s:20:"enable-author-review";b:1;s:16:"enable-pros-cons";b:1;s:16:"stats-subheading";s:0:"";s:16:"stat-singularity";s:6:"single";s:12:"global_stats";a:1:{i:0;a:1:{s:9:"stat_name";s:7:"Feature";}}s:10:"stats-type";s:4:"star";s:17:"stats-source-type";s:4:"icon";s:23:"stats-show-rating-label";b:1;s:11:"stats-icons";s:4:"star";s:12:"stats-images";s:0:"";s:17:"stats-stars-limit";i:5;s:11:"stats-steps";s:4:"half";s:13:"stats-animate";b:0;s:22:"stats-no-rated-message";s:17:"Not Rated Yet !!!";s:18:"ur_show_list_title";b:1;s:13:"ur_list_title";s:12:"User Reviews";s:18:"ur_show_form_title";b:1;s:13:"ur_form_title";s:14:"Leave a Review";s:13:"ur_show_title";b:1;s:13:"ur_show_stats";b:1;s:19:"ur_show_description";b:1;}', 'yes'),
(154, 'slug_upgrades', 'a:1:{s:3:"0.2";b:1;}', 'yes'),
(155, 'SCR_VERSION', '0.2.2', 'yes'),
(168, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1579780751;}', 'no') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-01-23 11:54:58', '2020-01-23 11:54:58', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2020-01-23 11:54:58', '2020-01-23 11:54:58', '', 0, 'http://127.0.0.1/?p=1', 0, 'post', '', 1),
(2, 1, '2020-01-23 11:54:58', '2020-01-23 11:54:58', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href="http://127.0.0.1/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2020-01-23 11:54:58', '2020-01-23 11:54:58', '', 0, 'http://127.0.0.1/?page_id=2', 0, 'page', '', 0),
(3, 1, '2020-01-23 11:54:58', '2020-01-23 11:54:58', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Our website address is: http://127.0.0.1.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What personal data we collect and why we collect it</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Comments</h3><!-- /wp:heading --><!-- wp:paragraph --><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Media</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Contact forms</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Embedded content from other websites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading {"level":3} --><h3>Analytics</h3><!-- /wp:heading --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Your contact information</h2><!-- /wp:heading --><!-- wp:heading --><h2>Additional information</h2><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>How we protect your data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What data breach procedures we have in place</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What third parties we receive data from</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>What automated decision making and/or profiling we do with user data</h3><!-- /wp:heading --><!-- wp:heading {"level":3} --><h3>Industry regulatory disclosure requirements</h3><!-- /wp:heading -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2020-01-23 11:54:58', '2020-01-23 11:54:58', '', 0, 'http://127.0.0.1/?page_id=3', 0, 'page', '', 0),
(4, 1, '2020-01-23 11:55:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-01-23 11:55:20', '0000-00-00 00:00:00', '', 0, 'http://127.0.0.1/?p=4', 0, 'post', '', 0) ;

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
(1, 1, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1) ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_termmeta`
#

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


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
(16, 1, 'session_tokens', 'a:1:{s:64:"0a15e03d7122826ae010c8aa4b4eb4f3a9057de467a0f67d589986dafb443f2c";a:4:{s:10:"expiration";i:1580990118;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Safari/537.36";s:5:"login";i:1579780518;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:12:"192.168.95.0";}') ;

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
(1, 'admin', '$P$BUxJbYZuu3apOPgN/Upl9Gy.SOKkkV0', 'admin', 'dev-email@flywheel.local', '', '2020-01-23 11:54:58', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

