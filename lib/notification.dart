import 'package:flutter/material.dart';
import 'package:myrupiah/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotifikasiPage(),
    );
  }
}

class NotifikasiPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "date": "29 September 2024",
      "time": "14:04",
      "message": "pengeluaran anda bulan ini sudah cukup teratur, lanjutkan :)",
    },
    {
      "date": "30 Oktober 2024",
      "time": "10:57",
      "message":
          "woww, tabungan anda sudah mencapai Rp. 1.234.432,00 , semangat !! :D",
    },
    {
      "date": "8 November 2024",
      "time": "15:46",
      "message":
          "hai, kami mempunyai rekomendasi hp baru buat kamu yang gamer !!",
    },
    {
      "date": "31 November 2024",
      "time": "23:59",
      "message":
          "sedikit lagi!!, ayo teruskan demi membeli laptop impian kamu :)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 253, 88),
        title: const Text('Notifikasi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 162, 253, 88),
              Colors.green.shade50,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 115, 228, 119),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification["date"]!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification["message"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        notification["time"]!,
                        style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
