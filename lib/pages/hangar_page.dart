import 'package:flutter/material.dart';
import '../models/aircraft.dart';
import '../widgets/aircraft_card.dart';
import '../widgets/custom_text_field.dart'; // Baru
import 'detail_page.dart';

class HangarPage extends StatefulWidget {
  const HangarPage({super.key});

  @override
  State<HangarPage> createState() => _HangarPageState(); 
}

class _HangarPageState extends State<HangarPage> {
  List<Aircraft> _filteredAircraft = [];
  bool _isLoading = false; // State baru untuk loading skeleton

  @override
  void initState() {    
    super.initState();  
    _filteredAircraft = aircraftList;
  }

  // fungsi untuk memfilter daftar pesawat berdasarkan keyword yang dimasukkan di kolom pencarian
  void _runFilter(String enteredKeyword) {
    // setState(() {
    //   _isLoading = true; // Aktifkan loading saat mulai mencari
    // });

    // Simulasi delay jaringan/proses selama 800ms
    // Future.delayed(const Duration(milliseconds: 800), () {
    //   List<Aircraft> results = [];
    //   if (enteredKeyword.isEmpty) {
    //     results = aircraftList;
    //   } else {
    //     results = aircraftList
    //         .where((aircraft) =>
    //             aircraft.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
    //         .toList();
    //   }

      // Contoh hasil filter (untuk testing, bisa dihapus saat implementasi sebenarnya)
      List<Aircraft> results = [];

      if (enteredKeyword.isEmpty) {
        results = aircraftList;
      } else {
        results = aircraftList
            .where((aircraft) =>
                aircraft.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _filteredAircraft = results;
        _isLoading = false; // Matikan loading setelah selesai
      });
    // }); // un-comment saat ingin menggunakan simulasi delay untuk melihat efek loading skeleton
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangar Inventory'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // SEBELUMNYA: Padding berisi TextField panjang
          // SESUDAHNYA: Memanggil Reusable Widget CustomTextField
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              label: 'Search Aircraft...',
              prefixIcon: Icons.search,
              onTyping: () => setState(() => _isLoading = true), // Tampilkan loading saat mengetik
              onChanged: (value) => _runFilter(value),
            ),
          ),
          
          Expanded(
            child: _isLoading 
              ? ListView.builder( // Menampilkan 5 skeleton saat loading
                  itemCount: 5,
                  itemBuilder: (context, index) => const AircraftCard(isLoading: true),
                )
              : _filteredAircraft.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredAircraft.length,
                    itemBuilder: (context, index) {
                      return AircraftCard(
                        aircraft: _filteredAircraft[index],
                        onTap: () {
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