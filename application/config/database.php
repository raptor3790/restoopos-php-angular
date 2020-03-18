<?php
/**
 * Database configuration for Tendoo CMS
 * -------------------------------------
 * Tendoo Version : 3.1
**/

defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = 'default';
$query_builder = TRUE;

$db['default']['hostname'] = 'localhost';
$db['default']['username'] = 'cstarsof_joker';
$db['default']['password'] = '12345678aA!';
$db['default']['database'] = 'cstarsof_restopos';
$db['default']['dbdriver'] = 'mysqli';
$db['default']['dbprefix'] = 'tendoo_';
$db['default']['pconnect'] = FALSE;
$db['default']['db_debug'] = TRUE;
$db['default']['cache_on'] = FALSE;
$db['default']['cachedir'] = 'application/cache/database/';
$db['default']['char_set'] = 'utf8';
$db['default']['dbcollat'] = 'utf8_general_ci';
$db['default']['swap_pre'] = '';
$db['default']['autoinit'] = TRUE;
$db['default']['stricton'] = FALSE;

if(!defined('DB_PREFIX'))
{
	define('DB_PREFIX',$db['default']['dbprefix']);
}