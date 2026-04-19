// Model untuk merepresentasikan data pesawat tempur

class Aircraft {
  final String name;
  final String origin;
  final String imagePath;
  final String description;

  // Constructor: Fungsi untuk membuat objek baru
  Aircraft({
    required this.name,         // Nama pesawat (misal: "F-16C Viper")
    required this.origin,       // Asal pesawat (misal: "Amerika Serikat")
    required this.imagePath,    // Jalur gambar pesawat
    required this.description,  // Deskripsi pesawat
  });
}

// Data list pesawat yang akan ditampilkan di aplikasi
final List<Aircraft> aircraftList = [
  Aircraft(
    name: 'Dassault Rafale',
    origin: 'Prancis',
    imagePath: 'assets/images/dassault_rafale.webp',
    description: 'Pesawat tempur multiperan mesin ganda sayap delta sayap kanard dari Prancis.',
  ),
  Aircraft(
    name: 'Su-35 Flanker-E',
    origin: 'Rusia',
    imagePath: 'assets/images/su35black.jpg',
    description: 'Pesawat tempur superioritas udara berat jarak jauh bermesin ganda Rusia.',
  ),
  Aircraft(
    name: 'Eurofighter Typhoon',
    origin: 'Uni Eropa',
    imagePath: 'assets/images/eurofighter-typhoon-1.webp',
    description: 'Pesawat tempur multiperan bermesin ganda, sayap delta, dan sayap kanard.',
  ),
  Aircraft(
    name: 'F/A-18C Hornet',
    origin: 'Amerika Serikat',
    imagePath: 'assets/images/f18c-hornet.jpg',
    description: 'Pesawat tempur multiperan supersonik segala cuaca yang mampu beroperasi dari kapal induk.',
  ),
  Aircraft(
    name: 'F-16C Viper',
    origin: 'Amerika Serikat',
    imagePath: 'assets/images/f16c-viper.jpg',
    description: 'Pesawat tempur multiperan bermesin tunggal yang sangat lincah.',
  ),
  Aircraft(
    name: 'MiG-35 Fulcrum-F',
    origin: 'Rusia',
    imagePath: 'assets/images/mig35-fulcrum-f.jpg',
    description: 'Pengembangan lebih lanjut dari teknologi MiG-29M/M2 dan MiG-29K/KUB.',
  ),
  Aircraft(
    name: 'F-86 Sabre',
    origin: 'Amerika Serikat',
    imagePath: 'assets/images/f-86_sabre.jpg',
    description: 'Pesawat tempur transonik berkursi tunggal yang ikonik dari era Perang Korea.',
  ),
  Aircraft(
    name: 'MiG-15',
    origin: 'Uni Soviet',
    imagePath: 'assets/images/mig-15-bis.jpg',
    description: 'Pesawat jet tempur pertama Soviet yang sukses dengan sayap sapu ke belakang.',
  ),
  Aircraft(
    name: 'F-15 Eagle',
    origin: 'Amerika Serikat',
    imagePath: 'assets/images/f-15-eagle.webp',
    description: 'Pesawat tempur taktis superioritas udara segala cuaca yang sangat sukses.',
  ),
  Aircraft(
    name: 'JAS 39 Gripen',
    origin: 'Swedia',
    imagePath: 'assets/images/jas_39_gripen.jpg',
    description: 'Pesawat tempur multiperan bermesin tunggal yang ringan dan sangat efisien.',
  ),
  Aircraft(
    name: 'J-10B',
    origin: 'Tiongkok',
    imagePath: 'assets/images/j-10b.jpg',
    description: 'Pesawat tempur multiperan segala cuaca dengan desain sayap delta dan kanard.',
  ),
  Aircraft(
    name: 'Mirage 2000-5',
    origin: 'Prancis',
    imagePath: 'assets/images/mirage2k5.png',
    description: 'Pesawat tempur multiperan bermesin ganda dengan kemampuan siluman.',
  ),
];