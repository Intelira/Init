<!-- Custom Style -->
<link rel="stylesheet" href="<?= base_url('assets/css/auth.css'); ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/profile.css'); ?>">

<div class="profile-page">
  <form method="post" action="<?= base_url('profile/publish'); ?>" id="profileForm">
    <section class="section">
      <div class="section-head">
        <div class="section-head-left">
          <div class="section-icon"><i class="bi bi-person-lines-fill"></i></div>
          <div>
            <h2>Input Data Pasien Baru</h2>
          </div>
        </div>
      </div>
      <!-- Field I -->
      <div class="grid2">
        <!-- Kode Rekam Medis -->
        <div class="field">
          <label>Kode Rekam Medis</label>
          <input type="text" name="mrn" class="box editable">
        </div>
        <!-- Nomor Induk Kependudukan -->
        <div class="field">
          <label>Nomor Induk Kependudukan</label>
          <input type="text" name="nik" class="box editable">
        </div>
      </div>
      <!-- Field II -->
      <div class="grid2">
        <!-- Fullname -->
        <div class="field">
          <label>Nama Lengkap</label>
          <input type="text" name="fullname" class="box editable">
        </div>
        <!-- Jenis Kelamin -->
        <div class="field">
          <label>Jenis Kelamin</label>
          <select name="gender" class="editable">
            <option selected disabled>Pilih jenis kelamin</option>
            <option value="Pria">Pria</option>
            <option value="Wanita">Wanita</option>
          </select>
        </div>
        <!-- Tanggal Lahir -->
        <div class="field">
          <label>Tanggal Lahir</label>
          <input type="date" name="dob" class="box editable">
        </div>
        <!-- Electronic Mail -->
        <div class="field">
          <label>Electronic Mail</label>
          <input type="email" name="email" class="box editable">
        </div>
        <!-- Date of Birth -->
        <div class="field">
          <label>Tempat Tinggal</label>
          <input type="text" name="alamat" class="box editable">
        </div>
        <!-- Telefon -->
        <div class="field">
          <label>Telephone</label>
          <input type="text" name="phone" class="box editable">
        </div>
      </div>
      <!-- Field III -->
      <div class="grid2">
        <!-- Kata Sandi -->
        <div class="field">
          <label class="form-label-fancy">Kata Sandi</label>
          <div class="position-relative">
            <input type="password" name="password" class="form-control fancy-input" id="regPassword" placeholder="••••••••" required>
            <button type="button" class="btn-toggle-password" id="btnToggleReg">
              <i class="bi bi-eye" id="iconReg"></i>
            </button>
          </div>
        </div>
        <!-- Ulangi Kata Sandi -->
        <div class="field">
          <label class="form-label-fancy">Ulangi Sandi</label>
          <div class="position-relative">
            <input type="password" class="form-control fancy-input" id="confirmPassword" placeholder="••••••••" required>
            <button type="button" class="btn-toggle-password" id="btnToggleConfirm">
              <i class="bi bi-eye" id="iconConfirm"></i>
            </button>
          </div>
          <div id="passwordError" class="mt-1"></div>
        </div>
      </div>

      <div class="actions" id="profileActions">
        <button type="reset" class="btn btn-soft">
          Batal
        </button>
        <button type="submit" class="btn btn-care">
          Kirim
        </button>
      </div>
    </section>
  </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Initiate Toggle for Both Fields
  initpass('btnToggleReg', 'regPassword', 'iconReg');
  initpass('btnToggleConfirm', 'confirmPassword', 'iconConfirm');
  // Initiate Live Review
  initvalidate('regPassword', 'confirmPassword', 'passwordError');
  // Final Form Guard
  const form = document.getElementById('profileForm');
  if (form) {
    form.addEventListener('submit', function(e) {
      const pass = document.getElementById('regPassword').value;
      const confirm = document.getElementById('confirmPassword').value;
      if (pass !== confirm) {
        e.preventDefault();
        alert('Pastikan Kata Sandi Sudah Cocok Sebelum Mendaftar !');
      }
    });
  }
});
</script>