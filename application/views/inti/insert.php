<link rel="stylesheet" href="<?= base_url('assets/css/inti.css'); ?>">
<div class="inti-page">
  <form id="insertForm">
    <!-- Panel 1: Metadata -->
    <section class="diri-wrap" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="diri-header">
        <i class="bi bi-person-plus-fill diri-icon"></i>
        <p class="lead">Input Keluhan Pasca Prosedur Kemoterapi</p>
      </div>
      <br>
      <div class="row g-4">
        <div class="col-12 col-md-4">
          <div class="form-floating-soft">
            <label>Tanggal Input Keluhan</label>
            <input type="date" name="created" class="form-control custom-input" value="<?= date('Y-m-d') ?>" readonly>
          </div>
        </div>
        <div class="col-12 col-md-4">
          <div class="form-floating-soft">
            <label>Siklus Kemoterapi Terakhir</label>
            <select name="siklus" class="form-control custom-input" required>
              <option value="" disabled selected>Pilih Siklus Kemoterapi</option>
              <?php for ($i = 1; $i <= 10; $i++): ?>
                <option value="<?= $i ?>">Siklus <?= str_pad($i, 2, '0', STR_PAD_LEFT) ?></option>
              <?php endfor; ?>
            </select>
          </div>
        </div>
        <div class="col-12 col-md-4">
          <div class="form-floating-soft">
            <label>Tanggal Siklus Kemoterapi</label>
            <input type="date" name="last_session" class="form-control custom-input" required>
          </div>
        </div>
      </div>
    </section>
    <!-- Panel 2: Pilih Keluhan (pill options) -->
    <section class="diri-wrap" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="diri-header">
        <i class="bi bi-clipboard2-check diri-icon"></i>
        <p class="lead">Pilih Keluhan</p>
      </div>
      <br>
      <div class="keluhan-filter-header">
        <p class="keluhan-filter-label">Keluhan apa saja yang Anda rasakan saat ini ? Silakan pilih di bawah ini :</p>
        <div class="keluhan-filter-pills">
          <button type="button" class="keluhan-pill" data-target="mukositis">Luka Bibir</button>
          <button type="button" class="keluhan-pill" data-target="kelelahan">Kelelahan</button>
          <button type="button" class="keluhan-pill" data-target="mual">Mual</button>
          <button type="button" class="keluhan-pill" data-target="muntah">Muntah</button>
        </div>
      </div>
    </section>
    <!-- Panel 3: Keluhan Luka Bibir -->
    <section class="diri-wrap keluhan-panel keluhan-panel-hidden" data-keluhan-panel="mukositis" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="keluhan-card" data-keluhan="mukositis" data-mukositis="0">
        <p class="keluhan-title">Keluhan Luka Bibir : Bagaimana Luka Bibir Yang Anda Rasakan ?</p>
        <div class="keluhan-options">
          <button type="button" class="btn-option" data-value="0">Tidak Ada Keluhan</button>
          <button type="button" class="btn-option" data-value="1">Gejala Ringan</button>
          <button type="button" class="btn-option" data-value="2">Nyeri Sedang & Tidak Mengganggu Makan & Minum</button>
          <button type="button" class="btn-option" data-value="3">Nyeri & Mulai Mengganggu Makan & Minum</button>
        </div>
      </div>
    </section>
    <!-- Panel 4: Keluhan Kelelahan -->
    <section class="diri-wrap keluhan-panel keluhan-panel-hidden" data-keluhan-panel="kelelahan" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="keluhan-card" data-keluhan="kelelahan" data-kelelahan="0">
        <p class="keluhan-title">Keluhan Kelelahan : Kelelahan Seperti Apa Yang Dirasakan ?</p>
        <div class="keluhan-options">
          <button type="button" class="btn-option" data-value="0">Tidak Ada Keluhan</button>
          <button type="button" class="btn-option" data-value="1">Merasa Kelelahan Tapi Pulih Setelah Istirahat</button>
          <button type="button" class="btn-option" data-value="2">Merasa Kelelahan, Tidak Pulih Setelah Istirahat, Kegiatan Harian Mulai Terbatas</button>
          <button type="button" class="btn-option" data-value="3">Merasa Kelelahan, Tidak Pulih Setelah Istirahat, Kegiatan Perawatan Diri Mulai Terbatas</button>
        </div>
      </div>
    </section>
    <!-- Panel 5: Keluhan Mual -->
    <section class="diri-wrap keluhan-panel keluhan-panel-hidden" data-keluhan-panel="mual" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="keluhan-card" data-keluhan="mual" data-mual="0">
        <p class="keluhan-title">Keluhan Mual : Bagaimana Pengaruh Mual Anda Terhadap Selera Makan ?</p>
        <div class="keluhan-options">
          <button type="button" class="btn-option" data-value="0">Tidak Ada Keluhan</button>
          <button type="button" class="btn-option" data-value="1">Kehilangan Selera Makan Tanpa Perubahan Kebiasaan Makan</button>
          <button type="button" class="btn-option" data-value="2">Makan Mulai Berkurang Tanpa Penurunan Berat Badan, Dehidrasi & Malnutrisi</button>
          <button type="button" class="btn-option" data-value="3">Mulai Tidak Bisa Makan & Minum</button>
        </div>
      </div>
    </section>
    <!-- Panel 6: Keluhan Muntah -->
    <section class="diri-wrap keluhan-panel keluhan-panel-hidden" data-keluhan-panel="muntah" style="--diri-accent:#1e6fa8; --diri-bg:#e3f1fb; --diri-border:#b8d9ec; --diri-bg-soft:#f7fbfe;">
      <div class="keluhan-card" data-keluhan="muntah" data-muntah="0">
        <p class="keluhan-title">Keluhan Muntah : Seberapa Sering Anda Muntah Dalam Sehari ?</p>
        <div class="keluhan-options">
          <button type="button" class="btn-option" data-value="0">Tidak Ada Keluhan</button>
          <button type="button" class="btn-option" data-value="1">1 Sampai Dengan 2 Kali Sehari Dalam 5 Menit</button>
          <button type="button" class="btn-option" data-value="2">3 Sampai Dengan 5 Kali Sehari Dalam 5 Menit</button>
          <button type="button" class="btn-option" data-value="3">Sama Dengan Atau Lebih Dari 6 Kali Dalam 5 Menit</button>
        </div>
      </div>
    </section>
    <div class="diri-actions mt-2">
      <a href="<?= base_url('inti') ?>" class="btn btn-soft">Batal</a>
      <button type="submit" class="btn btn-care" id="btnSimpan">Simpan Input Data Keluhan</button>
    </div>
  </form>
