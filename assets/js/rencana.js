const saranMukositisSikatGigi = "Sikat Gigi 2 hingga 4 Kali Sehari dengan Sikat Berbulu Ekstra Lembut yang Direndam Air Hangat.";
const saranMukositisPasta = "Gunakan Pasta Gigi Berasa Netral.";
const saranMukositisKumur = "Berkumurlah Minimal 4 Kali Sehari dengan Setengah Sendok Teh Garam dalam Segelas Air.";
const saranMukositisObatKumur = "Hindari Obat Kumur yang Mengandung Alkohol.";
const saranMukositisBibir = "Jaga Kelembapan Bibir dengan Pelembap.";
const saranMukositisGigiPalsu = "Jika Memakai Gigi Palsu, Lepas saat Membersihkan Mulut dan Biarkan Terlepas Minimal 8 Jam Sehari.";
const saranMukositisMinum = "Minum 8 - 12 Gelas Cairan Sehari agar Mulut Tetap Lembap.";
const saranMukositisMakanAnjuran = "Pilih Makanan Tinggi Protein serta Vitamin B dan C. Makanan yang Lembut dan Lembap, dengan Kuah atau Saus, Lebih Nyaman Ditelan.";
const saranMukositisMakanPantangan = "Kurangi Makanan yang Kering, Kasar, Pedas, Terlalu Panas, atau Sangat Asam.";
const saranMukositisBatasi = "Batasi Juga Gula, Kafein, Alkohol, dan Tembakau.";
const saranKelelahanMinum = "Minum 8 - 12 Gelas Sehari (Kecuali Ada Pembatasan Medis).";
const saranKelelahanMakan = "Jika Mual, Makan Porsi Kecil tapi Sering dan Tinggi Protein.";
const saranKelelahanAktivitas = "Seimbangkan Waktu Aktivitas dan Istirahat. Lakukan Hal Terpenting saat Energi Anda Sedang Penuh.";
const saranKelelahanBantuan = "Tunda atau Minta Bantuan untuk Tugas Berat.";
const saranKelelahanPostur = "Beraktivitaslah Sambil Duduk, Hindari Membungkuk, dan Gunakan Lift atau Eskalator.";
const saranMualMakan = "Makan dalam Porsi Kecil dengan Menu Hambar yang Disajikan Dingin, seperti Nasi, Biskuit, atau Roti Bakar.";
const saranMualMinum = "Minum Sedikit demi Sedikit, Target 8 - 10 Gelas Sehari, dan Beri Jarak dari Waktu Makan.";
const saranMualMinumPilihan = "Pilihan Minuman: Air Kelapa, Jus Encer, Kaldu, Es Batu, atau Buah Beku.";
const saranMualKhusus = "Untuk Meredakan Mual, Coba Teh atau Smoothie Jahe, Kulit Lemon, Daun Mint, Permen Jahe, atau Minuman Jahe.";
const saranMuntahTunggu = "Setelah Muntah, Tunggu 30 hingga 60 Menit Sebelum Makan Makanan Padat.";
const saranMuntahUrutanAwal = "Mulai Perlahan dengan Cairan Bening (Air, Kaldu, Es Batu), Lalu Makanan Kering (Biskuit, Roti Bakar).";
const saranMuntahUrutanLanjut = "Lanjutkan dengan Makanan Berprotein (Ayam, Ikan, Telur), Lalu Produk Susu (Yogurt, Keju).";
const saranMuntahMakan = "Makan dalam Porsi Kecil dengan Menu Hambar yang Disajikan Dingin, seperti Nasi, Biskuit, atau Roti Bakar.";
const saranMuntahMinum = "Minum Sedikit demi Sedikit, Target 8 - 10 Gelas Sehari, dan Beri Jarak dari Waktu Makan.";
const saranKebersihanMulut = "Tetap Jaga Kebersihan Mulut.";
const saranMualMuntahAlkohol = "Hindari Alkohol dan Tembakau.";
const saranMualMuntahDuduk = "Duduk Tegak 30 hingga 60 Menit Setelah Makan Sebelum Berbaring.";
const daruratAnjuran = "Segera Periksa ke IGD Terdekat Hari Ini agar Kondisi Anda Terpantau dengan Baik.";
const daruratTenang = "Ini Langkah Antisipasi yang Wajar Setelah Kemoterapi, Jadi Tidak Perlu Khawatir Berlebihan. Tim Medis Akan Membantu Anda.";
const darurat = [daruratAnjuran, daruratTenang].join(' ');
const blokMukositisKebersihan = [saranMukositisSikatGigi, saranMukositisPasta, saranMukositisKumur, saranMukositisObatKumur].join(' ');
const blokMukositisPerawatan = [saranMukositisBibir, saranMukositisGigiPalsu].join(' ');
const blokMukositisDiet = [saranMukositisMinum, saranMukositisMakanAnjuran, saranMukositisMakanPantangan, saranMukositisBatasi].join(' ');
const blokKelelahanNutrisi = [saranKelelahanMinum, saranKelelahanMakan].join(' ');
const blokKelelahanAktivitas = [saranKelelahanAktivitas].join(' ');
const blokKelelahanPostur = [saranKelelahanBantuan, saranKelelahanPostur].join(' ');
const blokMualAnjuran = [saranMualMakan, saranMualMinum, saranMualMinumPilihan, saranKebersihanMulut].join(' ');
const blokMualKhusus = [saranMualKhusus].join(' ');
const blokMuntahPemulihan = [saranMuntahTunggu, saranMuntahUrutanAwal, saranMuntahUrutanLanjut].join(' ');
const blokMuntahAnjuran = [saranMuntahMakan, saranMuntahMinum, saranKebersihanMulut].join(' ');
const blokMualMuntahHindari = [saranMualMuntahAlkohol, saranMualMuntahDuduk].join(' ');

