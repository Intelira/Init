const KELUHAN = {
  // Keluhan Luka Bibir
  mukositis: {
    0: 'Tidak Ada Keluhan',
    1: 'Gejala Ringan',
    2: 'Nyeri Sedang & Tidak Mengganggu Makan & Minum',
    3: 'Nyeri & Mulai Mengganggu Makan & Minum'
  },
  // Keluhan Kelelahan
  kelelahan: {
    0: 'Tidak Ada Keluhan',
    1: 'Merasa Kelelahan Tapi Pulih Setelah Istirahat',
    2: 'Merasa Kelelahan, Tidak Pulih Setelah Istirahat, Kegiatan Harian Mulai Terbatas',
    3: 'Merasa Kelelahan, Tidak Pulih Setelah Istirahat, Kegiatan Perawatan Diri Mulai Terbatas'
  },
  // Keluhan Mual
  mual: {
    0: 'Tidak Ada Keluhan',
    1: 'Kehilangan Selera Makan Tanpa Perubahan Kebiasaan Makan',
    2: 'Makan Mulai Berkurang Tanpa Penurunan Berat Badan, Dehidrasi & Malnutrisi',
    3: 'Mulai Tidak Bisa Makan & Minum'
  },
  // Keluhan Muntah
  muntah: {
    0: 'Tidak Ada Keluhan',
    1: '1 Sampai Dengan 2 Kali Sehari Dalam 5 Menit',
    2: '3 Sampai Dengan 5 Kali Sehari Dalam 5 Menit',
    3: 'Sama Dengan Atau Lebih Dari 6 Kali Dalam 5 Menit'
  }
};

function labelKeluhan(type, grade) {
  // Key Value Kode & Keluhan
  return (KELUHAN[type] && KELUHAN[type][grade] !== undefined)
    ? KELUHAN[type][grade]
    : '-';
}