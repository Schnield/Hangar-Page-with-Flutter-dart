import 'package:flutter/material.dart';
import '../models/aircraft.dart';
import '../widgets/custom_button.dart'; // Baru

class DetailPage extends StatelessWidget {
  final Aircraft aircraft;

  const DetailPage({super.key, required this.aircraft});

  @override
  Widget build(BuildContext context) {
    // titleSection menampilkan nama dan asal pesawat dengan styling yang sesuai desain
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
    
    // buttonSection menggunakan CustomButton yang lebih clean
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          icon: Icons.call,
          label: 'CALL',
          onTap: () {},
        ),
        CustomButton(
          icon: Icons.near_me,
          label: 'ROUTE',
          onTap: () {},
        ),
        CustomButton(
          icon: Icons.share,
          label: 'SHARE',
          onTap: () {},
        ),
      ],
    );

    // textSection menampilkan deskripsi lengkap pesawat dengan padding dan styling yang nyaman dibaca
    Widget textSection = Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        aircraft.description,
        softWrap: true, // Membuat teks otomatis turun ke baris berikutnya jika terlalu panjang
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    );

    // Scaffold utama yang menyusun semua section di atas dalam ListView agar bisa di-scroll
    return Scaffold(
      appBar: AppBar(title: Text(aircraft.name)),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(aircraft.imagePath, fit: BoxFit.cover),
          ),
          // Memanggil section yang sudah didefinisikan
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}