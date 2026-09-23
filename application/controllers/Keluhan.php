<?php
// Keluhan Controller : Handle Multi Keluhan
defined('BASEPATH') or exit('No direct script access allowed');

class Keluhan extends MainController {
  // Define Role Variable
  protected $role;
  // Keluhan Controller Builder
  public function __construct(){
    // Parent Builder
    parent::__construct();
    // Role
    $this->role = 'keluhan';
    // Model
    $this->load->model('keluhan_model', 'klmdl');
  }

  public function index(){
    // Main Tampilan Keluhan
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // File
    $this->data['title'] = 'Panel Keluhan Pasien';
    $this->data['sub_page'] = 'keluhan/index';
    $this->data['main_menu'] = 'keluhan';
    $this->load->view('layout/layout', $this->data);
  }

  public function historia(){
    // Tampilkan Data Tabel
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Model
    $result = $this->klmdl->getTabelKeluhan();
    // Hasil
    echo json_encode($result);
  }

  public function detail($id){
    // Main Tampilan Keluhan
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Hasil
    $this->data['result'] = $this->klmdl->detailKeluhan($id);
    // File
    $this->data['title'] = 'Panel Detail Keluhan Pasien';
    $this->data['sub_page'] = 'keluhan/detail';
    $this->data['main_menu'] = 'keluhan';
    $this->load->view('layout/layout', $this->data);
  }
}

?>