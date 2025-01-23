import 'package:flutter/material.dart';
import 'package:myrupiah/history_page.dart';
import 'package:myrupiah/notification.dart';

class AddHistoryPage extends StatefulWidget {
  @override
  _AddHistoryPageState createState() => _AddHistoryPageState();
}

class _AddHistoryPageState extends State<AddHistoryPage> {
  String? selectedCategory;
  String? selectedWallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB2FF59),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TransactionHistoryPage()));
          },
        ),
        title: Text(
          'ADD HISTORY',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotifikasiPage()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                labelStyle: TextStyle(color: Colors.black),
                hintText: '15/10/2024',
                hintStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.black),
                prefixText: 'Rp. ',
                border: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Category',
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
              ),
              value: selectedCategory,
              items: [
                _buildCategoryMenuItem(
                    'Bills', Icons.attach_money, Color(0xFFFE9797)),
                _buildCategoryMenuItem(
                    'Shopping', Icons.shopping_cart, Colors.blue),
                _buildCategoryMenuItem('Education', Icons.school, Colors.red),
                _buildCategoryMenuItem(
                    'Subscription', Icons.diamond, Colors.cyan),
                _buildCategoryMenuItem('Health', Icons.favorite, Colors.orange),
                _buildCategoryMenuItem(
                    'Food', Icons.restaurant, Color(0xFF0C3C84)),
                _buildCategoryMenuItem('Family', Icons.people, Colors.purple),
                _buildCategoryMenuItem(
                    'Transport', Icons.directions_bus, Colors.green),
                _buildCategoryMenuItem('Other', Icons.more_horiz, Colors.grey),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              menuMaxHeight: 250,
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Wallet',
                labelStyle: TextStyle(color: Colors.black),
                border: UnderlineInputBorder(),
              ),
              value: selectedWallet,
              items: [
                _buildWalletMenuItem('Link Aja!', Icons.link, Colors.red),
                _buildWalletMenuItem(
                    'OVO', Icons.account_balance_wallet, Color(0xFF4B3499)),
                _buildWalletMenuItem(
                    'Dana', Icons.account_balance_wallet, Colors.blue),
                _buildWalletMenuItem(
                    'Gopay', Icons.account_balance_wallet, Colors.blue),
                _buildWalletMenuItem(
                    'ShopeePay', Icons.shopping_bag, Colors.orange),
                _buildWalletMenuItem('Cash', Icons.money, Colors.green),
              ],
              onChanged: (value) {
                setState(() {
                  selectedWallet = value;
                });
              },
              menuMaxHeight: 250,
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TransactionHistoryPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text('Cancel', style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TransactionHistoryPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB2FF59),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text('Confirm', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildCategoryMenuItem(
      String text, IconData icon, Color color) {
    return DropdownMenuItem<String>(
      value: text,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              SizedBox(width: 10),
              Text(text),
            ],
          ),
          Icon(
            Icons.radio_button_unchecked,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> _buildWalletMenuItem(
      String text, IconData icon, Color color) {
    return DropdownMenuItem<String>(
      value: text,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              SizedBox(width: 10),
              Text(text),
            ],
          ),
          Icon(
            Icons.radio_button_unchecked,
            size: 20,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
