import 'package:flutter/material.dart';
import 'profil_page.dart';
import 'calender_page.dart';
import 'login_page.dart';
import 'history_page.dart';
import 'notification.dart';
import 'setbudget.dart';
import 'financial_report.dart';
import 'cash.dart';
import 'e_mony.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentMonth = 'SEPTEMBER';
  String currentYear = '2024';

  // Sample Data - Replace with your actual data
  final Map<String, double> categoryValues = {
    'Food': 20,
    'Bills': 15,
    'Subscription': 10,
    'Health': 12,
    'Shopping': 18,
    'Transport': 7,
    'Family': 10,
    'Education': 8,
  };

  List<PieChartSectionData> _generatePieChartSections() {
    List<PieChartSectionData> sections = [];

    categoryValues.forEach((category, value) {
      final color = _getCategoryColor(category);
      sections.add(
        PieChartSectionData(
          color: color,
          value: value,
          title: '', // Tidak menampilkan angka

          radius: 15, // Slightly larger radius
        ),
      );
    });
    return sections;
  }

  Color _getCategoryColor(String category) {
    // Customize colors for each category
    switch (category) {
      case 'Food':
        return Colors.blue;
      case 'Bills':
        return Colors.red;
      case 'Subscription':
        return Colors.teal;
      case 'Health':
        return Colors.orange;
      case 'Shopping':
        return Colors.purple;
      case 'Transport':
        return Colors.green;
      case 'Family':
        return Colors.cyan;
      case 'Education':
        return Colors.indigo;
      default:
        return Colors.grey;
    }
  }

  Widget _buildPieChart() {
    return Column(
      children: [
        // Bagian Pie Chart
        SizedBox(
          width: 300, // Increased size
          height: 230,
          child: PieChart(
            PieChartData(
              sections: _generatePieChartSections(),
              sectionsSpace: 0, // Jarak antar sektor
              centerSpaceRadius: 80, // Membuat efek donut
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              color: const Color.fromARGB(255, 144, 245, 62),
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
                    // Di HomePage, ubah bagian TextButton menjadi:
                    TextButton(
                      onPressed: () async {
                        // Tunggu hasil dari CalendarPage
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalendarPage(
                              initialMonth: currentMonth,
                              initialYear: currentYear,
                            ),
                          ),
                        );

                        if (result != null) {
                          setState(() {
                            currentMonth = result['month'];
                            currentYear = result['year'];
                          });
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$currentMonth $currentYear',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
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
                        top: 30,
                        child: _buildPieChart(),
                      ),
                      Positioned(
                        top: -60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildIconWithNavigation(context, Icons.fastfood,
                                'Food', Colors.blue, 'Food'),
                            const SizedBox(width: 35),
                            _buildIconWithNavigation(
                                context,
                                Icons.attach_money,
                                'Bills',
                                Colors.red,
                                'Bills'),
                            const SizedBox(width: 35),
                            _buildIconWithNavigation(context, Icons.diamond,
                                'Subscription', Colors.teal, 'Subscription'),
                            const SizedBox(width: 35),
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
                        left: -20,
                        top: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithNavigation(
                                context,
                                Icons.shopping_cart,
                                'Shopping',
                                Colors.purple,
                                'Shopping'),
                            const SizedBox(height: 35),
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
                        right: -20,
                        top: 35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildIconWithNavigation(
                                context,
                                Icons.directions_bus,
                                'Transport',
                                Colors.green,
                                'Transport'),
                            const SizedBox(height: 35),
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
            Container(
              color: const Color.fromARGB(255, 144, 245, 62),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EMoneyPage(),
                        ),
                      );
                    },
                    child: _buildBottomMenuItem(
                        Icons.account_balance_wallet, 'E-Money'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BudgetActivityPage(),
                        ),
                      );
                    },
                    child:
                        _buildBottomMenuItem(Icons.account_balance, 'Budget'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CashPage(),
                        ),
                      );
                    },
                    child: _buildBottomMenuItem(Icons.money, 'Cash'),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FinancialReportPage(),
                        ),
                      );
                    },
                    child: _buildBottomMenuItem(
                        Icons.insert_chart, 'Financial report'),
                  )
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
