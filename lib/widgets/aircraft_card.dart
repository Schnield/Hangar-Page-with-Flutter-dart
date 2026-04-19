import 'package:flutter/material.dart';
import '../models/aircraft.dart';

class AircraftCard extends StatefulWidget {
  final Aircraft? aircraft;
  final bool isLoading; // Jika true, tampilkan Skeleton
  final VoidCallback? onTap;

  const AircraftCard({
    super.key,
    this.aircraft,
    this.isLoading = false,
    this.onTap,
  });

  @override
  State<AircraftCard> createState() => _AircraftCardState();
}

class _AircraftCardState extends State<AircraftCard> {
  bool _isActive = false; // State untuk mengontrol tampilan skeleton saat mengetik

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return _buildBaseContainer(child: _buildSkeleton());
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isActive = true),
      onExit: (_) => setState(() => _isActive = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isActive = true),
        onTapUp: (_) => setState(() => _isActive = false),
        onTapCancel: () => setState(() => _isActive = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isActive ? 1.05 : 1.0, // Efek zoom saat hover/tap aktif 1.05 atau normal 1.0/false
          duration: const Duration(milliseconds: 200), // Durasi animasi zoom
          child: _buildBaseContainer (
            isActive : _isActive, // Kirim state isActive ke _buildBaseContainer untuk mengubah warna saat hover/tap
            child: _buildContent(), // Konten utama card (gambar, nama, asal)
          ),
        ),
      ),
  );
  }

  Widget _buildBaseContainer({required Widget child, bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo[50] : Colors.white, // Warna berubah saat hover/tap
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: isActive ? 0.3 : 0.1), // Shadow lebih gelap saat hover/tap
            blurRadius: isActive ? 20 : 10, // Shadow lebih besar saat hover/tap
            offset: Offset(0, isActive ? 10 : 5), // Shadow lebih jauh saat hover/tap
          ),
        ],
      ),
      child: child,
    );
  }

  // UI saat sedang loading (Skeleton)
  Widget _buildSkeleton() {
    return Row(
      children: [
        Container(
          width: 100, 
          height: 80, 
          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12))
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(width: 150, height: 20, color: Colors.grey[300]),
              const SizedBox(height: 8),
              Container(width: 100, height: 15, color: Colors.grey[300]),
            ],
          ),
        ),
      ],
    );
  }

  // UI Card saat data sudah tersedia
  Widget _buildContent() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(widget.aircraft!.imagePath, width: 100, height: 80, fit: BoxFit.cover),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.aircraft!.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(widget.aircraft!.origin, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: _isActive ? Colors.indigo : Colors.grey
        ), // Ikon panah berubah warna saat hover/tap
      ],
    );
  }
}