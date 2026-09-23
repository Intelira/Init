<?php
// Tabel Portable
defined('BASEPATH') OR exit('No direct script access allowed');

$active_group = 'default';

$query_builder = TRUE;

$db['default'] = array(
	'hostname' => 'localhost',
	'username' => 'root',
	'password' => 'User123!',
	'database' => 'djamil_siti',
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
