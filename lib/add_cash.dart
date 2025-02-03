import 'package:flutter/material.dart';
import 'penyimpanan_cash.dart';
import 'package:intl/intl.dart';
import 'notification.dart';

class AddCashPage extends StatefulWidget {
  const AddCashPage({super.key});

  @override
  _AddCashPageState createState() => _AddCashPageState();
}

class _AddCashPageState extends State<AddCashPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.lightGreenAccent,
              onPrimary: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text(
          'Add Wallet',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
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
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Initial Amount',
                hintText: 'Rp. 0',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Dates',
                hintText: 'Select Date',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today,
                      color: Colors.lightGreenAccent),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Exceptions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Ignore this wallet balance in the total balance'),
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
                  final income = Income(
                    amount: '+ Rp.${_amountController.text}',
                    description: _descriptionController.text,
                    date: _dateController.text,
                  );
                  Navigator.pop(context, income);
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
