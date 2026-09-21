<link rel="stylesheet" href="<?= base_url('assets/css/pasien.css'); ?>">

<div class="pasien-input-page">
  <section class="pasien-input-wrap" id="pasienDetail" data-mode="view">
    <div class="pasien-input-header">
      <i class="bi bi-person-vcard-fill pasien-input-icon"></i>
      <p class="lead">Detail Pasien</p>
      <span class="pasien-mode-badge" id="pasienModeBadge">
        <i class="bi bi-lock-fill"></i> Mode Lihat
      </span>
      <button type="button" class="pasien-btn-edit" id="btnToggleEditPasien" title="Edit">
        <i class="bi bi-pencil-fill"></i>
      </button>
    </div>
    <div class="row g-4">
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>MRN</label>
          <input type="text" class="pasien-input" id="det_mrn" value="<?= $result['mrn'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Nomor Induk Kependudukan</label>
          <input type="text" class="pasien-input" id="det_nik" value="<?= $result['nik'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Nama Lengkap</label>
          <input type="text" class="pasien-input" id="det_fullname" value="<?= $result['fullname'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Tempat Tinggal</label>
          <input type="text" class="pasien-input" id="det_alamat" value="<?= $result['alamat'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Email</label>
          <input type="email" class="pasien-input" id="det_email" value="<?= $result['email'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Telepon</label>
          <input type="text" class="pasien-input" id="det_phone" value="<?= $result['phone'] ?>" readonly>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Jenis Kelamin</label>
          <select class="pasien-input" id="det_gender" disabled>
            <option value="Pria" <?= $result['gender'] == 'Pria' ? 'selected' : '' ?>>Pria</option>
            <option value="Wanita" <?= $result['gender'] == 'Wanita' ? 'selected' : '' ?>>Wanita</option>
          </select>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="pasien-form-floating">
          <label>Tanggal Lahir</label>
          <input type="date" class="pasien-input" id="det_dob" value="<?= $result['dob'] ?>" readonly>
        </div>
      </div>
    </div>
    <div class="pasien-input-actions mt-2">
      <a href="<?= base_url('pasien') ?>" class="pasien-btn-soft">Kembali</a>
      <button type="button" class="pasien-btn-primary d-none" id="btnSimpanPasien">Simpan Perubahan</button>
    </div>
  </section>
</div>


<script>
$(document).ready(function() {
  $('#btnToggleEditPasien').on('click', function() {
    const editing = $('#pasienDetail').attr('data-mode') === 'edit';
    setEditable(!editing);
  });
  $('#btnSimpanPasien').on('click', simpanPasien);
});

function setEditable(editable) {
  $('#pasienDetail').attr('data-mode', editable ? 'edit' : 'view');

  // MRN & NIK are never editable, regardless of mode
  $('#det_fullname, #det_alamat, #det_email, #det_phone, #det_dob').prop('readonly', !editable);
  $('#det_gender').prop('disabled', !editable);

  $('#btnToggleEditPasien')
    .toggleClass('is-active', editable)
    .attr('title', editable ? 'Lihat' : 'Edit')
    .html(`<i class="bi ${editable ? 'bi-eye-fill' : 'bi-pencil-fill'}"></i>`);

  $('#pasienModeBadge')
    .toggleClass('is-editing', editable)
    .html(editable
      ? '<i class="bi bi-unlock-fill"></i> Mode Edit'
      : '<i class="bi bi-lock-fill"></i> Mode Lihat');

  $('#btnSimpanPasien').toggleClass('d-none', !editable);
}

function simpanPasien() {
  const payload = {
    id:       <?= $result['id'] ?>,
    fullname: $('#det_fullname').val().trim(),
    alamat:   $('#det_alamat').val().trim(),
    email:    $('#det_email').val().trim(),
    phone:    $('#det_phone').val().trim(),
    gender:   $('#det_gender').val(),
    dob:      $('#det_dob').val()
  };

  if (!payload.fullname) {
    alert('Nama lengkap tidak boleh kosong.');
    return;
  }

  $.ajax({
    url: "<?= base_url('pasien/publish') ?>",
    method: 'POST',
    data: payload,
    complete: function() {
      window.location.href = '<?= base_url('pasien') ?>';
    }
  });
}
</script>