</div>

<script>
  function bindPillFilters() {
    // Toggle a whole keluhan panel's visibility when its pill is clicked.
    // Hidden panels keep their card's default data-<key>="0" and are never required.
    $(document).on('click', '.keluhan-pill', function() {
      const $pill = $(this);
      const key = $pill.data('target');
      const $panel = $('.keluhan-panel[data-keluhan-panel="' + key + '"]');
      const $card = $panel.find('.keluhan-card[data-keluhan="' + key + '"]');

      const nowActive = !$pill.hasClass('active');
      $pill.toggleClass('active', nowActive);
      $panel.toggleClass('keluhan-panel-hidden', !nowActive);

      if (!nowActive) {
        // Reset back to default "no complaint" state when hidden again,
        // and clear any previously selected option button.
        $card.attr('data-' + key, '0');
        $card.attr('data-touched', null);
        $card.find('.btn-option').removeClass('selected');
      }
    });
  }

  function bindKeluhanButtons() {
    // Bind Click Event to Button Inside Multiple Card & Label Value
    $(document).on('click', '.keluhan-card .btn-option', function() {
      const $btn = $(this);
      const $card = $btn.closest('.keluhan-card');
      const key = $card.data('keluhan');
      const value = $btn.data('value');
      $card.attr('data-' + key, value);
      $card.attr('data-touched', 'true');
      $card.find('.btn-option').removeClass('selected');
      $btn.addClass('selected');
    });
  }

  function getKeluhanValues() {
    // Dapatkan Nilai Keluhan Dari Setiap Card Dengan Data Attribute.
    // Hidden/unselected panels keep their default "0" automatically.
    const result = {};
    $('.keluhan-card[data-keluhan]').each(function() {
      const $card = $(this);
      const key = $card.data('keluhan');
      result[key] = $card.attr('data-' + key) || '0';
    });
    return result;
  }

  function getUnansweredActiveCards() {
    // Only cards whose panel is visible (pill active) require an explicit answer.
    const unanswered = [];
    $('.keluhan-panel').not('.keluhan-panel-hidden').each(function() {
      const $card = $(this).find('.keluhan-card[data-keluhan]');
      if ($card.attr('data-touched') !== 'true') {
        unanswered.push($card.find('.keluhan-title').text());
      }
    });
    return unanswered;
  }

  bindPillFilters();
  bindKeluhanButtons();

  $(document).on('submit', '#insertForm', function(e) {
    e.preventDefault();
    const formData = new FormData(this);
    const formValues = Object.fromEntries(formData.entries());
    const keluhanValues = getKeluhanValues();
    const payload = { ...formValues, ...keluhanValues };

    const unanswered = getUnansweredActiveCards();
    if (unanswered.length) {
      alert('Mohon lengkapi jawaban untuk keluhan yang dipilih.');
      return;
    }
    const siklus = parseInt(formValues.siklus, 10);
    if (!formValues.siklus || !formValues.last_session || isNaN(siklus) || siklus < 1) {
      alert('Mohon Lengkapi Siklus & Tanggal Siklus Kemoterapi. Siklus harus mulai dari 1.');
      return;
    }
    // Controller Publish & Complete
    $.ajax({
      url: '<?= base_url('inti/publish') ?>',
      method: 'POST',
      data: payload,
      dataType: 'json',
      success: function(res) {
        if (res.status === 'success') {
          window.location.href = '<?= base_url('inti/detail/') ?>' + res.idKey;
        } else {
          window.location.href = '<?= base_url('inti') ?>';
        }
      },
      error: function() {
        window.location.href = '<?= base_url('inti') ?>';
      }
    });
  });
</script>