const plan = {
  // Keluhan Luka Bibir
  mukositis: {
    0: 'Tidak Ada Keluhan',
    1: [blokMukositisKebersihan, blokMukositisPerawatan, blokMukositisDiet].join(' '),
    2: darurat,
    3: darurat
  },

  // Keluhan Kelelahan
  kelelahan: {
    0: 'Tidak Ada Keluhan',
    1: [blokKelelahanNutrisi, blokKelelahanAktivitas, blokKelelahanPostur].join(' '),
    2: darurat,
    3: darurat
  },

  // Keluhan Mual
  mual: {
    0: 'Tidak Ada Keluhan',
    1: [blokMualAnjuran, blokMualKhusus, blokMualMuntahHindari].join(' '),
    2: darurat,
    3: darurat
  },

  // Keluhan Muntah
  muntah: {
    0: 'Tidak Ada Keluhan',
    1: [blokMuntahPemulihan, blokMuntahAnjuran, blokMualMuntahHindari].join(' '),
    2: darurat,
    3: darurat
  }
};

function labelPlan(type, grade) {
  // Key Value Kode & Keluhan
  return (plan[type] && plan[type][grade] !== undefined)
    // Jika Keluhan Available
    ? plan[type][grade]
    // Jika Tiada Keluhan
    : '-';
}

// Pecah Teks Saran Jadi Poin Per Kalimat (Teks Asli Tidak Diubah, Hanya Presentasinya)
function renderSaranList(selector, text) {
  // Special Modifier
  const $list = $(selector + ' .saran-list').empty();
  // Kalau Teks Kosong Tampilkan Apa Adanya sebagai Satu Poin
  if (!text || text.trim() === '-' ) {
    $list.append($('<li>').text(text || '-'));
    return;
  }
  // Kalimat Dipecah Berdasarkan Titik
  const kalimat = text.match(/[^.]+(\.|$)/g) || [text];
  // Buat Satu Poin untuk Setiap Kalimat, Lewati yang Kosong
  kalimat.forEach(function(k) {
    k = k.trim();
    if (k) $list.append($('<li>').text(k));
  });
}