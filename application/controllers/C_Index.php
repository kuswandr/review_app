<?php

class C_Index extends CI_Controller {

	function __construct() {
		parent:: __construct();
	}

	function index() {	
        $this->load->view('V_Index');      
	}
}