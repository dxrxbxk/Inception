<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'wordpresspassword');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
define('AUTH_KEY', 'your-unique-phrase');
define('SECURE_AUTH_KEY', 'your-unique-phrase');
define('LOGGED_IN_KEY', 'your-unique-phrase');
define('NONCE_KEY', 'your-unique-phrase');
define('AUTH_SALT', 'your-unique-phrase');
define('SECURE_AUTH_SALT', 'your-unique-phrase');
define('LOGGED_IN_SALT', 'your-unique-phrase');
define('NONCE_SALT', 'your-unique-phrase');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if (!defined('ABSPATH')) {
    define('ABSPATH', dirname(__FILE__) . '/');
}
require_once(ABSPATH . 'wp-settings.php');
