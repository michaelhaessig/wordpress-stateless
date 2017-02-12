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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', '172.17.0.1:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '9O-&%QMiWd5BO|=:HIK;oUcf<0iJ{2g]Y@}lS#qvA3[Y|vtKu+Jg||f:p4).>$7D');
define('SECURE_AUTH_KEY',  '(_$x4F:-?[jlzsMz&MZi/YwC?9,K{A~|%`fZ{!l}$QAd9G9_VTd$hs{jYf&LHa9Z');
define('LOGGED_IN_KEY',    'ijT+!hda#5^d?--Od7u-HzK 2zQYE Ncj:QPUZz;-b+]@`uI5o1d<L%19&0KZSM%');
define('NONCE_KEY',        'QQg;lCdf(d7]nLG/(CX6U)15ovv[UhZ|zUcI#lUx`gC-$+VGY_+={EXGP^0[zO~m');
define('AUTH_SALT',        'm<XKNJi~;hcB,+,i1fGcpT5c$j?>--={N|d~V8PAvmUok$d:}?Br(cJV8]P9?yn>');
define('SECURE_AUTH_SALT', 'fM9MJcn^L&LkGk _,W5#, _;5@#+Sf`S!6:s6d!YUe+DaiWG4A3o+nRQQYnE4<nm');
define('LOGGED_IN_SALT',   'w1ZGR>N{xjqCWKL?)dhx(,Z8nn;p]yyXpq@}/f-]RBt|+.+IO]EvBb^+Nnb0_/x,');
define('NONCE_SALT',       '.(Vm3liIq`q->wlgaTMkmpVa+|m|L`S/NWa0)@`&,O*UIEDyF|9xI3BYUXh,E-c@');


/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


define('WP_DEBUG', false);
define('WP_DEBUG_DISPLAY', false);
define('WP_DEBUG_LOG', false);
define('COOKIE_DOMAIN','');



define( 'WP_ALLOW_MULTISITE', true );
define( 'MULTISITE', true );
define( 'SUBDOMAIN_INSTALL', true );
$base = '/';
define( 'DOMAIN_CURRENT_SITE', 'www.mywordpress.local' );
define( 'PATH_CURRENT_SITE', '/' );
define( 'SITE_ID_CURRENT_SITE', 1 );
define( 'BLOG_ID_CURRENT_SITE', 1 );

/* That's all, stop editing! Happy blogging. */
    // If we're behind a proxy server and using HTTPS, we need to alert Wordpress of that fact
    // see also http://codex.wordpress.org/Administration_Over_SSL#Using_a_Reverse_Proxy
    if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
    $_SERVER['HTTPS'] = 'on';
    }

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) )
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
