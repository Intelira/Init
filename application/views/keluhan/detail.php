<!-- Custom Style -->
<link rel="stylesheet" href="<?= base_url('assets/css/keluhan.css'); ?>">

<!-- Keluhan Detail Panel -->
<div class="keluhan-page">
  <div class="page-nav">
    <button class="btn-back" onclick="window.history.back(); return false;">
      <i class="bi bi-door-open-fill"></i> Kembali
    </button>
  </div>
  <section class="keluhan-detail-wrap">
    <!-- Title -->
    <div class="keluhan-detail-header">
      <i class="bi bi-clipboard2-pulse keluhan-detail-icon"></i>
      <p class="lead">Detail Laporan Keluhan</p>
    </div>
    <div class="row g-3">
      <!-- Fullname -->
      <div class="col-12 col-md-3">
        <div class="keluhan-form-floating">
          <label>Nama Pasien</label>
          <input type="text" class="keluhan-input" value="<?= $result['fullname'] ?>" readonly>
        </div>
      </div>
      <!-- Tanggal Pengisian -->
      <div class="col-12 col-md-3">
        <div class="keluhan-form-floating">
          <label>Tanggal Pengisian</label>
          <input type="text" class="keluhan-input" value="<?= $result['created'] ?>" readonly>
        </div>
      </div>
      <!-- Siklus Kemo -->
      <div class="col-12 col-md-3">
        <div class="keluhan-form-floating">
          <label>Siklus Kemoterapi</label>
          <input type="text" class="keluhan-input" value="Siklus <?= str_pad($result['siklus'], 2, '0', STR_PAD_LEFT) ?>" readonly>
        </div>
      </div>
      <!-- Siklus Kemo -->
      <div class="col-12 col-md-3">
        <div class="keluhan-form-floating">
          <label>Tanggal Kemoterapi</label>
          <input type="text" class="keluhan-input" value="<?= $result['last_session'] ?>" readonly>
        </div>
      </div>
    </div>
    <!-- Keluhan -->
    <div class="row g-3 mt-1">
      <!-- Keluhan Luka Bibir -->
      <div class="keluhan-form-floating">
        <label>Keluhan Luka Bibir</label>
        <input type="text" class="keluhan-input" id="label_mukositis" readonly>
        <div class="saran-panel" id="saran_mukositis">
          <p class="saran-title">Saran Kegiatan</p>
          <ul class="saran-list"><li>Belum Tau.</li></ul>
        </div>
      </div>
      <!-- Keluhan Kelelahan -->
      <div class="keluhan-form-floating mt-0">
        <label>Keluhan Kelelahan</label>
        <input type="text" class="keluhan-input" id="label_kelelahan" readonly>
        <div class="saran-panel" id="saran_kelelahan">
          <p class="saran-title">Saran Kegiatan</p>
          <ul class="saran-list"><li>Belum Tau.</li></ul>
        </div>
      </div>
      <!-- Keluhan Mual -->
      <div class="keluhan-form-floating mt-0">
        <label>Keluhan Mual</label>
        <input type="text" class="keluhan-input" id="label_mual" readonly>
        <div class="saran-panel" id="saran_mual">
          <p class="saran-title">Saran Kegiatan</p>
          <ul class="saran-list"><li>Belum Tau.</li></ul>
        </div>
      </div>
      <!-- Keluhan Muntah -->
      <div class="keluhan-form-floating mt-0">
        <label>Keluhan Muntah</label>
        <input type="text" class="keluhan-input" id="label_muntah" readonly>
        <div class="saran-panel" id="saran_muntah">
          <p class="saran-title">Saran Kegiatan</p>
          <ul class="saran-list"><li>Belum Tau.</li></ul>
        </div>
      </div>
    </div>
  </section>
</div>

<script>
$(document).ready(function() {
  document.getElementById('label_mukositis').value = labelKeluhan('mukositis', <?= $result['mukositis'] ?>);
  document.getElementById('label_kelelahan').value = labelKeluhan('kelelahan', <?= $result['kelelahan'] ?>);
  document.getElementById('label_mual').value = labelKeluhan('mual', <?= $result['mual'] ?>);
  document.getElementById('label_muntah').value = labelKeluhan('muntah', <?= $result['muntah'] ?>);
  // Isi Panel Saran Kegiatan Berdasarkan Grade Tiap Keluhan
  renderSaranList('#saran_mukositis', labelPlan('mukositis', <?= $result['mukositis'] ?>));
  renderSaranList('#saran_kelelahan', labelPlan('kelelahan', <?= $result['kelelahan'] ?>));
  renderSaranList('#saran_mual', labelPlan('mual', <?= $result['mual'] ?>));
  renderSaranList('#saran_muntah', labelPlan('muntah', <?= $result['muntah'] ?>));
});
</script>