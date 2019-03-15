<?php

class C_Index extends CI_Controller {
        var $API ="";

	function __construct() {
		parent:: __construct();
                $this->API="http://travling.id:8080/api/v1/reviews/";
                $this->load->library('curl');
                $this->load->helper('form');
                $this->load->helper('url');
	}

	function index() {
                $hasil = json_decode($this->curl->simple_get($this->API));
                $data['hasil'] = $hasil;
                $this->load->view('V_Index',$data);   
	}

        function create()
        {
                $rating = $this->input->post('rating');
                $review = $this->input->post('review');
                $image = '';

                if (!($_FILES['image']['size'] == 0) || !($_FILES['image']['error'] == 0)) {
                        $name = $_FILES['image']['name'];
                        $path = $_FILES['image']['tmp_name'];
                        $type = pathinfo($name, PATHINFO_EXTENSION);
                        $data = file_get_contents($path);
                        $image = 'data:image/' . $type . ';base64,' . base64_encode($data);
                }
                $data = array(
                        'review'       =>  $review,
                        'image'      =>  $image,
                        'rating'=>  $rating);
                $insert =  $this->curl->simple_post($this->API, $data, array(CURLOPT_BUFFERSIZE => 10)); 
                redirect(base_url());




        }

        function delete($id)
        {
               $delete =  $this->curl->simple_delete($this->API.$id, array(CURLOPT_BUFFERSIZE => 10)); 
               redirect(base_url());
        }

        function update()
        {
                $id = $this->input->post('id');
                $rating = $this->input->post('rating');
                $review = $this->input->post('review');
                $image = '';

                if (!($_FILES['image']['size'] == 0) || !($_FILES['image']['error'] == 0)) {
                        $name = $_FILES['image']['name'];
                        $path = $_FILES['image']['tmp_name'];
                        $type = pathinfo($name, PATHINFO_EXTENSION);
                        $data = file_get_contents($path);
                        $image = 'data:image/' . $type . ';base64,' . base64_encode($data);
                }
                $data = array(
                        'review'       =>  $review,
                        'image'      =>  $image,
                        'rating'=>  $rating);
                $insert =  $this->curl->simple_put($this->API.$id, $data, array(CURLOPT_BUFFERSIZE => 10)); 
               redirect(base_url());
        }
}