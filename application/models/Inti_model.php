<?php
// Inti Model to Inti Controller
defined('BASEPATH') or exit('No direct script access allowed');

class Inti_model extends CI_Model {
  // Inti Model Melakukan Handling Data Keluhan User
  public function __construct(){
    // Construct Parent
    parent::__construct();
  }

  public function getKeluhanByUserKey(){
    // Tampilkan Sembilan Keluhan Baru Pasien
    $kode = $this->session->userdata('kode');
    $this->db->where('userKey', $kode);
    $this->db->order_by('created', 'desc');
    $this->db->limit(9);
    $result = $this->db->get('keluhan');
    return $result->result_array();
  }

  public function publishKeluhan($data){
    // Variable User
    $data['userKey'] = $this->session->userdata('kode');
    // Data Input Model
    $allowedData = array('userKey', 'siklus', 'last_session');
    $allowedSymptomps = array('mual', 'muntah', 'kelelahan', 'mukositis');
    $allowedFields = array_merge($allowedData, $allowedSymptomps);
    $data = array_intersect_key($data, array_flip($allowedFields));
    // Variable u Hasil
    $insert = $this->db->insert('keluhan', $data);
    $idKey = $insert ? $this->db->insert_id() : false;
    // Hasil
    return array('status' => (bool) $insert, 'idKey' => $idKey);
  }

  public function detailKeluhan($id){
    // Detail dari Singular Keluhan Pasien
    $kode = $this->session->userdata('kode');
    $this->db->where('id', $id);
    $this->db->where('userKey', $kode);
    $result = $this->db->get('keluhan');
    return $result->row_array();
  }

}