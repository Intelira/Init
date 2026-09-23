<?php
// Inti Controller : Handle Keluhan in Single Data
defined('BASEPATH') or exit('No direct script access allowed');

class Inti extends MainController {
  // Define Role Variable
  protected $role;
  // Inti Controller Builder
  public function __construct(){
    // Parent Builder
    parent::__construct();
    // Role
    $this->role = 'inti';
    // Model
    $this->load->model('inti_model', 'intimdl');
  }

  public function index(){
    // Main Tampilan Keluhan
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Hasil
    $this->data['results'] = $this->intimdl->getKeluhanByUserKey();
    // File
    $this->data['title'] = 'Panel Keluhan Pasien';
    $this->data['sub_page'] = 'inti/index';
    $this->data['main_menu'] = 'inti';
    $this->load->view('layout/layout', $this->data);
  }

  public function insert(){
    // Input Keluhan
    if (!permissible($this->role, 'creatable')) {
      blokir();
    }
    // File
    $this->data['title'] = 'Panel Input Keluhan Pasien';
    $this->data['sub_page'] = 'inti/insert';
    $this->data['main_menu'] = 'inti';
    $this->load->view('layout/layout', $this->data);
  }

  public function publish(){
    // Publish Data Keluhan Pasien
    $inputs = $this->input->post();
    // Model
    $result = $this->intimdl->publishKeluhan($inputs);
    // Hasil
    if ($result['status']) {
      // Berhasil !
      alerta('success', 'Input Keluhan Berhasil !');
    } else {
      // Fail
      alerta('error', 'Input Keluhan Tidak Berhasil !');
    }
    // Variable
    $status = $result['status'] ? 'success' : 'error';
    // Hasil Keluar
    echo json_encode(array('status' => $status, 'idKey'  => $result['idKey']));
  }

  public function detail($id){
    // Main Tampilan Keluhan
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Hasil
    $this->data['result'] = $this->intimdl->detailKeluhan($id);
    // File
    $this->data['title'] = 'Panel Detail Keluhan Pasien';
    $this->data['sub_page'] = 'inti/detail';
    $this->data['main_menu'] = 'inti';
    $this->load->view('layout/layout', $this->data);
  }
}

?>