import 'package:flutter/material.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({Key? key}) : super(key: key);

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  String selectedMonth = 'January';
  String selectedYear = '2025';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 137, 247, 64),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'Budget',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _buildDropdown(selectedMonth, [
                                      'January',
                                      'February',
                                      'March',
                                      'April',
                                      'May',
                                      'June',
                                      'July',
                                      'August',
                                      'September',
                                      'October',
                                      'November',
                                      'December'
                                    ], (value) {
                                      setState(() {
                                        selectedMonth = value!;
                                      });
                                    }),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: _buildDropdown(selectedYear, [
                                      '2024',
                                      '2025',
                                      '2026',
                                      '2027',
                                      '2028',
                                      '2029',
                                      '2030'
                                    ], (value) {
                                      setState(() {
                                        selectedYear = value!;
                                      });
                                    }),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Category',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text('Budget Amount',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            _buildBudgetInputField('Bills'),
                            _buildBudgetInputField('Shopping'),
                            _buildBudgetInputField('Education'),
                            _buildBudgetInputField('Subscription'),
                            _buildBudgetInputField('Health'),
                            _buildBudgetInputField('Food'),
                            _buildBudgetInputField('Family'),
                            _buildBudgetInputField('Transport'),
                            _buildBudgetInputField('Other'),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildButton(
                                'Cancel',
                                const Color.fromARGB(255, 190, 190, 190),
                                () => Navigator.pop(context)),
                            _buildButton('Add Budget',
                                const Color.fromARGB(255, 117, 247, 57), () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetInputField(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(category),
          SizedBox(
            width: 120,
            child: Row(
              children: [
                const Text('Rp'),
                const SizedBox(width: 4),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      border: UnderlineInputBorder(),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
      String value, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: value,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
