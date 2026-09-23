<?php
// Pasien Model to Pasien Controller
defined('BASEPATH') or exit('No direct script access allowed');

class Pasien_model extends CI_Model {
  // Pasien Model Melakukan Handling Data Pasien
  public function __construct(){
    // Construct Parent
    parent::__construct();
  }

  public function getTabelPasien(){
    $this->db->select('id, kode, mrn, fullname, dob, gender, alamat');
    $this->db->order_by('id', 'desc');
    $result = $this->db->get('patients');
    return $result->result_array();
  }

  public function publishPatient($data){
    $id = $data['id'];
    $allowedFields = array('fullname', 'alamat', 'email', 'dob', 'gender', 'phone');
    $data = array_intersect_key($data, array_flip($allowedFields));
    $this->db->where('id', $id);
    return $this->db->update('patients', $data);
  }

  public function detailPasien($id){
    $this->db->where('id', $id);
    $result = $this->db->get('patients');
    return $result->row_array();
  }

  public function userKataSandi($userKey){
    // Reset Kata Sandi Ke Default (123)
    $this->db->where('userKey', $userKey);
    $pass = kataSandi('hash', 'password');
    $data = array('password' => $pass);
    return $this->db->update('login_credential', $data);
  }

  public function keluhanSingular($userKey){
    // Tabel Keluhan Singular
    $this->db->select('id, mrn, fullname, siklus, last_session, created');
    $this->db->order_by('created', 'desc');
    $this->db->where('kode', $userKey);
    $result = $this->db->get('patientkeluhan');
    return $result->result_array();
  }
}