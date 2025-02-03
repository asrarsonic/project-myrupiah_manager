import 'package:flutter/material.dart';
import 'package:myrupiah/addhistory.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'profil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionHistoryPage(),
    );
  }
}

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  List<Map<String, dynamic>> transactions = [
    {
      "date": "22",
      "day": "WEDNESDAY",
      "category": "Food",
      "type": "Card",
      "amount": "-Rp 25.500",
      "color": const Color.fromARGB(255, 15, 64, 104),
    },
    {
      "date": "17",
      "day": "TUESDAY",
      "category": "Bills",
      "type": "Card",
      "amount": "-Rp 200.000",
      "color": Colors.pink,
    },
    {
      "date": "17",
      "day": "TUESDAY",
      "category": "Food",
      "type": "Card",
      "amount": "-Rp 50.000",
      "color": const Color.fromARGB(255, 15, 64, 104),
    },
    {
      "date": "15",
      "day": "MONDAY",
      "category": "Food",
      "type": "Card",
      "amount": "-Rp 33.700",
      "color": const Color.fromARGB(255, 15, 64, 104),
    },
    {
      "date": "15",
      "day": "MONDAY",
      "category": "Bills",
      "type": "Card",
      "amount": "-Rp 157.400",
      "color": Colors.pink,
    },
    {
      "date": "14",
      "day": "SATURDAY",
      "category": "Bills",
      "type": "Card",
      "amount": "-Rp 200.000",
      "color": Colors.pink,
    },
  ];

  void deleteTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 253, 88),
        elevation: 0,
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'profile',
              child: Row(
                children: const [
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Profile'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'support',
              child: Row(
                children: const [
                  Icon(Icons.support_agent, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Contact Support'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'logout',
              child: Row(
                children: const [
                  Icon(Icons.logout, color: Colors.red),
                  SizedBox(width: 10),
                  Text('Log Out', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'profile') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            } else if (value == 'support') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact Support clicked')),
              );
            } else if (value == 'logout') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          },
        ),
        title: const Text(
          "Transaction History",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 144, 245, 62),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: const Column(
              children: [
                Text(
                  "Rp1.234.432,00",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
                    SizedBox(width: 4),
                    Text(
                      "SEPTEMBER 2024",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.black),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                final isNewDate = index == 0 ||
                    transaction["date"] != transactions[index - 1]["date"];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isNewDate)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        color: Colors.grey.shade300,
                        width: double.infinity,
                        child: Text(
                          "${transaction['day']} ${transaction['date']} SEPTEMBER 2024",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: transaction["color"] as Color,
                          child: Icon(
                            transaction["category"] == "Food"
                                ? Icons.fastfood
                                : Icons.receipt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction["category"] as String,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                transaction["type"] as String,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          transaction["amount"] as String,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Konfirmasi'),
                                  content: const Text(
                                      'Yakin ingin menghapus transaksi ini?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        deleteTransaction(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Hapus'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHistoryPage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 193, 255, 193),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
