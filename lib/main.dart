import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // Tambahkan ini
import 'splash_screen.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  debugPaintSizeEnabled = true; // Aktifkan debug paint size
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyRupiah Manager',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
