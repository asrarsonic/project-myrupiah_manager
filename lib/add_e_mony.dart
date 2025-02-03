import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'ee_mony.dart';

class AddEMoneyPage extends StatefulWidget {
  const AddEMoneyPage({super.key});

  @override
  _AddEMoneyPageState createState() => _AddEMoneyPageState();
}

class _AddEMoneyPageState extends State<AddEMoneyPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String selectedEMoney = 'Gopay';

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
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _showEMoneyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select E-Money'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEMoney = 'ShopeePay';
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.orange),
                      const SizedBox(width: 10),
                      const Text('ShopeePay'),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEMoney = 'OVO';
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.purple),
                      const SizedBox(width: 10),
                      const Text('OVO'),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEMoney = 'Gopay';
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.blue),
                      const SizedBox(width: 10),
                      const Text('Gopay'),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEMoney = 'LinkAja';
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: Colors.red),
                      const SizedBox(width: 10),
                      const Text('LinkAja'),
                    ],
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEMoney = 'Dana';
                    });
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: Colors.lightBlue),
                      const SizedBox(width: 10),
                      const Text('Dana'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Add Wallet',
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
            onPressed: () {},
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
            TextField(
              controller: TextEditingController(text: selectedEMoney),
              decoration: InputDecoration(
                labelText: 'E-Money',
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down,
                      color: Colors.lightGreenAccent),
                  onPressed: _showEMoneyDialog,
                ),
              ),
              readOnly: true,
              onTap: _showEMoneyDialog,
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
                  final eMoney = EMoney(
                    name: selectedEMoney,
                    amount: '+ Rp.${_amountController.text}',
                    description: _descriptionController.text,
                    date: _dateController.text,
                  );
                  Navigator.pop(context, eMoney);
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
