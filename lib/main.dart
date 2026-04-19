import 'package:flutter/material.dart';
import 'pages/hangar_page.dart'; 

// menjalankan aplikasi dengan HangarPage sebagai halaman utama

void main() {
  runApp(const HangarApp());
}

class HangarApp extends StatelessWidget {
  const HangarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangar Information',
      
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        
        // Menerapkan font RobotoCondensed yang sudah didaftarkan di pubspec.yaml
        fontFamily: 'RobotoCondensed', 
        
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      home: const HangarPage(),
    );
  }
}