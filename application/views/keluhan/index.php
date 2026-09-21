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
      <tr><td colspan="6" class="keluhan-empty">Mohon Tunggu !</td></tr>
    </tbody>
  </table>
  <!-- Keluhan Footer -->
  <div class="keluhan-footer">
    <span class="keluhan-count" id="keluhanCount"></span>
    <div class="keluhan-pages" id="keluhanPages"></div>
  </div>
</div>

<script>
// Variable
const KELUHAN_URL = "<?= base_url('keluhan/historia') ?>";
const BASE_URL = "<?= base_url() ?>";
let allData = [];
let currentPage = 1;

// Controller Data
$(document).ready(function() {
  $.ajax({
    url: KELUHAN_URL,
    type: 'get',
    dataType: 'json',
    success: function(data) {
      allData = Array.isArray(data) ? data : (data.data || []);
      render();
      handlers();
    },
    // Controller Fail
    error: function() {
      // Fail
      $('#keluhanBody').html('<tr><td colspan="6" class="keluhan-empty">Controller Data Keluhan !</td></tr>');
    }
  });
});

function getFiltered() {
  // Filter Fullname
  const q = $('#keluhanSearch').val().toLowerCase().trim();
  return allData.filter(p => (p.fullname|| '').toLowerCase().includes(q));
}

function render() {
  // Helper
  const limit = parseInt($('#keluhanLimit').val()) || 5;
  const data = getFiltered();
  const total = data.length;
  const pages = Math.max(1, Math.ceil(total / limit));
  if (currentPage > pages) currentPage = 1;
  const start  = (currentPage - 1) * limit;
  const sliced = data.slice(start, start + limit);
  renderBody(sliced, start);
  renderCount(total, start, limit);
  renderPages(pages);
}

function renderBody(rows, start) {
  // Data Belum Ada
  if (!rows.length) {
    $('#keluhanBody').html('<tr><td colspan="6" class="keluhan-empty">Belum Ada Data !</td></tr>');
    return;
  }
  // Data Ada & Map
  $('#keluhanBody').html(rows.map((p, i) => `
    <tr>
      <td class="keluhan-num">${start + i + 1}</td>
      <td>${p.mrn}</td>
      <td>${p.fullname}</td>
      <td>Siklus ${String(p.siklus).padStart(2, '0')}</td>
      <td>${p.last_session}</td>
      <td>${p.created}</td>
      <td>
        <a href="${BASE_URL}keluhan/detail/${p.id}" class="keluhan-btn-view">
          <i class="bi bi-eye"></i>
        </a>
      </td>
    </tr>
  `).join(''));
}

function renderCount(total, start, limit) {
  // Helper
  $('#keluhanCount').text(total ? `${start + 1}–${Math.min(start + limit, total)} dari ${total} data` : '0 data');
}

function renderPages(pages) {
  // Helper
  if (pages <= 1) { $('#keluhanPages').html(''); return; }
  $('#keluhanPages').html(
    Array.from({ length: pages }, (_, i) =>
      `<button class="keluhan-page-btn ${currentPage === i + 1 ? 'active' : ''}" onclick="goPage(${i + 1})">${i + 1}</button>`
    ).join('')
  );
}

function goPage(p) { currentPage = p; render(); }

function handlers() {
  // Helper
  $('#keluhanSearch').on('input', function() { currentPage = 1; render(); });
  $('#keluhanLimit').on('change', function() { currentPage = 1; render(); });
}

window.goPage = goPage;
</script>