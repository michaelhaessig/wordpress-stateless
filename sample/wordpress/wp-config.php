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
define('AUTH_KEY',         'WXM3 `%^VCw|m^-m}fZ:nbVanfOK&noO1Bs#+%||>wrLsvab XU_~TI2H&Y8fKlF');
define('SECURE_AUTH_KEY',  'QA|B:hd~CG]G|s|Q=W#L*;vNmaKhG*;sqt8=y|+Kki]rlL)vMOk|5x7P<H{EA li');
define('LOGGED_IN_KEY',    ',=i:0TI-l3?dk)bxYI!-^C$5hR)Onq(2I%kflhg*)E}DV**:tUXUyM%dZ!KI-+GX');
define('NONCE_KEY',        'B?q<cR&e^=a^cLxt/#4+hwxvMO_qe+wS,.zyg/nF!IHp nl *[W0+22-h+?=}^i,');
define('AUTH_SALT',        '[M7IC]N3Ku*5LiI`(:@NAG(n/vL:cb<&FWT-7l6W40e8Le-9K%V6(k_PsMi{Y&h#');
define('SECURE_AUTH_SALT', 'H?d~r5g]MZ5CW1gw9-uDD/?@0p|(:}N^kR.5L?v5e:7*v~ZTrT 0 |Ls.^BL!xfX');
define('LOGGED_IN_SALT',   'JDi*b[Io15shi4kFk&y wPB:/*O+Y`/c@fl&&O-B6A **- i|ert1@-:<+~/DD+ ');
define('NONCE_SALT',       'YeF&7h+c-3;UIwW4!W~d|h3ma%tEdO+vFOAMb`y8iVHu-}_+0=Qn+w;IR]J-4Vc$');


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
