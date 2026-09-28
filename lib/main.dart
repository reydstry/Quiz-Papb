import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // ilangin debug diatas kanan
      debugShowCheckedModeBanner: false,

      //judul aplikasi
      title: 'Reys Clothes',

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC52A2A),
          brightness: Brightness.dark,
        ),
      ),

      // manggil halaman home
      home: const HomePage(),
    );
  }
}
