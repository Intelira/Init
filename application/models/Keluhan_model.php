<?php
// Keluhan Model to Keluhan Controller
defined('BASEPATH') or exit('No direct script access allowed');

class Keluhan_model extends CI_Model {
  // Keluhan Model Melakukan Handling Data Keluhan Multi User
  public function __construct(){
    // Construct Parent
    parent::__construct();
  }

  public function getTabelKeluhan($limit = 10, $offset = 0){
    // Tabel Seluruh Keluhan
    $this->db->select('id, mrn, fullname, siklus, last_session, created');
    $this->db->order_by('created', 'desc');
    $this->db->limit($limit, $offset);
    $result = $this->db->get('patientkeluhan');
    return $result->result_array();
  }

  public function totalTabelKeluhan(){
    // Total Tabel Keluhan
    $this->db->from('patientkeluhan');
    $result = $this->db->count_all_results();
    return $result;
  }

  public function detailKeluhan($id){
    // Detail Keluhan
    $this->db->where('id', $id);
    $result = $this->db->get('patientkeluhan');
    return $result->row_array();
  }
}