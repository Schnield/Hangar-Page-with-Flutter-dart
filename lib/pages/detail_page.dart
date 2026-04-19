import 'package:flutter/material.dart';
import '../models/aircraft.dart';

// Halaman Detail untuk menampilkan informasi lengkap 
// tentang pesawat yang dipilih dari HangarPage

class DetailPage extends StatelessWidget {
  final Aircraft aircraft;

  const DetailPage({super.key, required this.aircraft}); // Menerima objek Aircraft yang dipilih dari halaman sebelumnya

  @override
  Widget build(BuildContext context) {
    // 1. Widget Title Section (Nama, Asal, dan Rating)
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(    // Menampilkan nama pesawat dengan gaya tebal dan ukuran lebih besar
                    aircraft.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(   // Menampilkan asal pesawat dengan warna abu-abu untuk membedakan dari nama
                  aircraft.origin,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Icon(     // Menampilkan ikon bintang untuk rating, dengan warna merah
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'), // Rating statis sesuai contoh desain
        ],
      ),
    );

    // 2. Widget Button Section (Call, Route, Share)
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // 3. Widget Text Section (Deskripsi Lengkap)
    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        aircraft.description,
        softWrap: true, // Membuat teks otomatis turun ke baris berikutnya jika terlalu panjang
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Information'),
      ),
      body: ListView(
        children: [
          // Header Image menggunakan data dari model widgets aircraft_card.dart
          // Gunakan AspectRatio agar tinggi mengikuti lebar secara proporsional
          AspectRatio(
            aspectRatio: 16 / 9, // Rasio layar lebar standar
            child: Image.asset(
              aircraft.imagePath,
              // BoxFit.cover menjaga gambar tidak gepeng, tapi akan memotong sedikit pinggirnya
              // Jika ingin melihat seluruh badan pesawat tanpa terpotong sama sekali, gunakan BoxFit.contain
              fit: BoxFit.cover, 
              // Alignment.center memastikan fokus kamera ada di tengah gambar
              alignment: Alignment.center,
            ),
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  // Helper Method untuk membuat kolom tombol agar kode tetap clean
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,   
      // Menggunakan MainAxisSize.min agar kolom hanya sebesar isinya, tidak memakan ruang vertikal lebih

      mainAxisAlignment: MainAxisAlignment.center, // Mengatur ikon dan teks agar berada di tengah kolom
      // Membuat ikon dan teks dengan warna yang sama untuk konsistensi desain
      children: [
        Icon(icon, color: Colors.indigo),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.indigo,
            ),
          ),
        ),
      ],
    );
  }
}