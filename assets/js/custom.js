function initpass(toggleId, inputId, iconId) {
  // Helper to Hide & Display Kata Sandi
  document.getElementById(toggleId).addEventListener('click', function () {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(iconId);
    if (input.type === 'password') {
      input.type = 'text';
      icon.className = 'bi bi-eye-slash';
    } else {
      input.type = 'password';
      icon.className = 'bi bi-eye';
    }
  });
}

function initvalidate(passwordId, confirmId, errorId) {
  // Melakukan Validasi Dua Input Kata Sandi
  const confirm = document.getElementById(confirmId);
  const error = document.getElementById(errorId);
  confirm.addEventListener('input', function () {
    const pass = document.getElementById(passwordId).value;
    if (this.value && this.value !== pass) {
      error.textContent = 'Password Tidak Sama !';
      error.style.color = 'red';
      error.style.fontSize = '0.82rem';
    } else {
      error.textContent = '';
    }
  });
}

function farewell(e) {
  // Display Modal
  e.preventDefault();
  const url = e.currentTarget.href;
  const modal = new bootstrap.Modal(document.getElementById('logoutModal'));
  modal.show();
  setTimeout(() => { window.location.href = url; }, 4000);
}