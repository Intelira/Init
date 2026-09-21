<link rel="stylesheet" href="<?= base_url('assets/css/inti.css'); ?>">

<div class="inti-page">
  <div class="page-nav">
    <a href="<?= base_url('inti') ?>" class="btn-back">
      <i class="bi bi-door-open-fill"></i> Kembali
    </a>
  </div>
  <section class="diri-wrap diri-wrap-teal">
    <div class="diri-header">
      <i class="bi bi-clipboard2-pulse diri-icon"></i>
      <p class="lead">Detail Laporan Keluhan</p>
    </div>
    <div class="row g-3">
      <div class="col-12 col-md-4">
        <div class="form-floating-soft">
          <label>Tanggal Pengisian</label>
          <input type="text" class="form-control custom-input" value="<?= $result['created'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="form-floating-soft">
          <label>Siklus Kemoterapi</label>
          <input type="text" class="form-control custom-input" value="Siklus <?= str_pad($result['siklus'], 2, '0', STR_PAD_LEFT) ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="form-floating-soft">
          <label>Tanggal Kemoterapi</label>
          <input type="text" class="form-control custom-input" value="<?= $result['last_session'] ?>" readonly>
        </div>
      </div>
    </div>
    <div class="row g-3 mt-1">
        <div class="form-floating-soft">
          <label>Keluhan Luka Bibir</label>
          <input type="text" class="form-control custom-input" id="label_mukositis" readonly>
          <div class="saran-panel" id="saran_mukositis">
            <p class="saran-title">Saran Kegiatan</p>
            <ul class="saran-list"><li>Belum Tau.</li></ul>
          </div>
        </div>
        <div class="form-floating-soft mt-3">
          <label>Keluhan Kelelahan</label>
          <input type="text" class="form-control custom-input" id="label_kelelahan" readonly>
          <div class="saran-panel" id="saran_kelelahan">
            <p class="saran-title">Saran Kegiatan</p>
            <ul class="saran-list"><li>Belum Tau.</li></ul>
          </div>
        </div>
        <div class="form-floating-soft mt-3">
          <label>Keluhan Mual</label>
          <input type="text" class="form-control custom-input" id="label_mual" readonly>
          <div class="saran-panel" id="saran_mual">
            <p class="saran-title">Saran Kegiatan</p>
            <ul class="saran-list"><li>Belum Tau.</li></ul>
          </div>
        </div>
        <div class="form-floating-soft mt-3">
          <label>Keluhan Muntah</label>
          <input type="text" class="form-control custom-input" id="label_muntah" readonly>
          <div class="saran-panel" id="saran_muntah">
            <p class="saran-title">Saran Kegiatan</p>
            <ul class="saran-list"><li>Belum Tau.</li></ul>
          </div>
        </div>
    </div>
  </section>
</div>

<script>
// Pecah Teks Saran Jadi Poin Per Kalimat (Teks Asli Tidak Diubah, Hanya Presentasinya)
function renderSaranList(selector, text) {
  // Special Modifier
  const $list = $(selector + ' .saran-list').empty();
  if (!text || text.trim() === '-' ) {
    $list.append($('<li>').text(text || '-'));
    return;
  }
  const kalimat = text.match(/[^.]+(\.|$)/g) || [text];
  kalimat.forEach(function(k) {
    k = k.trim();
    if (k) $list.append($('<li>').text(k));
  });
}

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