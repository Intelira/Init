<!-- Panel Kepala -->
<nav class="navbar navbar-expand-lg navbar-sky">
  <div class="container d-flex justify-content-end">
    <!-- Profile Wrapper -->
    <div class="dropdown ms-auto">
      <a href="#" class="patient-trigger" data-bs-toggle="dropdown">
        <?= $this->session->userdata('name'); ?>
      </a>
      <!-- Pilihan -->
      <ul class="dropdown-menu dropdown-menu-end">
        <!-- Tukar Kata Sandi -->
        <li>
          <a class="dropdown-item" href="<?php echo base_url('profile/password'); ?>">
            Tukar Kata Sandi
          </a>
        </li>
        <li><hr class="dropdown-divider"></li>
        <!-- Keluar -->
        <li>
          <a class="dropdown-item text-danger" href="<?php echo base_url('auth/logout'); ?>" onclick="farewell(event)">
            Keluar
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>