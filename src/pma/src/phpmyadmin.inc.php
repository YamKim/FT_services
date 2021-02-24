<?php

$cfg['blowfish_secret'] = 'B,rv.y;Sa8S[nM30T6w,9DE{bieWNus:';

/**
 * List of env variables
 */
$vars = array(
    'PMA_HOST',
	'PMA_PORT',
	'PMA_USER',
	'MYSQL_ROOT_PASSWORD'
);

/**
 * Stock env variables in tab
 */
foreach ($vars as $var) {
    $env = getenv($var);
    if (!isset($_ENV[$var]) && $env !== false) {
        $_ENV[$var] = $env;
    }
}

/**
 * Only one server
 */
$i = 1;

/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;

/**
 * Variable definition
 */
$cfg['Servers'][$i]['host'] = "mysql-db-service";
$cfg['Servers'][$i]['port'] = "3306";
$cfg['Servers'][$i]['user'] = "b0n3";
$cfg['Servers'][$i]['password'] = "admin";

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['TempDir'] = '/www/tmp';
