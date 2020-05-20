# WordPress MySQL database migration
#
# Generated: Friday 28. June 2019 06:50 UTC
# Hostname: db
# Database: `helpiekb_test`
# URL: //127.0.0.1
# Path: /var/www/html
# Tables: wp_commentmeta, wp_comments, wp_helpie_chat_contacts, wp_helpie_chat_conversations, wp_helpie_chat_messages, wp_links, wp_options, wp_postmeta, wp_posts, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users
# Table Prefix: wp_
# Post Types: revision, page, pauple_helpie, post
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
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-11-08 09:48:55', '2018-11-08 09:48:55', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_helpie_chat_contacts`
#

DROP TABLE IF EXISTS `wp_helpie_chat_contacts`;


#
# Table structure of table `wp_helpie_chat_contacts`
#

CREATE TABLE `wp_helpie_chat_contacts` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `email` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_helpie_chat_contacts`
#
INSERT INTO `wp_helpie_chat_contacts` ( `contact_id`, `user_id`, `createdAt`, `email`, `avatar`) VALUES
(1, 1, '2018-11-09 05:23:28', 'dev-email@flywheel.local', ''),
(2, 0, '2018-11-09 05:48:55', '', ''),
(3, 0, '2018-11-09 06:54:28', '', ''),
(4, 0, '2018-11-09 08:42:26', '', ''),
(5, 0, '2018-11-09 08:48:57', '', ''),
(6, 0, '2018-11-09 09:32:21', '', ''),
(7, 0, '2018-11-09 09:37:51', '', ''),
(8, 0, '2018-11-09 09:37:59', '', ''),
(9, 0, '2018-11-09 09:38:32', '', ''),
(10, 0, '2018-11-09 09:42:28', '', ''),
(11, 0, '2018-11-09 09:42:37', '', ''),
(12, 0, '2018-11-09 09:42:37', '', ''),
(13, 0, '2018-11-09 09:42:48', '', ''),
(14, 0, '2018-11-09 09:44:23', '', ''),
(15, 0, '2018-11-09 09:48:59', '', ''),
(16, 0, '2018-11-09 10:48:56', '', ''),
(17, 0, '2018-11-09 10:50:46', '', ''),
(18, 0, '2018-11-09 10:54:47', '', ''),
(19, 0, '2018-11-09 10:56:36', '', ''),
(20, 0, '2018-11-09 10:58:08', '', ''),
(21, 0, '2018-11-09 11:06:13', '', ''),
(22, 0, '2018-11-09 11:09:29', '', ''),
(23, 0, '2018-11-09 11:12:15', '', ''),
(24, 0, '2018-11-09 11:14:32', '', ''),
(25, 0, '2018-11-09 11:20:35', '', ''),
(26, 0, '2018-11-10 11:10:03', '', ''),
(27, 0, '2018-11-10 11:11:15', '', ''),
(28, 0, '2018-11-15 09:24:57', '', ''),
(29, 0, '2018-11-15 09:24:57', '', ''),
(30, 0, '2018-11-15 09:26:26', '', '') ;

#
# End of data contents of table `wp_helpie_chat_contacts`
# --------------------------------------------------------



#
# Delete any existing table `wp_helpie_chat_conversations`
#

DROP TABLE IF EXISTS `wp_helpie_chat_conversations`;


#
# Table structure of table `wp_helpie_chat_conversations`
#

CREATE TABLE `wp_helpie_chat_conversations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `agent_contact_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tag` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_helpie_chat_conversations`
#
INSERT INTO `wp_helpie_chat_conversations` ( `ID`, `contact_id`, `agent_contact_id`, `timestamp`, `message`, `subject`, `tag`, `status`) VALUES
(1, 1, 1, '2018-11-09 05:32:24', 'qwer', 'qwer', '', 'open'),
(2, 6, 0, '2018-11-09 09:32:30', 'NEw Conversation', 'NEw Conversation', '', 'open'),
(3, 8, 0, '2018-11-09 09:38:12', 'The good news', 'The good news', '', 'open'),
(4, 9, 0, '2018-11-09 09:38:53', 'qwerty', 'qwerty', '', 'open'),
(5, 13, 0, '2018-11-09 09:42:55', 'fddfdf', 'fddfdf', '', 'open'),
(6, 14, 0, '2018-11-09 09:44:30', 'iikkk', 'iikkk', '', 'open'),
(7, 17, 0, '2018-11-09 10:51:00', 'The new new', 'The new new', '', 'open'),
(8, 18, 0, '2018-11-09 10:55:12', 'Query', 'Query', '', 'open'),
(9, 19, 0, '2018-11-09 10:56:44', 'Query', 'Query', '', 'open'),
(10, 20, 0, '2018-11-09 10:58:15', 'Query', 'Query', '', 'open'),
(11, 21, 0, '2018-11-09 11:06:24', 'Aster.', 'Aster.', '', 'open'),
(12, 22, 0, '2018-11-09 11:09:37', 'Qwerty', 'Qwerty', '', 'open'),
(13, 23, 0, '2018-11-09 11:12:23', 'Querty', 'Querty', '', 'open'),
(14, 24, 0, '2018-11-09 11:14:47', 'qqq', 'qqq', '', 'open') ;

#
# End of data contents of table `wp_helpie_chat_conversations`
# --------------------------------------------------------



#
# Delete any existing table `wp_helpie_chat_messages`
#

DROP TABLE IF EXISTS `wp_helpie_chat_messages`;


#
# Table structure of table `wp_helpie_chat_messages`
#

CREATE TABLE `wp_helpie_chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `type` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `feedback` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` varchar(700) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_helpie_chat_messages`
#
INSERT INTO `wp_helpie_chat_messages` ( `id`, `conversation_id`, `timestamp`, `type`, `feedback`, `message`, `contact_id`) VALUES
(1, 1, '2018-11-09 05:25:35', 'text', '', 'qwer', 1),
(2, 1, '2018-11-09 05:32:24', 'text', '', 'lol', 1),
(3, 1, '2018-11-09 06:39:46', 'text', '', 'pool', 1),
(4, 1, '2018-11-09 06:42:03', 'text', '', 'qwww', 1),
(5, 1, '2018-11-09 06:44:30', 'text', '', 'good', 1),
(6, 1, '2018-11-09 09:13:10', 'text', '', 'pool', 1),
(7, 1, '2018-11-09 09:21:58', 'text', '', 'cool', 1),
(8, 2, '2018-11-09 09:32:30', 'text', '', 'NEw Conversation', 6),
(9, 3, '2018-11-09 09:38:12', 'text', '', 'The good news', 8),
(10, 4, '2018-11-09 09:38:53', 'text', '', 'qwerty', 9),
(11, 5, '2018-11-09 09:42:55', 'text', '', 'fddfdf', 13),
(12, 6, '2018-11-09 09:44:30', 'text', '', 'iikkk', 14),
(13, 6, '2018-11-09 09:44:51', 'text', '', 'hbh', 14),
(14, 7, '2018-11-09 10:51:00', 'text', '', 'The new new', 17),
(15, 8, '2018-11-09 10:55:12', 'text', '', 'Query', 18),
(16, 9, '2018-11-09 10:56:44', 'text', '', 'Query', 19),
(17, 10, '2018-11-09 10:58:15', 'text', '', 'Query', 20),
(18, 11, '2018-11-09 11:06:24', 'text', '', 'Aster.', 21),
(19, 12, '2018-11-09 11:09:37', 'text', '', 'Qwerty', 22),
(20, 13, '2018-11-09 11:12:23', 'text', '', 'Querty', 23),
(21, 14, '2018-11-09 11:14:47', 'text', '', 'qqq', 24) ;

