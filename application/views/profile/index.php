<link rel="stylesheet" href="<?= base_url('assets/css/profile.css'); ?>">

<div class="profile-page">

  <section class="hero">
    <div class="hero-rays"></div>
    <div class="hero-dot"></div>
    <div class="hero-inner">
      <span class="hero-kicker"><i class="bi bi-person-fill"></i>Data Diri</span>
      <!-- Nama Pasien -->
      <h1 class="hero-name"><?php echo $result['fullname'];?></h1>

      <div class="hero-grid">
        <!-- Nomor Induk Kependudukan -->
        <div class="hero-stat">
          <div class="hero-stat-icon"><i class="bi bi-person-vcard"></i></div>
          <div><div class="hero-stat-cap">Nomor Induk Kependudukan</div><div class="hero-stat-val"><?php echo $result['nik'];?></div></div>
        </div>
        <!-- Tanggal Lahir -->
        <div class="hero-stat">
          <div class="hero-stat-icon"><i class="bi bi-calendar-heart"></i></div>
          <div><div class="hero-stat-cap">Tanggal Lahir</div><div class="hero-stat-val"><?php echo $result['dob'];?></div></div>
        </div>
        <!-- Telefon -->
        <div class="hero-stat">
          <div class="hero-stat-icon"><i class="bi bi-telephone"></i></div>
          <div><div class="hero-stat-cap">Telepon</div><div class="hero-stat-val"><?php echo $result['phone'];?></div></div>
        </div>
        <!-- Tempat Tinggal -->
        <div class="hero-stat">
          <div class="hero-stat-icon"><i class="bi bi-house-heart"></i></div>
          <div><div class="hero-stat-cap">Alamat</div><div class="hero-stat-val"><?php echo $result['alamat'];?></div></div>
        </div>
      </div>
    </div>
  </section>

  <!-- Double Column 2x2 -->
  <form method="post" action="<?= base_url('profile/publish'); ?>" id="profileForm">
    <section class="section">
      <div class="section-head">
        <div class="section-head-left">
          <div class="section-icon"><i class="bi bi-person-lines-fill"></i></div>
          <div>
            <h2 style="margin-bottom:10px">Informasi Dasar</h2>
            <span>Data Ini Digunakan Tim Medis Untuk Merawatmu Dengan Lebih Baik</span>
          </div>
        </div>
        <!-- Pencil -->
        <button type="button" class="edit-btn" id="btnToggleEdit" onclick="toggleEdit()">
          <i class="bi bi-pencil"></i>
        </button>
      </div>

      <div class="grid2">
        <div class="field">
          <label>Nama Lengkap</label>
          <input type="text" name="fullname" class="box editable" value="<?php echo $result['fullname'];?>" readonly>
        </div>

        <div class="field">
          <label>Jenis Kelamin</label>
          <select name="gender" class="editable" disabled>
            <option value="Pria" <?php echo ($result['gender'] == 'Pria') ? 'selected' : ''; ?>>Pria</option>
            <option value="Wanita" <?php echo ($result['gender'] == 'Wanita') ? 'selected' : ''; ?>>Wanita</option>
          </select>
        </div>

        <div class="field">
          <label>Tanggal Lahir</label>
          <input type="date" name="dob" class="box editable" value="<?php echo $result['dob'];?>" readonly>
        </div>

        <div class="field">
          <label>Electronic Mail</label>
          <input type="text" name="email" class="box editable" value="<?php echo $result['email'];?>" readonly>
        </div>

        <div class="field">
          <label>Tempat Tinggal</label>
          <input type="text" name="alamat" class="box editable" value="<?php echo $result['alamat'];?>" readonly>
        </div>

        <div class="field">
          <label>Telephone</label>
          <input type="text" name="phone" class="box editable" value="<?php echo $result['phone'];?>" readonly>
        </div>
      </div>

      <div class="actions" id="profileActions" style="display: none;">
        <button type="reset" class="btn btn-soft" onclick="toggleEdit()">
          Batal
        </button>
        <button type="submit" class="btn btn-care">
          Perbarui
        </button>
      </div>

    </section>
  </form>

</div>

<script>
function toggleEdit() {
  const inputs = document.querySelectorAll('.editable');
  const actions = document.getElementById('profileActions');
  const btn = document.getElementById('btnToggleEdit');
  const isEditing = btn.dataset.editing === 'true';

  if (isEditing) {
    inputs.forEach(i => {i.setAttribute('readonly', true); i.setAttribute('disabled', true);});
    actions.style.display = 'none';
    btn.innerHTML = '<i class="bi bi-pencil"></i>';
    btn.dataset.editing = 'false';
  } else {
    inputs.forEach(i => {i.removeAttribute('readonly'); i.removeAttribute('disabled');});
    actions.style.display = 'flex';
    btn.innerHTML = '<i class="bi bi-eye"></i>';
    btn.dataset.editing = 'true';
  }
}
</script>