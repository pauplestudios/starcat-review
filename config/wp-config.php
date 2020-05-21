<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp');

/** MySQL database username */
define( 'DB_USER', 'wp');

/** MySQL database password */
define( 'DB_PASSWORD', 'pass');

/** MySQL hostname */
define( 'DB_HOST', 'db');

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '72d8367e5ccc63af0fdcb186463a0c4bc771b866');
define( 'SECURE_AUTH_KEY',  'f3a88ad1c55d6bc71558ae5ea2bfb6fe2b00856c');
define( 'LOGGED_IN_KEY',    '8b922a8c0bb3cc9ad2bff967b7675e7d33440b80');
define( 'NONCE_KEY',        '112df962456cbd3ad7902d5cacdc632871ab1754');
define( 'AUTH_SALT',        'd1e9469f87c1da2c5b0e15d68ca7f93c01d53149');
define( 'SECURE_AUTH_SALT', 'd1e9671e2636b8d29caf4e3297f5e41913c3d1fb');
define( 'LOGGED_IN_SALT',   '3c2a9910f4714be3a1705eb0dabd4ca3ed848057');
define( 'NONCE_SALT',       'f85be7795b9e068a75224e1ad22e98e6727b2ef8');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

// If we're behind a proxy server and using HTTPS, we need to alert WordPress of that fact
// see also http://codex.wordpress.org/Administration_Over_SSL#Using_a_Reverse_Proxy
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
	$_SERVER['HTTPS'] = 'on';
}

// WORDPRESS_CONFIG_EXTRA
/* Freemius Dev Mode */
/* Set Freemius into development mode */
define( 'WP_FS__DEV_MODE', true );
define( 'WP_FS__starcat-review_SECRET_KEY', 'sk_t=d7~:gkVF1Sw0SJeG!06F[J$dHQ;' );
/* Skip email activation when a user with the same email already opted-in */
define( 'WP_FS__SKIP_EMAIL_ACTIVATION', true );
/* If Freemius was not setup */
/* define( 'WP_FS__SIMULATE_FREEMIUS_OFF', true ); */


/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
