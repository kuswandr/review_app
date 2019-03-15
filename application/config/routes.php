<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'C_Index';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;


$route['review'] = 'C_Index';
$route['review/(:any)'] = 'C_Index/$1';
$route['review/(:any)/(:any)'] = 'C_Index/$1/$2';