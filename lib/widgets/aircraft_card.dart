import 'package:flutter/material.dart';
import '../models/aircraft.dart';

// Widget Kartu Pesawat dengan Animasi Hover dan Tekan

class AircraftCard extends StatefulWidget {
  final Aircraft aircraft;
  final VoidCallback onTap;

  const AircraftCard({
    super.key,
    required this.aircraft,
    required this.onTap,
  });

  @override
  State<AircraftCard> createState() => _AircraftCardState();
}

class _AircraftCardState extends State<AircraftCard> { // State untuk mengelola efek hover dan tekan pada kartu pesawat
  
  // State untuk melacak apakah sedang di-hover atau ditekan
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Efek Hover (Mouse)
      onEnter: (_) => setState(() => _isActive = true),
      onExit: (_) => setState(() => _isActive = false),
      child: GestureDetector(
        // Efek Tekan (Touch/Android)
        onTapDown: (_) => setState(() => _isActive = true),
        onTapUp: (_) => setState(() => _isActive = false),
        onTapCancel: () => setState(() => _isActive = false),
        onTap: widget.onTap,
        
        // animasi widget saat card list di-hover atau ditekan
        child: AnimatedScale( // Menggunakan AnimatedScale untuk memberikan efek pembesaran saat di-hover atau ditekan
          scale: _isActive ? 1.03 : 1.0, // Membesar 3% saat aktif
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,  // Menggunakan kurva untuk membuat animasi lebih halus
          child: AnimatedContainer( // Menggunakan AnimatedContainer untuk mengubah dekorasi secara animasi
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(  // Dekorasi kartu dengan warna putih, border radius, dan shadow
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              // Shadow juga ikut menebal saat di-hover agar efek "melayang" terasa
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(_isActive ? 0.15 : 0.05),
                  blurRadius: _isActive ? 20 : 10,
                  offset: Offset(0, _isActive ? 8 : 4),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(  // Membuat gambar pesawat dengan sudut melengkung sesuai border radius kartu
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.aircraft.imagePath,  // Menampilkan gambar pesawat dari jalur yang diberikan
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                
                const SizedBox(width: 16),  // Memberikan jarak antara gambar dan teks
                
                Expanded( // Menggunakan Expanded agar teks mengambil sisa ruang yang tersedia di dalam Row
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Mengatur teks agar rata kiri
                    children: [// Menampilkan nama dan asal pesawat dengan gaya yang berbeda untuk membedakan informasi
                      Text(
                        widget.aircraft.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 4), // Memberikan jarak kecil antara nama dan asal pesawat

                      Text(
                        widget.aircraft.origin,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                // Menampilkan ikon panah kanan yang warnanya berubah saat di-hover atau ditekan 
                // untuk memberikan feedback visual tambahan
                Icon(   
                  Icons.chevron_right, 
                  color: _isActive ? Colors.indigo : Colors.grey
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}