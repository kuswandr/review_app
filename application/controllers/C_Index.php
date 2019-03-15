<?php

class C_Index extends CI_Controller {

	function __construct() {
		parent:: __construct();
	}

	function index() {
        $url = file_get_contents("http://travling.id:8080/api/v1/reviews/");
        $hasil = json_decode($url,true);
        $data['hasil'] = $hasil;
        $this->load->view('V_Index',$data);   
	}
}