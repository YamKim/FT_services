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
define( 'DB_NAME', 'wordpressdb' );

/** MySQL database username */
define( 'DB_USER', 'b0n3' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-db-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'FZW?h+A_1k(o+,#B J83l)0V>}NF/9mHC!rI:MP5jiUeQ1ZUkC7.tzxDZ~POiMwM' );
define( 'SECURE_AUTH_KEY',  '^}b8{cv5=>xgzofwJ#6]!_hvay+nL?OVaj;.??N5x{/o;yL |2un)Bglh*5c}95*' );
define( 'LOGGED_IN_KEY',    ':H-)95!s(ZK^W 7ol*)m)Iaw}Nhg!4W6Vv}oTLEE]zA!E3;cRQPiGc^&jmvF_hQ.' );
define( 'NONCE_KEY',        'ti7uo;4-6;w&m}D34orNK_gJR2cD;j}:>>l`0G-U+yXd?A<;%c]##A#}>~u3Y_f2' );
define( 'AUTH_SALT',        ')O-w}@/$RD{S9djdSRwO5B[h@T@+PVNDR^<cP;v2O_mmtpCK_Nq|cKs(#l_3CJ[q' );
define( 'SECURE_AUTH_SALT', 'Tf Z}jPKa>1%E@p%>rmh1W~*4X{`6?Vgtu[G>;=d$#Cc^!Ng%Wyymlv ?6n|diJg' );
define( 'LOGGED_IN_SALT',   'W*qdVeqn8</tzM,/8GVl~`Z{b?wvAv56xO6QuK{|z23lLHtL*#8*)KfwIqL%nJ k' );
define( 'NONCE_SALT',       'Ly-zz^NnBPOV?y6@GrvhlDh-|2f1n!%rAVYg>>E?76;+~!r}r-|-8{BJ/U=?+Oe ' );

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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';