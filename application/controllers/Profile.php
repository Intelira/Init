<?php
// Profile Controller : Only Handle Personal Data Profile User
defined('BASEPATH') or exit('No direct script access allowed');

class Profile extends MainController {
  // Define Role Variable
  protected $role;
  // Profile Controller Builder
  public function __construct(){
    // Parent Builder
    parent::__construct();
    // Role
    $this->role = 'profile';
    // Model
    $this->load->model('profile_model', 'prfmodel');
  }

  public function index(){
    // Main Tampilan Profile
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // Hasil
    $this->data['result'] = $this->prfmodel->getProfileByID(userids());
    // File
    $this->data['title'] = 'Panel Profile Pasien';
    $this->data['sub_page'] = 'profile/index';
    $this->data['main_menu'] = 'profile';
    $this->load->view('layout/layout', $this->data);
  }

  public function publish(){
    // Publish Data Profile
    if (!permissible($this->role, 'creatable')) {
      blokir();
    }
    // Input Data Profile
    $inputs = $this->input->post();
    // Update Data Profile
    $inputs['kode'] = userids();
    // Update Data Profile
    $result = $this->prfmodel->publishProfile($inputs);
    if ($result) {
      // Define Ulang Variable Fullname
      $this->session->set_userdata('name', $inputs['fullname']);
      // Alert
      alerta('success', "Data Profile Berhasil Diperbarui !");
    } else {
      // Kalau Fail | Alert
      alerta('error', "Data Profile Gagal Diperbarui !");
    }
    // Kembali Ke Tampilan Profile
    return redirect(base_url('profile'));
  }

  // Kata Sandi in Profile Controller

  public function password(){
    // Tampilan Tukar Kata Sandi
    if (!permissible($this->role, 'readable')) {
      blokir();
    }
    // File
    $this->data['title'] = 'Panel Tukar Kata Sandi';
    $this->data['sub_page'] = 'profile/password';
    $this->data['main_menu'] = 'profile';
    $this->load->view('layout/layout', $this->data);
  }

  public function paslish(){
    // Publish Data Tukar Kata Sandi
    if (!permissible($this->role, 'creatable')) {
      blokir();
    }
    // Input Data Profile
    $inputs = $this->input->post();
    // Input Variable
    $inputs['kode'] = userids();
    // Update Data Profile
    $result = $this->prfmodel->publishKataSandi($inputs);
    // Hasil
    if ($result) {
      // Berhasil !
      alerta('success', "Kata Sandi Berhasil Diperbarui !");
    } else {
      // Fail !
      alerta('error', "Kata Sandi Gagal Diperbarui !");
    }
    return redirect(base_url('profile'));
  }
}