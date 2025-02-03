import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_cash.dart';
import 'penyimpanan_cash.dart';
import 'dart:convert';

class CashPage extends StatefulWidget {
  const CashPage({super.key});

  @override
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  List<Income> incomes = [];

  @override
  void initState() {
    super.initState();
    _loadIncomes();
  }

  void _loadIncomes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? incomesData = prefs.getString('incomes');
    if (incomesData != null) {
      List<dynamic> decodedData = jsonDecode(incomesData);
      List<Income> loadedIncomes =
          decodedData.map((item) => Income.fromJson(item)).toList();
      setState(() {
        incomes = loadedIncomes;
      });
    }
  }

  void _saveIncomes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData =
        jsonEncode(incomes.map((income) => income.toJson()).toList());
    await prefs.setString('incomes', encodedData);
  }

  void _addIncome(Income income) {
    setState(() {
      incomes.add(income);
    });
    _saveIncomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
        title: const Text(
          'Cashes',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                'Rp. 1.300.300',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Income',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Colors.green, size: 30),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCashPage()),
                    );
                    if (result != null && result is Income) {
                      _addIncome(result);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: incomes.length,
                itemBuilder: (context, index) {
                  final income = incomes[index];
                  return IncomeTile(
                    amount: income.amount,
                    description: income.description,
                    date: income.date,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black, width: 1),
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Center(
                child: Text(
                  'Penting untuk memiliki tujuan keuangan yang jelas. Tujuan itu akan menjadi pemandumu dalam membuat keputusan finansial sehari-hari.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IncomeTile extends StatelessWidget {
  final String amount;
  final String description;
  final String date;

  const IncomeTile({
    required this.amount,
    required this.description,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          Text(
            date,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
