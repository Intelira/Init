<link rel="stylesheet" href="<?= base_url('assets/css/pasien.css'); ?>">
<div class="pasien-wrap">

  <div class="pasien-toolbar">
    <div class="pasien-search-box">
      <i class="bi bi-search pasien-search-icon"></i>
      <input type="text" id="pasienSearch" class="pasien-search-input" placeholder="Cari pasien..." autocomplete="off">
    </div>
    <span class="pasien-limit-label">Tampilkan :</span>
    <select id="pasienLimit" class="pasien-limit-select">
      <option value="5" selected>5</option>
      <option value="10">10</option>
      <option value="25">25</option>
      <option value="50">50</option>
      <option value="100">100</option>
    </select>
    <a href="<?= base_url('pasien/insert') ?>" class="pasien-btn-add">
      <i class="bi bi-plus-lg"></i>
    </a>
  </div>

  <table class="pasien-table">
    <thead>
      <tr>
        <th>#</th>
        <th>MRN</th>
        <th>Nama Lengkap</th>
        <th>Gender</th>
        <th>Tanggal Lahir</th>
        <th>Alamat</th>
        <th></th>
      </tr>
    </thead>
    <tbody id="pasienBody">
      <tr><td colspan="7" class="pasien-empty">Memuat data...</td></tr>
    </tbody>
  </table>

  <div class="pasien-footer">
    <span class="pasien-count" id="pasienCount"></span>
    <div class="pasien-pages" id="pasienPages"></div>
  </div>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
const PASIEN_URL = "<?= base_url('pasien/historia') ?>";
const BASE_URL     = "<?= base_url() ?>";
let allData         = [];
let currentPage      = 1;

$(document).ready(function() {
  $.ajax({
    url: PASIEN_URL,
    type: 'GET',
    dataType: 'JSON',
    success: function(data) {
      allData = Array.isArray(data) ? data : (data.data || []);
      render();
      handlers();
    },
    error: function() {
      $('#pasienBody').html('<tr><td colspan="7" class="pasien-empty">Gagal memuat data</td></tr>');
    }
  });
});

function getFiltered() {
  const q = $('#pasienSearch').val().toLowerCase().trim();
  return allData.filter(p =>
    (p.fullname || '').toLowerCase().includes(q) ||
    (p.mrn || '').toLowerCase().includes(q)
  );
}

function render() {
  const limit  = parseInt($('#pasienLimit').val()) || 5;
  const data   = getFiltered();
  const total  = data.length;
  const pages  = Math.max(1, Math.ceil(total / limit));
  if (currentPage > pages) currentPage = 1;
  const start  = (currentPage - 1) * limit;
  const sliced = data.slice(start, start + limit);
  renderBody(sliced, start);
  renderCount(total, start, limit);
  renderPages(pages);
}

function renderBody(rows, start) {
  if (!rows.length) {
    $('#pasienBody').html('<tr><td colspan="7" class="pasien-empty">Tidak ada pasien ditemukan</td></tr>');
    return;
  }
  $('#pasienBody').html(rows.map((p, i) => `
    <tr>
      <td class="pasien-num">${start + i + 1}</td>
      <td class="pasien-mono">${p.mrn}</td>
      <td>${p.fullname}</td>
      <td>${p.gender}</td>
      <td>${p.dob}</td>
      <td>${p.alamat}</td>
      <td>
        <div class="pasien-action-group">
          <a href="${BASE_URL}pasien/detail/${p.id}" class="pasien-btn-view" title="Lihat Detail">
            <i class="bi bi-eye"></i>
          </a>
          <a href="${BASE_URL}pasien/keluhan/${p.kode}" class="pasien-btn-keluhan" title="Data Keluhan">
            <i class="bi bi-file-spreadsheet-fill"></i>
          </a>
          <button type="button" class="pasien-btn-reset" title="Reset Kata Sandi" onclick="resetPassword('${p.kode}')">
            <i class="bi bi-key-fill"></i>
          </button>
        </div>
      </td>
    </tr>
  `).join(''));
}

function renderCount(total, start, limit) {
  $('#pasienCount').text(total ? `${start + 1}–${Math.min(start + limit, total)} dari ${total} data` : '0 data');
}

function renderPages(pages) {
  if (pages <= 1) { $('#pasienPages').html(''); return; }
  $('#pasienPages').html(
    Array.from({ length: pages }, (_, i) =>
      `<button class="pasien-page-btn ${currentPage === i + 1 ? 'active' : ''}" onclick="goPage(${i + 1})">${i + 1}</button>`
    ).join('')
  );
}

function goPage(p) { currentPage = p; render(); }

function resetPassword(kode) {
  if (!confirm('Reset kata sandi pasien ini ke default?')) return;

  $.ajax({
    url: BASE_URL + 'pasien/replace/' + kode,
    method: 'POST',
    complete: function() {
      window.location.href = '<?= base_url('pasien') ?>';
    }
  });
}

function handlers() {
  $('#pasienSearch').on('input', function() { currentPage = 1; render(); });
  $('#pasienLimit').on('change', function() { currentPage = 1; render(); });
}

window.goPage = goPage;
window.resetPassword = resetPassword;
</script>