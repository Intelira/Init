<?php
// Tabel Portable
defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = 'default';

$query_builder = TRUE;

$db['default'] = array(
	'dsn' => '',
	'port' => 3308,
	'hostname' => '127.0.0.1',
	'username' => 'root',
	'password' => 'rootpass',
	'database' => 'sipiter',
	'dbdriver' => 'mysqli',
	'dbprefix' => '',
	'pconnect' => FALSE,
	'db_debug' => TRUE,
	'cache_on' => FALSE,
	'char_set' => 'utf8',
	'dbcollat' => 'utf8_general_ci',
	'swap_pre' => '',
	'encrypt'  => FALSE,
	'compress' => FALSE,
	'stricton' => FALSE,
	'failover' => array(),
);
