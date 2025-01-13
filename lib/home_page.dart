import 'package:flutter/material.dart';
import 'calender_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              color: Colors.lightGreenAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu,
                              color: Colors.black, size: 28),
                          onPressed: () {},
                        ),
                        const Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: Colors.black, size: 28),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Rp1.234.432,00',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios,
                            color: Colors.black, size: 16),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CalendarPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'SEPTEMBER 2024',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.black, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 320,
                  height: 400,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        child: Image.asset(
                          'images/statistik_pengeluaran.png',
                          width: 230,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildIconWithLabelAbove(
                                Icons.fastfood, 'Food', Colors.blue),
                            const SizedBox(width: 45),
                            _buildIconWithLabelAbove(
                                Icons.attach_money, 'Bills', Colors.red),
                            const SizedBox(width: 45),
                            _buildIconWithLabelAbove(
                                Icons.diamond, 'Subscription', Colors.teal),
                            const SizedBox(width: 45),
                            _buildIconWithLabelAbove(
                                Icons.local_hospital, 'Health', Colors.orange),
                          ],
                        ),
                      ),
                      Positioned(
                        left: -30,
                        top: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithLabelAbove(
                                Icons.shopping_cart, 'Shopping', Colors.purple),
                            const SizedBox(height: 30),
                            _buildIconWithLabelAbove(
                                Icons.family_restroom, 'Family', Colors.cyan),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -30,
                        top: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithLabelAbove(Icons.directions_bus,
                                'Transport', Colors.green),
                            const SizedBox(height: 30),
                            _buildIconWithLabelAbove(
                                Icons.school, 'Education', Colors.indigo),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.lightGreenAccent,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomMenuItem(Icons.account_balance_wallet, 'E-Money'),
                  _buildBottomMenuItem(Icons.account_balance, 'Budget'),
                  _buildBottomMenuItem(Icons.money, 'Cash'),
                  _buildBottomMenuItem(Icons.more_horiz, 'Other'),
                  _buildBottomMenuItem(Icons.nature, 'BNW'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabelAbove(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildBottomMenuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
