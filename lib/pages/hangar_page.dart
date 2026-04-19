import 'package:flutter/material.dart';
import '../models/aircraft.dart';
import '../widgets/aircraft_card.dart';
import 'detail_page.dart';

// halaman home page untuk menampilkan daftar pesawat dengan fitur pencarian sederhana

// HangarPage adalah halaman utama yang menampilkan daftar pesawat yang tersedia di hangar, 
// lengkap dengan fitur pencarian untuk memudahkan pengguna menemukan pesawat yang diinginkan. 
// Setiap pesawat ditampilkan dalam bentuk kartu yang interaktif, 
// dan pengguna dapat mengetuk kartu untuk melihat detail lebih lanjut 
// tentang pesawat tersebut di halaman DetailPage.
class HangarPage extends StatefulWidget {
  const HangarPage({super.key});

  @override
  // Membuat state untuk HangarPage agar dapat mengelola perubahan data saat pencarian
  State<HangarPage> createState() => _HangarPageState(); 
}

// State untuk HangarPage yang mengelola logika pencarian dan daftar pesawat yang ditampilkan
class _HangarPageState extends State<HangarPage> {
  // Controller untuk menangani input di kolom pencarian
  final TextEditingController _searchController = TextEditingController();
  
  // List hasil filter yang akan ditampilkan di layar
  List<Aircraft> _filteredAircraft = [];

  @override
  void initState() {    // Inisialisasi awal: tampilkan semua pesawat
    super.initState();  // Memanggil initState untuk melakukan setup awal sebelum widget ditampilkan
    // Inisialisasi awal: tampilkan semua pesawat
    _filteredAircraft = aircraftList;
  }

  // Fungsi pencarian (Basic State Management)
  void _runFilter(String enteredKeyword) {  // Fungsi untuk memfilter daftar pesawat berdasarkan input pencarian
    List<Aircraft> results = [];            // List sementara untuk menyimpan hasil filter
    if (enteredKeyword.isEmpty) {           // Jika kolom pencarian kosong, tampilkan semua pesawat
      results = aircraftList;               // Menampilkan semua pesawat jika tidak ada kata kunci yang dimasukkan
    } else {
      results = aircraftList
          .where((aircraft) =>
              // Filter berdasarkan nama pesawat, case-insensitive
              aircraft.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList(); // Konversi hasil filter menjadi list
    }

    // Memberitahu Flutter untuk menggambar ulang UI dengan data baru
    setState(() {
      _filteredAircraft = results; // Update daftar pesawat yang ditampilkan sesuai hasil filter
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HANGAR INFORMATION', 
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
        centerTitle: true,
        elevation: 0,       // Menghilangkan shadow pada AppBar untuk tampilan yang lebih bersih
        backgroundColor: Colors.white,
      ),
      body: Column(   // Menggunakan Column untuk menempatkan widget pencarian di atas dan daftar pesawat di bawah
        children: [
          // 1. Search Section (Hanya penelusuran biasa)
          Padding(
            padding: const EdgeInsets.all(16.0),  
            // Memberikan padding di sekitar kolom pencarian agar tidak menempel ke tepi layar
            
            child: TextField(
              controller: _searchController, // Menghubungkan TextField dengan controller untuk mengelola input pengguna
              onChanged: (value) => _runFilter(value),  
              // Memanggil fungsi filter setiap kali teks berubah untuk memperbarui daftar pesawat yang ditampilkan
              
              // Dekorasi untuk kolom pencarian dengan label, ikon, dan border yang melengkung
              decoration: InputDecoration( 
                labelText: 'Search Aircraft...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          // 2. List Section
          Expanded(
            child: _filteredAircraft.isNotEmpty // Mengecek apakah ada hasil filter yang ditemukan
                ? ListView.builder( 
                  // Menggunakan ListView.builder untuk membuat daftar yang dapat digulir 
                  // dengan jumlah item yang tidak terbatas

                    // Menampilkan daftar pesawat yang sudah difilter
                    itemCount: _filteredAircraft.length,

                    // Setiap item di list akan menjadi kartu pesawat yang bisa diklik
                    itemBuilder: (context, index) {

                      // Ketika kartu pesawat diklik, navigasi ke halaman detail dengan data pesawat yang dipilih
                      return AircraftCard(

                        // Mengirim data pesawat yang sudah difilter ke widget AircraftCard
                        aircraft: _filteredAircraft[index],
                        onTap: () {
                          // Navigator untuk berpindah ke halaman detail
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                aircraft: _filteredAircraft[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text('Aircraft not found in hangar.'),
                  ),
          ),
        ],
      ),
    );
  }
}