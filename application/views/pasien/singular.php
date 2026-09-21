<!-- Custom Style -->
<link rel="stylesheet" href="<?= base_url('assets/css/keluhan.css'); ?>">

<!-- Keluhan Tabel Panel -->
<div class="keluhan-wrap">
  <div class="keluhan-toolbar">
    <!-- Input Fullname -->
    <div class="keluhan-search-box">
      <i class="bi bi-search keluhan-search-icon"></i>
      <input type="text" id="keluhanSearch" class="keluhan-search-input" placeholder="Cari Pasien" autocomplete="off">
    </div>
    <!-- Limit Data Pagination -->
    <span class="keluhan-limit-label">Tampilkan :</span>
    <select id="keluhanLimit" class="keluhan-limit-select">
      <option value="5" selected>5</option>
      <option value="10">10</option>
      <option value="25">25</option>
      <option value="50">50</option>
      <option value="100">100</option>
    </select>
  </div>
  <!-- Tabel -->
  <table class="keluhan-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Rekam Medis Pasien</th>
        <th>Pasien</th>
        <th>Siklus</th>
        <th>Tanggal Kemo</th>
        <th>Tanggal Pengisian</th>
        <th></th>
      </tr>
    </thead>
    <!-- Tabel Body -->
    <tbody id="keluhanBody">
      <?php if (empty($result)): ?>
        <tr><td colspan="6" class="keluhan-empty">Belum Ada Data !</td></tr>
      <?php else: ?>
        <?php foreach ($result as $i => $row): ?>
          <tr>
            <td><?= $i + 1; ?></td>
            <td><?= $row['mrn']; ?></td>
            <td><?= $row['fullname']; ?></td>
            <td>Siklus <?= str_pad($row['siklus'], 2, '0', STR_PAD_LEFT) ?></td>
            <td><?= $row['last_session'] ?></td>
            <td><?= $row['created'] ?></td>
            <td>
              <a href="<?= base_url('keluhan/detail/' . $row['id']) ?>" class="keluhan-btn-view">
                <i class="bi bi-eye"></i>
              </a>
            </td>
          </tr>
        <?php endforeach; ?>
      <?php endif; ?>
    </tbody>
  </table>
  <!-- Keluhan Footer -->
  <div class="keluhan-footer">
    <span class="keluhan-count" id="keluhanCount"></span>
    <div class="keluhan-pages" id="keluhanPages"></div>
  </div>
</div>