#
# End of data contents of table `wp_helpie_chat_messages`
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
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://127.0.0.1', 'yes'),
(2, 'home', 'http://127.0.0.1', 'yes'),
(3, 'blogname', 'Helpie Plugin', 'yes'),
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
(29, 'rewrite_rules', 'a:130:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:16:"pauple_helpie/?$";s:33:"index.php?post_type=pauple_helpie";s:46:"pauple_helpie/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_type=pauple_helpie&feed=$matches[1]";s:41:"pauple_helpie/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_type=pauple_helpie&feed=$matches[1]";s:33:"pauple_helpie/page/([0-9]{1,})/?$";s:51:"index.php?post_type=pauple_helpie&paged=$matches[1]";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:41:"pauple_helpie/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"pauple_helpie/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"pauple_helpie/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"pauple_helpie/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"pauple_helpie/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:47:"pauple_helpie/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:30:"pauple_helpie/([^/]+)/embed/?$";s:46:"index.php?pauple_helpie=$matches[1]&embed=true";s:34:"pauple_helpie/([^/]+)/trackback/?$";s:40:"index.php?pauple_helpie=$matches[1]&tb=1";s:54:"pauple_helpie/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?pauple_helpie=$matches[1]&feed=$matches[2]";s:49:"pauple_helpie/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?pauple_helpie=$matches[1]&feed=$matches[2]";s:42:"pauple_helpie/([^/]+)/page/?([0-9]{1,})/?$";s:53:"index.php?pauple_helpie=$matches[1]&paged=$matches[2]";s:49:"pauple_helpie/([^/]+)/comment-page-([0-9]{1,})/?$";s:53:"index.php?pauple_helpie=$matches[1]&cpage=$matches[2]";s:38:"pauple_helpie/([^/]+)(?:/([0-9]+))?/?$";s:52:"index.php?pauple_helpie=$matches[1]&page=$matches[2]";s:30:"pauple_helpie/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:40:"pauple_helpie/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:60:"pauple_helpie/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"pauple_helpie/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:55:"pauple_helpie/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"pauple_helpie/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:58:"helpdesk_category/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?helpdesk_category=$matches[1]&feed=$matches[2]";s:53:"helpdesk_category/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?helpdesk_category=$matches[1]&feed=$matches[2]";s:34:"helpdesk_category/([^/]+)/embed/?$";s:50:"index.php?helpdesk_category=$matches[1]&embed=true";s:46:"helpdesk_category/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?helpdesk_category=$matches[1]&paged=$matches[2]";s:28:"helpdesk_category/([^/]+)/?$";s:39:"index.php?helpdesk_category=$matches[1]";s:51:"helpie_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?helpie_tag=$matches[1]&feed=$matches[2]";s:46:"helpie_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?helpie_tag=$matches[1]&feed=$matches[2]";s:27:"helpie_tag/([^/]+)/embed/?$";s:43:"index.php?helpie_tag=$matches[1]&embed=true";s:39:"helpie_tag/([^/]+)/page/?([0-9]{1,})/?$";s:50:"index.php?helpie_tag=$matches[1]&paged=$matches[2]";s:21:"helpie_tag/([^/]+)/?$";s:32:"index.php?helpie_tag=$matches[1]";s:55:"helpie_add_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?helpie_add_tag=$matches[1]&feed=$matches[2]";s:50:"helpie_add_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:53:"index.php?helpie_add_tag=$matches[1]&feed=$matches[2]";s:31:"helpie_add_tag/([^/]+)/embed/?$";s:47:"index.php?helpie_add_tag=$matches[1]&embed=true";s:43:"helpie_add_tag/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?helpie_add_tag=$matches[1]&paged=$matches[2]";s:25:"helpie_add_tag/([^/]+)/?$";s:36:"index.php?helpie_add_tag=$matches[1]";s:54:"helpie_up_tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?helpie_up_tag=$matches[1]&feed=$matches[2]";s:49:"helpie_up_tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?helpie_up_tag=$matches[1]&feed=$matches[2]";s:30:"helpie_up_tag/([^/]+)/embed/?$";s:46:"index.php?helpie_up_tag=$matches[1]&embed=true";s:42:"helpie_up_tag/([^/]+)/page/?([0-9]{1,})/?$";s:53:"index.php?helpie_up_tag=$matches[1]&paged=$matches[2]";s:24:"helpie_up_tag/([^/]+)/?$";s:35:"index.php?helpie_up_tag=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:1:{i:0;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'twentyseventeen', 'yes'),
(41, 'stylesheet', 'twentyseventeen', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
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
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:72:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:26:"read_pauple_helpie_article";b:1;s:35:"read_private_pauple_helpie_articles";b:1;s:26:"edit_pauple_helpie_article";b:1;s:27:"edit_pauple_helpie_articles";b:1;s:34:"edit_others_pauple_helpie_articles";b:1;s:37:"edit_published_pauple_helpie_articles";b:1;s:30:"publish_pauple_helpie_articles";b:1;s:28:"manage_pauple_helpie_article";b:1;s:36:"delete_others_pauple_helpie_articles";b:1;s:37:"delete_private_pauple_helpie_articles";b:1;s:39:"delete_published_pauple_helpie_articles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'sidebars_widgets', 'a:5:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'nonce_key', 'EPsT}9wj?.?ugc7lu)k9bD7e-Um@rYAK>~_;*hmfEOGh#};~B+6FC~qEyAg%WBK7', 'no'),
(109, 'nonce_salt', 'A[x4hwoA5`y?MDD}wThG1grZ[]P^-ikf24hHCp7G=k-0Cq:~lv]l9B7d)j|Y,s2h', 'no'),
(110, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'cron', 'a:5:{i:1561708135;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1561715335;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1561785782;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1561786261;a:1:{s:32:"recovery_mode_clean_expired_keys";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(114, 'theme_mods_twentyseventeen', 'a:1:{s:18:"custom_css_post_id";i:-1;}', 'yes'),
(147, 'recently_activated', 'a:0:{}', 'yes'),
(203, 'helpie_mp_options', 'a:12:{s:24:"main_page_search_display";s:2:"on";s:20:"main_page_categories";s:2:"on";s:17:"main_page_popular";s:2:"on";s:14:"helpie_mp_slug";s:13:"pauple_helpie";s:26:"helpie_mp_sidebar_template";s:11:"boxed-width";s:18:"helpie_mp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_mp_sidebar2";s:14:"helpie_sidebar";s:18:"helpie_mp_template";s:5:"boxed";s:17:"helpie_mp_cl_cols";s:5:"three";s:25:"helpie_mp_no_cat_articles";s:1:"5";s:18:"helpie_mp_location";s:7:"archive";s:30:"category_listing_children_type";s:4:"none";}', 'yes'),
(204, 'helpie_core_options_main', 'a:3:{s:13:"kb_main_title";s:8:"Helpdesk";s:16:"kb_main_subtitle";s:21:"We’re here to help.";s:18:"kb_edit_capability";a:1:{s:18:"kb_edit_capability";s:21:"administrator, editor";}}', 'yes'),
(205, 'helpie_style_options', 'a:7:{s:26:"helpie_brand_primary_color";s:7:"#F4F3F3";s:24:"helpie_brand_title_color";s:7:"#03363d";s:20:"helpie_wa_text_color";s:7:"#03363d";s:25:"helpie_show_search_border";s:0:"";s:26:"helpie_search_border_color";s:0:"";s:26:"helpie_search_border_style";s:7:"squared";s:30:"helpie_search_placeholder_text";s:25:"What can I help you with?";}', 'yes'),
(206, 'helpie_components_options', 'a:9:{s:18:"helpie_breadcrumbs";s:2:"on";s:25:"helpie_sidebar_cat_toggle";s:2:"on";s:23:"helpie_sidebar_auto_toc";s:2:"on";s:21:"helpie_auto_toc_title";s:15:"In This Article";s:32:"helpie_auto_toc_section_page_url";s:2:"on";s:37:"helpie_auto_toc_section_page_url_text";s:9:"helpie-sp";s:32:"helpie_auto_toc_back_to_top_text";s:11:"Back to Top";s:39:"helpie_auto_toc_scroll_back_to_site_top";s:0:"";s:29:"helpie_auto_toc_smooth_scroll";s:2:"on";}', 'yes'),
(207, 'helpie_sp_options', 'a:10:{s:18:"helpie_sp_template";s:12:"left-sidebar";s:18:"helpie_sp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_sp_sidebar2";s:14:"helpie_sidebar";s:19:"helpie_sp_cpt_label";s:7:"Article";s:26:"helpie_sp_cpt_label_plural";s:8:"Articles";s:26:"helpie_sp_show_edit_button";s:0:"";s:22:"helpie_voting_template";s:7:"emotion";s:36:"helpie_single_page_updatedby_display";s:2:"on";s:33:"helpie_single_page_search_display";s:2:"on";s:13:"article_order";s:10:"menu_order";}', 'yes'),
(208, 'helpie_cp_options', 'a:5:{s:18:"helpie_cp_template";s:12:"left-sidebar";s:18:"helpie_cp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_cp_sidebar2";s:14:"helpie_sidebar";s:14:"helpie_cp_slug";s:17:"helpdesk_category";s:30:"helpie_cat_page_search_display";s:2:"on";}', 'yes'),
(209, 'pauple_helpie_plugin_version', '1.9.1.1', 'yes'),
(210, 'helpie_show_added_tags', 'a:1:{i:0;s:3:"all";}', 'yes'),
(211, 'helpie_show_updated_tags', 'a:1:{i:0;s:3:"all";}', 'yes'),
(212, 'kb_edit_capability', 'a:1:{i:0;s:13:"administrator";}', 'yes'),
(214, 'helpdesk_search_page_id', '7', 'yes'),
(215, 'helpie_editor_page_id', '8', 'yes'),
(216, 'widget_helpie-kb-article-listing', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(217, 'widget_helpie-category-listing-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(218, 'widget_helpie-kb-hero-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(219, 'widget_helpie-kb-frontend-stats-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(220, 'widget_helpie-kb-toc-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(221, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1561704630;}', 'no'),
(230, 'recovery_keys', 'a:0:{}', 'yes'),
(231, 'db_upgraded', '', 'yes'),
(237, 'can_compress_scripts', '0', 'no'),
(268, 'widget_helpie-kb-voting-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(269, 'widget_helpie-kb-breadcrumbs-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(270, 'widget_helpie-kb-search-results-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(271, 'widget_helpie-kb-page-controls-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(272, 'widget_helpie-kb-search-box-widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(273, 'helpie-kb', 'a:101:{s:26:"helpie_mp_sidebar_template";s:11:"boxed-width";s:18:"helpie_mp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_mp_sidebar2";s:14:"helpie_sidebar";s:18:"helpie_mp_location";s:7:"archive";s:21:"helpie_mp_select_page";s:0:"";s:14:"helpie_mp_slug";s:13:"pauple_helpie";s:21:"mp_hero_section_order";a:3:{s:13:"kb_main_title";s:8:"Helpdesk";s:24:"main_page_search_display";s:1:"1";s:16:"kb_main_subtitle";s:21:"We’re here to help.";}s:20:"helpie_mp_meta_title";s:8:"helpdesk";s:26:"helpie_mp_meta_description";s:20:"We are here to help.";s:19:"mp_components_order";a:3:{s:20:"helpie_mp_show_stats";s:1:"0";s:20:"main_page_categories";s:1:"1";s:20:"show_article_listing";s:1:"0";}s:31:"helpie_mp_article_listing_title";s:18:"KB Article Listing";s:32:"helpie_mp_article_listing_sortby";s:6:"recent";s:32:"helpie_mp_article_listing_topics";a:1:{i:0;s:3:"all";}s:31:"helpie_mp_article_listing_style";s:4:"list";s:37:"helpie_mp_article_listing_num_of_cols";s:5:"three";s:36:"helpie_mp_article_listing_show_image";s:4:"true";s:36:"helpie_mp_article_listing_show_extra";s:4:"true";s:31:"helpie_mp_article_listing_limit";s:1:"5";s:18:"helpie_mp_template";s:5:"boxed";s:27:"helpie_mp_boxed_description";s:1:"0";s:29:"category_listing_graphic_type";s:5:"image";s:30:"category_listing_children_type";s:4:"none";s:17:"helpie_mp_cl_cols";s:5:"three";s:25:"helpie_mp_no_cat_articles";s:1:"5";s:14:"helpie_mp_cats";a:2:{s:7:"enabled";a:1:{s:9:"term-id_2";s:15:"Getting Started";}s:8:"disabled";a:0:{}}s:25:"helpie_sp_template_source";s:6:"helpie";s:18:"helpie_sp_template";s:12:"left-sidebar";s:18:"helpie_sp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_sp_sidebar2";s:14:"helpie_sidebar";s:19:"helpie_sp_cpt_label";s:7:"Article";s:26:"helpie_sp_cpt_label_plural";s:8:"Articles";s:33:"helpie_single_page_search_display";s:1:"1";s:36:"helpie_single_page_updatedby_display";s:1:"1";s:36:"helpie_single_page_updatedon_display";s:1:"0";s:33:"helpie_single_page_show_pageviews";s:1:"0";s:22:"helpie_voting_template";s:7:"emotion";s:19:"helpie_voting_label";s:30:"How did you like this article?";s:20:"helpie_voting_access";s:1:"0";s:20:"helpie_show_comments";s:1:"0";s:23:"helpie_post_title_color";s:7:"#777777";s:18:"helpie_cp_template";s:12:"left-sidebar";s:18:"helpie_cp_sidebar1";s:14:"helpie_sidebar";s:18:"helpie_cp_sidebar2";s:14:"helpie_sidebar";s:30:"helpie_cat_page_search_display";s:1:"0";s:14:"helpie_cp_slug";s:17:"helpdesk_category";s:22:"helpie_cat_title_color";s:7:"#777777";s:28:"helpie_cp_article_list_style";s:5:"boxed";s:30:"helpie_cp_article_list_columns";s:3:"two";s:33:"helpie_cp_article_text-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:24:"helpie_cp_article_border";a:6:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:5:"style";s:5:"solid";s:5:"color";s:0:"";}s:24:"helpie_cp_article_margin";a:5:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:4:"unit";s:2:"px";}s:28:"helpie_cp_article_icon_color";s:0:"";s:33:"helpie_cp_child_category_template";s:5:"boxed";s:30:"helpie_search_placeholder_text";s:25:"What can I help you with?";s:20:"search_no_query_text";s:25:"Please search something !";s:25:"empty_search_result_label";s:28:"Did not match any articles !";s:38:"helpie_search_page_featured_image_show";s:1:"1";s:33:"helpie_search_page_meta_data_show";s:1:"1";s:35:"helpie_search_page_description_show";s:1:"1";s:28:"helpie_search_page_tags_show";s:1:"1";s:37:"helpie_search_page_description_length";s:3:"200";s:24:"search-header-typography";a:11:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:23:"search-title-typography";a:11:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:21:"search-cat-typography";a:11:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:22:"search-meta-typography";a:11:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:22:"search-text-typography";a:11:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:37:"helpiekb_search_results_single_border";a:6:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:5:"style";s:5:"solid";s:5:"color";s:0:"";}s:38:"helpiekb_search_results_single_padding";a:5:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:4:"unit";s:2:"px";}s:37:"helpiekb_search_results_single_margin";a:5:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:4:"unit";s:2:"px";}s:25:"helpie_show_search_border";s:1:"0";s:26:"helpie_search_border_color";s:0:"";s:26:"helpie_search_border_style";s:7:"squared";s:18:"kb_frontend_enable";s:1:"0";s:19:"kb_num_of_revisions";s:2:"20";s:14:"kb_editor_type";s:6:"inline";s:6:"design";a:20:{s:22:"helpiekb-wrapper-width";a:2:{s:5:"width";s:3:"980";s:4:"unit";s:2:"px";}s:25:"helpie_margin_top_desktop";s:1:"0";s:24:"helpie_margin_top_tablet";s:1:"0";s:24:"helpie_margin_top_mobile";s:1:"0";s:13:"h1-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:13:"h2-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:13:"h3-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:13:"h4-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:13:"h5-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:13:"h6-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:12:"p-typography";a:12:{s:11:"font-family";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:0:"";s:6:"subset";s:0:"";s:10:"text-align";s:0:"";s:14:"text-transform";s:0:"";s:9:"font-size";s:0:"";s:11:"line-height";s:0:"";s:14:"letter-spacing";s:0:"";s:5:"color";s:0:"";s:4:"type";s:0:"";s:4:"unit";s:2:"px";}s:25:"helpie_wa_background_type";s:12:"single-color";s:26:"helpie_brand_primary_color";s:7:"#F4F3F3";s:15:"helpie_wa_image";a:8:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:5:"width";s:0:"";s:6:"height";s:0:"";s:9:"thumbnail";s:0:"";s:3:"alt";s:0:"";s:5:"title";s:0:"";s:11:"description";s:0:"";}s:22:"helpie_wa_illustration";s:10:"team-space";s:19:"helpie_wa_gradient1";s:7:"#777777";s:19:"helpie_wa_gradient2";s:7:"#777777";s:24:"helpie_brand_title_color";s:7:"#03363d";s:20:"helpie_wa_text_color";s:7:"#03363d";s:19:"helpiekb_wa_padding";a:5:{s:3:"top";s:0:"";s:5:"right";s:0:"";s:6:"bottom";s:0:"";s:4:"left";s:0:"";s:4:"unit";s:2:"px";}}s:25:"helpie_dynamic_capability";a:4:{s:8:"can_view";a:2:{s:4:"type";s:4:"none";s:4:"rule";s:0:"";}s:8:"can_edit";a:2:{s:4:"type";s:5:"roles";s:4:"rule";s:4:"only";}s:11:"can_publish";a:2:{s:4:"type";s:4:"none";s:4:"rule";s:0:"";}s:11:"can_approve";a:2:{s:4:"type";s:4:"none";s:4:"rule";s:0:"";}}s:20:"helpie_sidebar_title";s:17:"Table of Contents";s:20:"helpie_sidebar_fixed";s:1:"0";s:19:"helpie_sidebar_type";s:8:"full-nav";s:23:"helpie_sidebar_auto_toc";s:1:"1";s:25:"helpie_sidebar_categories";s:3:"all";s:35:"helpie_sidebar_category_anchor_link";s:1:"0";s:36:"helpie_sidebar_num_of_child_category";s:1:"5";s:30:"helpie_sidebar_num_of_articles";s:1:"5";s:28:"helpie_sidebar_show_articles";s:1:"0";s:21:"helpie_auto_toc_title";s:15:"In This Article";s:22:"helpie_auto_toc_bullet";s:1:"0";s:32:"helpie_auto_toc_section_page_url";s:1:"1";s:37:"helpie_auto_toc_section_page_url_text";s:9:"helpie-sp";s:32:"helpie_auto_toc_back_to_top_link";s:1:"0";s:32:"helpie_auto_toc_back_to_top_text";s:11:"Back to Top";s:39:"helpie_auto_toc_scroll_back_to_site_top";s:1:"0";s:29:"helpie_auto_toc_smooth_scroll";s:1:"1";s:18:"autolinking_enable";s:0:"";s:18:"helpie_breadcrumbs";s:1:"1";s:13:"article_order";s:10:"menu_order";s:25:"helpie_mp_article_listing";s:0:"";s:22:"mp_categories_settings";s:0:"";s:23:"helpie_password_options";s:0:"";s:32:"helpie_auto_toc_exclude_headings";s:0:"";}', 'yes'),
(274, 'helpie_kb_category_last_order', '1', 'yes'),
(275, 'helpie_kb_upgrades', 'a:3:{s:5:"1.8.1";b:1;s:5:"1.9.0";b:1;s:5:"1.9.1";b:1;}', 'yes'),
(293, 'helpdesk_category_children', 'a:0:{}', 'yes'),
(296, 'ftp_credentials', 'a:3:{s:8:"hostname";s:9:"127.0.0.1";s:8:"username";s:5:"admin";s:15:"connection_type";s:3:"ftp";}', 'yes') ;

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
(2, 3, '_wp_page_template', 'default'),
(3, 5, 'last_approved_revision', '6'),
(4, 5, 'ph_pageviews', '5') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-11-08 09:48:55', '2018-11-08 09:48:55', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-11-08 09:48:55', '2018-11-08 09:48:55', '', 0, 'http://127.0.0.1/?p=1', 0, 'post', '', 1),
(2, 1, '2018-11-08 09:48:55', '2018-11-08 09:48:55', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://127.0.0.1/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2018-11-08 09:48:55', '2018-11-08 09:48:55', '', 0, 'http://127.0.0.1/?page_id=2', 0, 'page', '', 0),
(3, 1, '2018-11-08 09:48:55', '2018-11-08 09:48:55', '<h2>Who we are</h2><p>Our website address is: http://127.0.0.1.</p><h2>What personal data we collect and why we collect it</h2><h3>Comments</h3><p>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><h3>Media</h3><p>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><h3>Contact forms</h3><h3>Cookies</h3><p>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><p>If you have an account and you log in to this site, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><h3>Embedded content from other websites</h3><p>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><h3>Analytics</h3><h2>Who we share your data with</h2><h2>How long we retain your data</h2><p>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><h2>What rights you have over your data</h2><p>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><h2>Where we send your data</h2><p>Visitor comments may be checked through an automated spam detection service.</p><h2>Your contact information</h2><h2>Additional information</h2><h3>How we protect your data</h3><h3>What data breach procedures we have in place</h3><h3>What third parties we receive data from</h3><h3>What automated decision making and/or profiling we do with user data</h3><h3>Industry regulatory disclosure requirements</h3>', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2018-11-08 09:48:55', '2018-11-08 09:48:55', '', 0, 'http://127.0.0.1/?page_id=3', 0, 'page', '', 0),
(4, 1, '2018-11-09 05:23:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-11-09 05:23:05', '0000-00-00 00:00:00', '', 0, 'http://127.0.0.1/?p=4', 0, 'post', '', 0),
(5, 1, '2018-11-15 09:29:15', '2018-11-15 09:29:15', 'demo text', 'Your first Knowledge Base Article', '', 'publish', 'open', 'closed', '', 'your-first-knowledge-base-article', '', '', '2018-11-15 09:29:15', '2018-11-15 09:29:15', '', 0, 'http://127.0.0.1/pauple_helpie/your-first-knowledge-base-article/', 0, 'pauple_helpie', '', 0),
(6, 1, '2018-11-15 09:29:15', '2018-11-15 09:29:15', 'demo text', 'Your first Knowledge Base Article', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-11-15 09:29:15', '2018-11-15 09:29:15', '', 5, 'http://127.0.0.1/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2018-11-15 09:29:15', '2018-11-15 09:29:15', '[pauple_helpie_search_results_page]', 'Helpdesk Search', '', 'publish', 'closed', 'closed', '', 'helpdesk_search', '', '', '2019-06-28 06:39:20', '2019-06-28 06:39:20', '', 0, 'http://127.0.0.1/helpdesk_search/', 0, 'page', '', 0),
(8, 1, '2018-11-15 09:29:15', '2018-11-15 09:29:15', '', 'Helpie Editor', '', 'publish', 'closed', 'closed', '', 'helpie_editor_page', '', '', '2018-11-15 09:29:15', '2018-11-15 09:29:15', '', 0, 'http://127.0.0.1/helpie_editor_page/', 0, 'page', '', 0),
(9, 1, '2019-06-28 06:39:20', '2019-06-28 06:39:20', '[pauple_helpie_search_results_page]', 'Helpdesk Search', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2019-06-28 06:39:20', '2019-06-28 06:39:20', '', 7, 'http://127.0.0.1/7-revision-v1/', 0, 'revision', '', 0) ;

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
(5, 2, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'helpdesk_category', '', 0, 1) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_termmeta`
#
INSERT INTO `wp_termmeta` ( `meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'term_order', '0'),
(2, 2, '_helpie_kb_options', 'a:4:{s:8:"can_view";a:3:{s:4:"type";s:7:"default";s:4:"rule";s:10:"all_except";s:5:"roles";a:4:{i:0;s:6:"editor";i:1;s:6:"author";i:2;s:11:"contributor";i:3;s:10:"subscriber";}}s:8:"can_edit";a:2:{s:4:"type";s:7:"default";s:4:"rule";s:0:"";}s:11:"can_publish";a:2:{s:4:"type";s:7:"default";s:4:"rule";s:0:"";}s:11:"can_approve";a:2:{s:4:"type";s:7:"default";s:4:"rule";s:0:"";}}'),
(3, 2, 'category-image-id', '') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Getting Started', 'getting-started', 0) ;

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
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:4:{s:64:"d140f683ff7223cc94186f60ff4fceaa0259aca9ab44ae72047eb2779c8032cd";a:4:{s:10:"expiration";i:1561872679;s:2:"ip";s:10:"172.29.0.1";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1561699879;}s:64:"7898c53eef22b4ed7514c615f874b3d3b7fff74981ddb0b5bfe4936cbdda2341";a:4:{s:10:"expiration";i:1561876752;s:2:"ip";s:13:"192.168.112.1";s:2:"ua";s:18:"Symfony BrowserKit";s:5:"login";i:1561703952;}s:64:"a90f4521b95a867e852b32fa13476f15bb8e5300856e93f01e8b5ccd41d66714";a:4:{s:10:"expiration";i:1561876825;s:2:"ip";s:13:"192.168.112.1";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1561704025;}s:64:"e67b8430bebc3a1e84c55cab75531f30a5a25832c4c10b88faac9c52798e7df1";a:4:{s:10:"expiration";i:1561877395;s:2:"ip";s:13:"192.168.112.1";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36";s:5:"login";i:1561704595;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:"ip";s:13:"192.168.112.0";}') ;

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
(1, 'admin', '$P$BNMHMHnViKHw8./dYuLUnz2BnF4RZ00', 'admin', 'dev-email@flywheel.local', '', '2018-11-08 09:48:55', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

