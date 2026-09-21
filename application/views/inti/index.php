<link rel="stylesheet" href="<?= base_url('assets/css/inti.css'); ?>">

<!-- Input Keluhan -->
<div class="row">
  <div class="col-12 col-md-auto ms-md-auto">
    <a href="<?= base_url('inti/insert'); ?>" class="btn btn-insert" id="insertBtn">
      <i class="bi bi-plus-lg"></i>
      <span class="insert-label">Input Data Keluhan</span>
    </a>
  </div>
</div>
<br>
<!-- Tabel Keluhan Per Pasien -->
<div class="inti-page">
  <?php if (!empty($results)): ?>
    <div class="row g-3">
      <?php foreach ($results as $row): ?>
        <div class="col-12 col-md-6 col-lg-4">
          <div class="diri-wrap" style="margin-top:0; --diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec;">
            <div class="form-floating-soft">
              <label>Tanggal Pengisian Keluhan</label>
              <input type="text" class="form-control custom-input" value="<?= $row['created'] ?>" readonly>
            </div>
            <div class="row g-2">
              <div class="col-6">
                <div class="form-floating-soft">
                  <label>Siklus Kemoterapi</label>
                  <input type="text" class="form-control custom-input" value="Siklus <?= str_pad($row['siklus'], 2, '0', STR_PAD_LEFT) ?>" readonly>
                </div>
              </div>
              <div class="col-6">
                <div class="form-floating-soft">
                  <label>Tanggal Kemo</label>
                  <input type="text" class="form-control custom-input" value="<?= $row['last_session'] ?>" readonly>
                </div>
              </div>
            </div>
            <div class="diri-actions" style="margin-top:8px">
              <a href="<?= base_url('inti/detail/' . $row['id']) ?>" class="btn btn-care w-100">
                <i class="bi bi-eye me-1"></i> Lihat Detail
              </a>
            </div>
          </div>
        </div>
      <?php endforeach; ?>
    </div>
  <?php else: ?>
    <section class="diri-wrap text-center">
      <i class="bi bi-clipboard2-x" style="font-size:2rem;color:#94a3b8"></i>
      <p style="color:#94a3b8;margin-top:8px">Belum Ada Data Pelaporan Keluhan</p>
    </section>
  <?php endif; ?>
</div>