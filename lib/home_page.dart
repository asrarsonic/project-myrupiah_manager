import 'package:flutter/material.dart';
import 'profil_page.dart';
import 'calender_page.dart';
import 'login_page.dart';
import 'history_page.dart'; // Import history page
import 'notification.dart'; // Import notification page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
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
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.menu,
                              color: Colors.black, size: 24),
                          onSelected: (String value) {
                            if (value == 'Logout') {
                              _showLogoutConfirmationDialog(context);
                            } else if (value == 'Profile') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProfilePage()),
                              );
                            } else {
                              print("$value selected");
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'Profile',
                              child: Row(
                                children: const [
                                  Icon(Icons.person, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Profile',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'Contact Support',
                              child: Row(
                                children: const [
                                  Icon(Icons.contact_support, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Contact Support',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'Logout',
                              child: Row(
                                children: const [
                                  Icon(Icons.logout,
                                      size: 16, color: Colors.red),
                                  SizedBox(width: 4),
                                  Text(
                                    'Log Out',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            maxWidth: 200,
                          ),
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
                              color: Colors.black, size: 24),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotifikasiPage(),
                              ),
                            );
                          },
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
                        const SizedBox(width: 5),
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
                        const SizedBox(width: 5),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.black, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Main Content
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
                            _buildIconWithNavigation(context, Icons.fastfood,
                                'Food', Colors.blue, 'Food'),
                            const SizedBox(width: 45),
                            _buildIconWithNavigation(
                                context,
                                Icons.attach_money,
                                'Bills',
                                Colors.red,
                                'Bills'),
                            const SizedBox(width: 45),
                            _buildIconWithNavigation(context, Icons.diamond,
                                'Subscription', Colors.teal, 'Subscription'),
                            const SizedBox(width: 45),
                            _buildIconWithNavigation(
                                context,
                                Icons.local_hospital,
                                'Health',
                                Colors.orange,
                                'Health'),
                          ],
                        ),
                      ),
                      Positioned(
                        left: -30,
                        top: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithNavigation(
                                context,
                                Icons.shopping_cart,
                                'Shopping',
                                Colors.purple,
                                'Shopping'),
                            const SizedBox(height: 30),
                            _buildIconWithNavigation(
                                context,
                                Icons.family_restroom,
                                'Family',
                                Colors.cyan,
                                'Family'),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -30,
                        top: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithNavigation(
                                context,
                                Icons.directions_bus,
                                'Transport',
                                Colors.green,
                                'Transport'),
                            const SizedBox(height: 30),
                            _buildIconWithNavigation(context, Icons.school,
                                'Education', Colors.indigo, 'Education'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Menu
            Container(
              color: Colors.lightGreenAccent,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBottomMenuItem(Icons.account_balance_wallet, 'E-Money'),
                  _buildBottomMenuItem(Icons.account_balance, 'Budget'),
                  _buildBottomMenuItem(Icons.money, 'Cash'),
                  _buildBottomMenuItem(Icons.insert_chart, 'Financial report'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithNavigation(BuildContext context, IconData icon,
      String label, Color color, String category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionHistoryPage(),
          ),
        );
      },
      child: Column(
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
      ),
    );
  }

  Widget _buildBottomMenuItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.black, size: 24),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ],
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
