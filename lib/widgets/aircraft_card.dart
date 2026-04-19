import 'package:flutter/material.dart';
import '../models/aircraft.dart';

class AircraftCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: isLoading ? _buildSkeleton() : _buildContent(),
    );
  }

  // UI saat sedang loading (Skeleton)
  Widget _buildSkeleton() {
    return Row(
      children: [
        Container(width: 100, height: 80, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12))),
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
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(aircraft!.imagePath, width: 100, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(aircraft!.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(aircraft!.origin, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}