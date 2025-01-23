import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreenAccent, // Hijau di atas
              Colors.white, // Putih di bawah
            ],
          ),
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, // Agar konten tidak terpotong
              children: [
                // Latar Hijau
                Container(
                  height: 180, // Tinggi latar hijau dinaikkan
                  color: Colors.lightGreenAccent,
                ),
                // Tombol Back
                Positioned(
                  top: 40, // Posisi di bagian atas
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Navigasi ke halaman sebelumnya
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black, // Warna ikon hitam
                      size: 24,
                    ),
                  ),
                ),
                // Kotak Putih
                Positioned(
                  top: 100, // Jarak dari atas diperbesar
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 50, // Ukuran avatar
                          backgroundColor: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 50, // Ukuran ikon di dalam avatar
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Nama
                        const Text(
                          'Anonym',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 150), // Memberi ruang tambahan setelah kotak putih
            // Total Expenditure
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Expenditure',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Rp -271.000.000.000',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Logo MyRupiah
            Column(
              children: [
                const SizedBox(height: 10),
                Image.asset(
                  'images/logoapk.png', // Sesuaikan dengan file logo yang Anda miliki
                  height: 300,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
