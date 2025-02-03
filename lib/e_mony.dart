import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'swap_wallet.dart';
import 'add_e_mony.dart';
import 'ee_mony.dart';
import 'notification.dart';
import 'dart:convert';

class EMoneyPage extends StatefulWidget {
  const EMoneyPage({super.key});

  @override
  _EMoneyPageState createState() => _EMoneyPageState();
}

class _EMoneyPageState extends State<EMoneyPage> {
  List<EMoney> eMonies = [];

  @override
  void initState() {
    super.initState();
    _loadEMonies();
  }

  void _loadEMonies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? eMoniesData = prefs.getString('eMonies');
    if (eMoniesData != null) {
      List<dynamic> decodedData = jsonDecode(eMoniesData);
      List<EMoney> loadedEMonies =
          decodedData.map((item) => EMoney.fromJson(item)).toList();
      setState(() {
        eMonies = loadedEMonies;
      });
    }
  }

  void _saveEMonies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData =
        jsonEncode(eMonies.map((eMoney) => eMoney.toJson()).toList());
    await prefs.setString('eMonies', encodedData);
  }

  void _addEMoney(EMoney eMoney) {
    setState(() {
      eMonies.add(eMoney);
    });
    _saveEMonies();
  }

  String currentEMoney = 'Gopay';

  void _swapWallet(String newEMoney) {
    setState(() {
      currentEMoney = newEMoney;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 66, 224, 30),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 66, 224, 30),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_balance_wallet, color: Colors.white),
                    const SizedBox(width: 8.0),
                    Text(
                      currentEMoney,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Rp. 1.300.300',
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, size: 40.0, color: Colors.blue),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddEMoneyPage()),
                        );
                        if (result != null && result is EMoney) {
                          _addEMoney(result);
                        }
                      },
                    ),
                    const Text('Add Wallet',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.swap_horiz,
                          size: 40.0, color: Colors.blue),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SwapWalletPage()),
                        );
                        if (result != null) {
                          _swapWallet(result);
                        }
                      },
                    ),
                    const Text('Swap Wallet',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: eMonies.length,
              itemBuilder: (context, index) {
                final eMoney = eMonies[index];
                return TransactionTile(
                  amount: eMoney.amount,
                  date: eMoney.date,
                  description: eMoney.description,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Penting untuk memiliki tujuan keuangan yang jelas. Tujuan itu akan menjadi pemandumu dalam membuat keputusan finansial sehari-hari.',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String amount;
  final String date;
  final String description;

  const TransactionTile({
    required this.amount,
    required this.date,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.attach_money, color: Colors.green),
        title: Text(amount, style: TextStyle(color: Colors.green)),
        subtitle: Text(description),
        trailing: Text(date),
      ),
    );
  }
}
