import 'package:flutter/material.dart';

class SwapWalletPage extends StatelessWidget {
  const SwapWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'E-Money',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Choose your E-Money',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'LinkAja');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.red),
                    const SizedBox(width: 10),
                    const Text('LinkAja', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'OVO');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.purple),
                    const SizedBox(width: 10),
                    const Text('OVO', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'DANA');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.lightBlue),
                    const SizedBox(width: 10),
                    const Text('DANA', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'Gopay');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Text('Gopay', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, 'ShopeePay');
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.orange),
                    const SizedBox(width: 10),
                    const Text('ShopeePay', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
