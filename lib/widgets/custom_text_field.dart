import 'dart:async';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;                   // Label untuk kolom pencarian (misalnya "Search Aircraft")
  final IconData prefixIcon;            // Ikon yang ditampilkan di dalam kolom pencarian (misalnya ikon pencarian)
  final ValueChanged<String> onChanged; // Callback yang dipanggil saat teks berubah, mengirimkan nilai teks yang baru
  final VoidCallback? onTyping;        // Callback opsional yang dipanggil saat user sedang mengetik (untuk fitur loading skeleton)

  const CustomTextField({
    super.key,
    required this.label,        // required untuk memastikan bahwa label harus diberikan saat membuat widget ini
    required this.prefixIcon,
    required this.onChanged,
    this.onTyping,            // onTyping bersifat opsional, sehingga tidak wajib diberikan
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Timer? _debounce;

  // Fitur Debounce: Menunggu 500ms setelah user berhenti mengetik 
  // sebelum menjalankan fungsi pencarian
  void _onSearchChanged(String query) {
    if (widget.onTyping != null) {
      widget.onTyping!(); // Panggil callback onTyping jika disediakan (untuk menampilkan loading skeleton)
    }

    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel(); // Penting: Hapus timer saat widget dihancurkan (Clean Code)
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onSearchChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}