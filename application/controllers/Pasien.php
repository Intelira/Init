<?php
// Pasien Controller : Handle Multi Pasien
defined('BASEPATH') or exit('No direct script access allowed');

class Pasien extends MainController {
  // Define Role Variable
  protected $role;
  // Pasien Controller Builder
  public function __construct(){
    // Parent Builder
    parent::__construct();
    // Role
    $this->role = 'pasien';
    // Model
    $this->load->model('pasien_model', 'psmdl');
  }

  public function index(){
    // Main Tampilan Keluhan
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // File
    $this->data['title'] = 'Panel Data Tabel Pasien';
    $this->data['sub_page'] = 'pasien/index';
    $this->data['main_menu'] = 'pasien';
    $this->load->view('layout/layout', $this->data);
  }

  public function historia(){
    // Tampilkan Data Tabel
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Model
    $result = $this->psmdl->getTabelPasien();
    // Hasil
    echo json_encode($result);
  }

  public function insert(){
    // Main Tampilan Input Data Pasien
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // File
    $this->data['title'] = 'Input Data Tabel Pasien';
    $this->data['sub_page'] = 'pasien/insert';
    $this->data['main_menu'] = 'pasien';
    $this->load->view('layout/layout', $this->data);
  }

  public function publish(){
    // Simpan Segala Bentuk Perubahan Data Pasien
    if (!permissible($this->role, 'is_edit')) {
      blokir();
    }
    // Variable
    $inputs = $this->input->post();
    // Model
    $result = $this->psmdl->publishPatient($inputs);
    // Hasil Model
    if ($result) {
      // Berhasil !
      alerta('success', "Proses Data Pasien Berhasil !");
    } else {
      // Fail !
      alerta('error', 'Proses Data Pasien Tidak Berhasil !');
    }
    // Hasil Array
    echo json_encode(array('status' => $result ? 'success' : 'error'));
  }

  public function detail($id){
    // Main Tampilan Input Data Pasien
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Hasil
    $this->data['result'] = $this->psmdl->detailPasien($id);
    // File
    $this->data['title'] = 'Input Data Tabel Pasien';
    $this->data['sub_page'] = 'pasien/detail';
    $this->data['main_menu'] = 'pasien';
    $this->load->view('layout/layout', $this->data);
  }

  public function repass($userKey){
    // Controller Default Kata Sandi
    if (!permissible($this->role, 'editable')) {
      blokir();
    }
    // Model
    $result = $this->psmdl->userKataSandi($userKey);
    // Hasil
    if ($result) {
      // Berhasil !
      alerta('success', 'Kata Sandi Default Berubah !');
    } else {
      // Fail
      alerta('error', 'Perbaikan Kata Sandi Gagal !');
    }
    // Hasil Array
    return redirect(base_url('pasien'));
  }

  public function keluhan($userKey){
    // Menampilkan Histori Input Keluhan Satu Pasien
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Model
    $this->data['result'] = $this->psmdl->keluhanSingular($userKey);
    // File
    $this->data['title'] = 'Tabel Keluhan Pasien';
    $this->data['sub_page'] = 'pasien/singular';
    $this->data['main_menu'] = 'pasien';
    $this->load->view('layout/layout', $this->data);
  }
}